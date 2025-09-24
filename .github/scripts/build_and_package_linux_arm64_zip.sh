#!/usr/bin/env bash

set -euo pipefail

# ------------------------
# CONFIGURATION
# ------------------------

TAG_NAME="${1:-local}"
ARCH="arm64"
BUILD_DIR="$(pwd)/build/linux/${ARCH}/release/bundle"
OUTPUT_DIR="$(pwd)/artifacts/linux/${ARCH}/release/bundle"
ROOT_OUTPUT_DIR="$(pwd)/artifacts"
OUTPUT_NAME="PactusGUI-${TAG_NAME}-linux-${ARCH}.zip"
PACTUS_CLI_URL="https://github.com/pactus-project/pactus/releases/download/v1.9.0/pactus-cli_1.9.0_linux_arm64.tar.gz"
FINAL_CLI_DEST="${BUILD_DIR}/lib/src/core/native_resources/linux"

# ------------------------
# FUNCTIONS
# ------------------------

install_dependencies() {
  echo "🔧 Installing dependencies..."
  sudo apt-get update
  sudo apt-get install -y wget unzip tree zip libgtk-3-dev cmake ninja-build || true
}

build_flutter_linux() {
  echo "🔨 Building Flutter app for Linux ${ARCH}..."
  flutter pub get
  flutter build linux --release

  echo "📂 Listing build output directory..."
  if command -v tree &> /dev/null; then
    tree "$BUILD_DIR"
  else
    ls -lR "$BUILD_DIR"
  fi
}

download_and_extract_pactus_cli() {
  echo "⬇️ Downloading pactus-cli..."
  wget -q "$PACTUS_CLI_URL" -O pactus-cli.tar.gz

  echo "📦 Extracting pactus-cli to ${FINAL_CLI_DEST}..."
  mkdir -p "$FINAL_CLI_DEST"
  tar -xzvf pactus-cli.tar.gz --strip-components=1 -C "$FINAL_CLI_DEST"

  echo "📂 pactus-cli contents:"
  if command -v tree &> /dev/null; then
    tree "$FINAL_CLI_DEST"
  else
    ls -lR "$FINAL_CLI_DEST"
  fi
}

package_release_zip() {
  echo "📦 Packaging final zip file..."
  mkdir -p "$OUTPUT_DIR"
  ZIP_PATH="$OUTPUT_DIR/$OUTPUT_NAME"
  (
    cd "$BUILD_DIR"
    zip -r "$ZIP_PATH" .
  )
  echo "✅ Zip package saved to: $ZIP_PATH"

  echo "📁 Copying zip to artifacts root..."
  mkdir -p "$ROOT_OUTPUT_DIR"
  cp "$ZIP_PATH" "$ROOT_OUTPUT_DIR/"

  echo "📂 Listing final artifact zip:"
  ls -lh "$ROOT_OUTPUT_DIR/$OUTPUT_NAME"
}

# ------------------------
# MAIN
# ------------------------

install_dependencies
build_flutter_linux
download_and_extract_pactus_cli
package_release_zip
