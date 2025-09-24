#!/usr/bin/env bash

set -euo pipefail

# --------------------------------------
# CONFIGURATION
# --------------------------------------

TAG_NAME="${1:-local}"  # Use first argument as tag or fallback to 'local'
OUTPUT_NAME="PactusGUI-${TAG_NAME}-macos-arm64.dmg"
APP_NAME="Pactus GUI"
APPDIR="temp_dmg"
APP_PATH="build/macos/Build/Products/Release/gui.app"
PACTUS_CLI_URL="https://github.com/pactus-project/pactus/releases/download/v1.9.0/pactus-cli_1.9.0_darwin_arm64.tar.gz"

# --------------------------------------
# FUNCTIONS
# --------------------------------------

install_dependencies() {
  echo "🔧 Installing dependencies..."
  # if required
  if ! command -v create-dmg &> /dev/null; then
    brew install create-dmg
  fi
}

build_flutter_macos() {
  echo "🔨 Building Flutter app for macOS ARM64..."
  flutter pub get
  flutter build macos --release

  # Check if build was successful
  if [ ! -d "$APP_PATH" ]; then
      echo "❌ Error: Flutter build failed!"
      exit 1
  fi

  # Clean up unnecessary files (added this part)
  echo "🧹 Cleaning up build directory..."
  cd build/macos/Build/Products/Release/
  for item in *; do
      if [[ "$item" != "gui.app" && "$item" != "lib" ]]; then
          rm -rf "$item"
      fi
  done
  cd - > /dev/null
}

prepare_app_bundle() {
  echo "📁 Preparing App Bundle..."
  rm -rf "$APPDIR"
  mkdir -p "$APPDIR"

  # Copy the app bundle
  cp -R "$APP_PATH" "$APPDIR/$APP_NAME.app"

  # Download and extract native resources
  echo "⬇️ Downloading and extracting pactus-cli from $PACTUS_CLI_URL..."
  curl -L -o pactus-assets.tar.gz "$PACTUS_CLI_URL"
  tar -xzf pactus-assets.tar.gz --strip-components=1 -C "$APPDIR/$APP_NAME.app/Contents/MacOS/"

  # Make native resources executable
  chmod +x "$APPDIR/$APP_NAME.app/Contents/MacOS/pactus"*

  # Ad-hoc code signing to remove security warnings
  echo "🔏 Code signing the app bundle..."
  # Sign all executables in the app bundle
  find "$APPDIR/$APP_NAME.app" -type f -perm +111 -exec codesign --force --deep --sign - {} \;
  # Sign the app bundle itself
  codesign --force --deep --sign - "$APPDIR/$APP_NAME.app"

  # Create launch wrapper
  echo "📝 Creating launch wrapper..."
  cat > "$APPDIR/$APP_NAME.app/Contents/MacOS/gui_original" << 'EOF'
#!/bin/bash

# Get the directory where this script is located (Contents/MacOS)
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Set the path to native resources for macOS
export PACTUS_NATIVE_RESOURCES="$HERE"

# Launch the actual GUI application
exec "$HERE/gui_flutter" "$@"
EOF

  # Rename the original executable and replace with our wrapper
  mv "$APPDIR/$APP_NAME.app/Contents/MacOS/gui" "$APPDIR/$APP_NAME.app/Contents/MacOS/gui_flutter"
  mv "$APPDIR/$APP_NAME.app/Contents/MacOS/gui_original" "$APPDIR/$APP_NAME.app/Contents/MacOS/gui"
  chmod +x "$APPDIR/$APP_NAME.app/Contents/MacOS/gui"

  # Create symbolic link to Applications folder
  ln -s /Applications "$APPDIR/Applications"
}

create_dmg() {
  echo "📦 Creating DMG file..."
  mkdir -p artifacts
  DMG_PATH="artifacts/${OUTPUT_NAME}"

  # Remove existing DMG if any
  rm -f "$DMG_PATH"

  # Create the DMG using hdiutil
  hdiutil create -volname "$APP_NAME" -srcfolder "$APPDIR" -ov -format UDZO "$DMG_PATH"

  # Verify DMG creation
  if [ ! -f "$DMG_PATH" ]; then
      echo "❌ Error: DMG creation failed!"
      exit 1
  fi

  echo "✅ DMG created successfully: $DMG_PATH"

  echo "file_name=${OUTPUT_NAME}" >> $GITHUB_OUTPUT
}

cleanup() {
  echo "🧹 Cleaning up temporary files..."
  rm -rf "$APPDIR"
  rm -f pactus-assets.tar.gz
}

# --------------------------------------
# MAIN EXECUTION
# --------------------------------------

install_dependencies
build_flutter_macos
prepare_app_bundle
create_dmg
cleanup
