#!/usr/bin/env bash

set -euo pipefail

# ------------------------
# CONFIGURATION
# ------------------------

TAG_NAME="${1:-local}"
ARCH="arm64"
BUILD_DIR="$(pwd)/build/macos/Build/Products/Release"
OUTPUT_DIR="$(pwd)/artifacts/macos/${ARCH}"
ROOT_OUTPUT_DIR="$(pwd)/artifacts"
OUTPUT_NAME="PactusGUI-${TAG_NAME}-macos-${ARCH}.zip"
PACTUS_CLI_URL="https://github.com/pactus-project/pactus/releases/download/v1.7.1/pactus-cli_1.7.1_darwin_arm64.tar.gz"
FINAL_CLI_DEST="${BUILD_DIR}/lib/src/core/native_resources/macos"

# ------------------------
# FUNCTIONS
# ------------------------

build_flutter_macos() {
  echo "🔨 Building Flutter app for macOS ${ARCH}..."
  flutter pub get
  flutter build macos --release
}

download_and_extract_pactus_cli() {
  echo "⬇️ Downloading pactus-cli..."
  curl -sSL "$PACTUS_CLI_URL" -o pactus-cli.tar.gz

  echo "📦 Extracting pactus-cli to ${FINAL_CLI_DEST}..."
  mkdir -p "$FINAL_CLI_DEST"
  tar -xzvf pactus-cli.tar.gz --strip-components=1 -C "$FINAL_CLI_DEST"
  rm pactus-cli.tar.gz
}

package_release_zip() {
  echo "📦 Packaging final zip file..."
  mkdir -p "$OUTPUT_DIR"
  ZIP_PATH="$OUTPUT_DIR/$OUTPUT_NAME"

  echo "📁 Creating macOS release package from full build directory..."
  (
    cd "$BUILD_DIR"
    zip -r "$ZIP_PATH" .
  )

  echo "✅ Zip package saved to: $ZIP_PATH"

  echo "📁 Copying zip to artifacts root..."
  mkdir -p "$ROOT_OUTPUT_DIR"
  cp "$ZIP_PATH" "$ROOT_OUTPUT_DIR/"
}

# ------------------------
# MAIN
# ------------------------

build_flutter_macos
download_and_extract_pactus_cli
package_release_zip
