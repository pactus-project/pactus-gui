#!/usr/bin/env bash
set -euo pipefail

# ------------------------
# ENV VARS
# ------------------------
FLUTTER_VERSION="3.32.0"
ARCH="amd64"
TAG_NAME="${1:-local}"
BUILD_DIR="$(pwd)/build/windows/x64/runner/Release"
OUTPUT_DIR="$(pwd)/artifacts/windows/${ARCH}"
ROOT_OUTPUT_DIR="$(pwd)/artifacts"
OUTPUT_NAME="PactusGUI-${TAG_NAME}-windows-${ARCH}.zip"
PACTUS_CLI_URL="https://github.com/pactus-project/pactus/releases/download/v1.9.1/pactus-cli_1.9.1_windows_amd64.zip"
FINAL_CLI_DEST="${BUILD_DIR}/lib/src/core/native_resources/windows"

# ------------------------
# FUNCTION
# ------------------------

build_flutter_windows() {
  echo "🔨 Building Flutter app for Windows ${ARCH}..."
  flutter pub get
  flutter build windows --release
}

download_and_extract_pactus_cli() {
  echo "⬇️ Downloading pactus-cli..."
  curl -sSL "$PACTUS_CLI_URL" -o pactus-cli.zip

  # Create temp directory for extraction
  local temp_dir=$(mktemp -d)

  echo "📦 Extracting pactus-cli to temp directory..."
  unzip -q pactus-cli.zip -d "$temp_dir"

  echo "🚚 Moving CLI files to final destination..."
  mkdir -p "$FINAL_CLI_DEST"
  mv "$temp_dir"/*/* "$FINAL_CLI_DEST"/

  # Cleanup
  rm -rf "$temp_dir" pactus-cli.zip
}

package_release_zip() {
  echo "📦 Packaging final zip file..."
  mkdir -p "$OUTPUT_DIR"
  mkdir -p "$ROOT_OUTPUT_DIR"

  local zip_path="$OUTPUT_DIR/$OUTPUT_NAME"
  cd "$BUILD_DIR"

  echo "📁 Creating Windows release package using 7zip..."
  7z a -tzip "$zip_path" ./*

  echo "✅ Package saved to: $zip_path"
  cp "$zip_path" "$ROOT_OUTPUT_DIR/"
  echo "✅ Package copied to: $ROOT_OUTPUT_DIR"

  echo "📂 Listing artifacts:"
  ls -lh "$OUTPUT_DIR"
  ls -lh "$ROOT_OUTPUT_DIR"
  echo "RELEASE_ZIP_PATH=$ROOT_OUTPUT_DIR/$OUTPUT_NAME" >> $GITHUB_ENV
}

# ------------------------
# MAIN
# ------------------------

build_flutter_windows
download_and_extract_pactus_cli
package_release_zip
