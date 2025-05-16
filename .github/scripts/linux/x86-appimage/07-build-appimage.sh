#!/bin/bash
set -e

# Generate AppImage
./linuxdeploy --appdir AppDir \
  --desktop-file AppDir/pactus_gui.desktop \
  --icon-file AppDir/pactus_gui.png \
  --output appimage

# Dynamic naming
TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "untagged")
ARCH="x86_64"
FILE_NAME="pactus_gui-${TAG}-${ARCH}.AppImage"  # Fixed: No space around =

# Rename (correct variable reference)
mv ./*.AppImage "$FILE_NAME"  # Fixed: Added $ and quotes

# Set executable permissions
chmod +x "$FILE_NAME"