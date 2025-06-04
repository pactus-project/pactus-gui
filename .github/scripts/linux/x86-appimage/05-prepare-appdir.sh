#!/bin/bash
set -e

mkdir -p AppDir/usr/bin
cp -r build/linux/x64/release/bundle/* AppDir/usr/bin/
cp linux/pactus_gui.desktop AppDir/
cp linux/pactus_gui.png AppDir/

cat <<'EOF' > AppDir/AppRun
#!/bin/bash
HERE="$(dirname "$(readlink -f "$0")")"
exec "$HERE/usr/bin/pactus_gui" "$@"
EOF

chmod +x AppDir/usr/bin/lib/src/core/native_resources/linux/pactus*

chmod +x AppDir/AppRun
