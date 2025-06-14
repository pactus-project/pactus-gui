#!/usr/bin/env bash

set -euo pipefail

TAG_NAME="${1:-local}"
OUTPUT_NAME="PactusGUI-${TAG_NAME}-linux-arm64.AppImage"
APPDIR="AppDir"
PACTUS_CLI_URL="https://github.com/pactus-project/pactus/releases/download/v1.7.1/pactus-cli_1.7.1_linux_arm64.tar.gz"
FINAL_CLI_DEST="$APPDIR/usr/bin/lib/src/core/native_resources/linux"

install_dependencies() {
  echo "🔧 Installing dependencies..."
  sudo apt-get update
  sudo apt-get install -y libgtk-3-dev cmake ninja-build wget appstream tree patchelf
}

build_flutter_linux() {
  echo "🔨 Building Flutter app for Linux ARM64..."
  flutter pub get
  flutter build linux --release
}

prepare_appdir() {
  echo "📁 Preparing AppDir..."
  rm -rf "$APPDIR"
  mkdir -p "$APPDIR/usr/bin"

  cp -r build/linux/arm64/release/bundle/* "$APPDIR/usr/bin/"
  cp linux/pactus_gui.desktop "$APPDIR/"
  cp linux/pactus_gui.png "$APPDIR/"

  echo "✏️ Creating custom AppRun..."
  cat << 'EOF' > "$APPDIR/AppRun"
#!/bin/bash
HERE="$(dirname "$(readlink -f "$0")")"
export PACTUS_NATIVE_RESOURCES="$HERE/usr/bin/lib/src/core/native_resources/linux"
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
}

download_linuxdeploy() {
  echo "⬇️ Downloading ARM64 linuxdeploy..."
  wget -q https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-aarch64.AppImage
  chmod +x linuxdeploy-aarch64.AppImage
}

build_appimage() {
  echo "📦 Building AppImage with linuxdeploy..."
  ./linuxdeploy-aarch64.AppImage \
    --appdir "$APPDIR" \
    --desktop-file "$APPDIR/pactus_gui.desktop" \
    --icon-file "$APPDIR/pactus_gui.png" \
    --output appimage

  GENERATED_APPIMAGE=$(find . -maxdepth 1 -type f -name "*.AppImage" | head -n 1)

  if [[ ! -f "$GENERATED_APPIMAGE" ]]; then
    echo "❌ AppImage build failed: No AppImage file found."
    exit 1
  fi

  mkdir -p artifacts
  TARGET_PATH="artifacts/${OUTPUT_NAME}"
  mv "$GENERATED_APPIMAGE" "$TARGET_PATH"
  chmod +x "$TARGET_PATH"
  echo "✅ AppImage saved to $TARGET_PATH"
}

install_dependencies
build_flutter_linux
prepare_appdir
download_and_extract_pactus_cli
download_linuxdeploy
build_appimage
