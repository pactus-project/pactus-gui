#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

# Define paths
APPDIR="AppDir"

# Create AppRun script directly inside AppDir
# This script sets an environment variable and launches the binary
cat << 'EOF' > "$APPDIR/AppRun"
#!/bin/bash
HERE="$(dirname "$(readlink -f "$0")")"

# Set environment variable to point to daemon resource path
export PACTUS_NATIVE_RESOURCES="$HERE/usr/bin/lib/src/core/native_resources/linux"
printenv | grep PACTUS_NATIVE_RESOURCES

# Launch the main binary
exec "$HERE/usr/bin/pactus_gui" "$@"
EOF

# Make AppRun executable
chmod +x "$APPDIR/AppRun"

# Build the AppImage using linuxdeploy
./linuxdeploy --appdir "$APPDIR" \
  --desktop-file "$APPDIR/pactus_gui.desktop" \
  --icon-file "$APPDIR/pactus_gui.png" \
  --output appimage

# Dynamic version and architecture naming
TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "untagged")
ARCH="x64"
FILE_NAME="linux-build-appimage-${ARCH}-${TAG}.AppImage"

# Rename and ensure the AppImage is executable
mv ./*.AppImage "$FILE_NAME"
chmod +x "$FILE_NAME"

echo "✅ AppImage built successfully: $FILE_NAME"
