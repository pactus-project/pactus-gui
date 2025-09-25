#!/usr/bin/env bash

set -euo pipefail

# Config
TAG_NAME="${1:-local}"
ARCH="arm64"
APPDIR="AppDir"
OUTPUT_NAME="PactusGUI-${TAG_NAME}-linux-${ARCH}.AppImage"
PACTUS_CLI_URL="https://github.com/pactus-project/pactus/releases/download/v1.9.0/pactus-cli_1.9.0_linux_arm64.tar.gz"
FINAL_CLI_DEST="$APPDIR/usr/bin/lib/src/core/native_resources/linux"
APPIMAGE_TOOL="appimagetool-aarch64.AppImage"

install_dependencies() {
  echo "🔧 Installing system dependencies..."
  sudo apt-get update
  sudo apt-get install -y \
    libgtk-3-dev cmake ninja-build wget \
    appstream tree patchelf libfuse2 desktop-file-utils zsync || true
}

build_flutter_linux() {
  echo "🔨 Building Flutter app for Linux ${ARCH}..."
  flutter pub get
  flutter build linux --release
}

prepare_appdir() {
  echo "📁 Preparing AppDir structure..."
  rm -rf "$APPDIR"
  mkdir -p "$APPDIR/usr/bin"

  cp -r build/linux/${ARCH}/release/bundle/* "$APPDIR/usr/bin/"
  cp linux/pactus_gui.desktop "$APPDIR/"
  cp linux/pactus_gui.png "$APPDIR/"

  echo "✏️ Creating AppRun launcher..."
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

  TEMP_EXTRACT_DIR="pactus-cli-temp"
  rm -rf "$TEMP_EXTRACT_DIR"
  mkdir -p "$TEMP_EXTRACT_DIR"
  tar -xzvf pactus-cli.tar.gz --strip-components=1 -C "$TEMP_EXTRACT_DIR"

  echo "🚚 Moving to final destination: $FINAL_CLI_DEST"
  mkdir -p "$FINAL_CLI_DEST"
  mv "$TEMP_EXTRACT_DIR"/* "$FINAL_CLI_DEST"/
  rm -rf "$TEMP_EXTRACT_DIR"
}

download_appimagetool() {
  echo "⬇️ Downloading AppImageTool for ARM64..."
  wget -q "https://github.com/AppImage/appimagetool/releases/download/continuous/${APPIMAGE_TOOL}"
  chmod +x "${APPIMAGE_TOOL}"
}

build_appimage() {
  echo "🚀 Building AppImage with ${APPIMAGE_TOOL}..."
  ARCH=aarch64 ./${APPIMAGE_TOOL} "$APPDIR"

  GENERATED_APPIMAGE=$(find . -maxdepth 1 -type f -name "*.AppImage" | head -n 1)
  if [[ ! -f "$GENERATED_APPIMAGE" ]]; then
    echo "❌ AppImage build failed!"
    exit 1
  fi

  mkdir -p artifacts
  mv "$GENERATED_APPIMAGE" "artifacts/$OUTPUT_NAME"
  chmod +x "artifacts/$OUTPUT_NAME"

  echo "✅ AppImage created: artifacts/$OUTPUT_NAME"

  echo "🔍 Verifying contents..."
  cp "artifacts/$OUTPUT_NAME" unpack-test.AppImage
  chmod +x unpack-test.AppImage
  ./unpack-test.AppImage --appimage-extract
  tree squashfs-root/
}

# ------------------------
# MAIN EXECUTION
# ------------------------

install_dependencies
build_flutter_linux
prepare_appdir
download_and_extract_pactus_cli
download_appimagetool
build_appimage