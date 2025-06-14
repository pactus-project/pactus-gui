#!/usr/bin/env bash

set -euo pipefail

# --------------------------------------
# CONFIGURATION
# --------------------------------------

TAG_NAME="${1:-local}"  # Use first argument as tag or fallback to 'local'
OUTPUT_NAME="PactusGUI-${TAG_NAME}-linux-amd64.AppImage"
APPDIR="AppDir"
PACTUS_CLI_URL="https://github.com/pactus-project/pactus/releases/download/v1.7.1/pactus-cli_1.7.1_linux_amd64.tar.gz"
FINAL_CLI_DEST="$APPDIR/usr/bin/lib/src/core/native_resources/linux"

LINUXDEPLOY_VERSION="v1.10.1"
LINUXDEPLOY_URL="https://github.com/linuxdeploy/linuxdeploy/releases/download/${LINUXDEPLOY_VERSION}/linuxdeploy-x86_64.AppImage"
LINUXDEPLOY_PLUGIN_GTK_URL="https://github.com/linuxdeploy/linuxdeploy-plugin-gtk/releases/download/${LINUXDEPLOY_VERSION}/linuxdeploy-plugin-gtk.sh"

# --------------------------------------
# FUNCTIONS
# --------------------------------------

install_dependencies() {
  echo "🔧 Installing dependencies..."
  sudo apt-get update
  sudo apt-get install -y \
    libgtk-3-dev libfuse2 cmake ninja-build wget appstream tree desktop-file-utils patchelf || true
}

build_flutter_linux() {
  echo "🔨 Building Flutter app for Linux AMD64..."
  flutter pub get
  flutter build linux --release
}

prepare_appdir() {
  echo "📁 Preparing AppDir..."
  rm -rf "$APPDIR"
  mkdir -p "$APPDIR/usr/bin"

  cp -r build/linux/x64/release/bundle/* "$APPDIR/usr/bin/"
  cp linux/pactus_gui.desktop "$APPDIR/"
  cp linux/pactus_gui.png "$APPDIR/"

  # Ensure the main binary is executable
  chmod +x "$APPDIR/usr/bin/pactus_gui"

  echo "✏️ Creating custom AppRun..."
  cat << 'EOF' > "$APPDIR/AppRun"
#!/bin/bash
set -e
HERE="$(dirname "$(readlink -f "$0")")"
export PACTUS_NATIVE_RESOURCES="$HERE/usr/bin/lib/src/core/native_resources/linux"
echo "PACTUS_NATIVE_RESOURCES=$PACTUS_NATIVE_RESOURCES"
echo "Running: $HERE/usr/bin/pactus_gui $*"
exec "$HERE/usr/bin/pactus_gui" "$@"
EOF
  chmod +x "$APPDIR/AppRun"
}

download_and_extract_pactus_cli() {
  echo "⬇️ Downloading pactus-cli..."
  wget -q "$PACTUS_CLI_URL" -O pactus-cli.tar.gz

  echo "📦 Extracting pactus-cli..."
  mkdir -p "$FINAL_CLI_DEST"
  tar -xzvf pactus-cli.tar.gz --strip-components=1 -C "$FINAL_CLI_DEST"

  # Make sure extracted binaries are executable
  find "$FINAL_CLI_DEST" -type f -exec chmod +x {} +
}

download_linuxdeploy_and_plugins() {
  echo "⬇️ Downloading linuxdeploy v${LINUXDEPLOY_VERSION}..."
  wget -q "$LINUXDEPLOY_URL" -O linuxdeploy-x86_64.AppImage
  chmod +x linuxdeploy-x86_64.AppImage

  echo "⬇️ Downloading linuxdeploy-plugin-gtk v${LINUXDEPLOY_VERSION}..."
  wget -q "$LINUXDEPLOY_PLUGIN_GTK_URL" -O linuxdeploy-plugin-gtk.sh
  chmod +x linuxdeploy-plugin-gtk.sh
}

build_appimage() {
  echo "📦 Building AppImage with linuxdeploy and gtk plugin..."

  ./linuxdeploy-x86_64.AppImage \
    --appdir "$APPDIR" \
    --desktop-file "$APPDIR/pactus_gui.desktop" \
    --icon-file "$APPDIR/pactus_gui.png" \
    --plugin gtk \
    --output appimage

  GENERATED_APPIMAGE=$(find . -maxdepth 1 -type f -name "*.AppImage" | head -n 1)

  if [[ ! -f "$GENERATED_APPIMAGE" ]]; then
    echo "❌ AppImage build failed: No AppImage file found."
    exit 1
  fi

  mkdir -p artifacts
  TARGET_PATH="artifacts/${OUTPUT_NAME}"

  echo "📦 Moving $GENERATED_APPIMAGE to $TARGET_PATH"
  mv "$GENERATED_APPIMAGE" "$TARGET_PATH"
  chmod +x "$TARGET_PATH"

  echo "✅ AppImage saved to $TARGET_PATH"
}

# --------------------------------------
# MAIN EXECUTION
# --------------------------------------

install_dependencies
build_flutter_linux
prepare_appdir
download_and_extract_pactus_cli
download_linuxdeploy_and_plugins
build_appimage
