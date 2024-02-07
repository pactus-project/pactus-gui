#!/bin/bash

echo "Building Flutter Linux app..."
flutter build linux

cp linux/pactus-daemon build/linux/x64/debug/bundle/
cp linux/pactus-wallet build/linux/x64/debug/bundle/
chmod +x build/linux/x64/debug/bundle/pactus-daemon
chmod +x build/linux/x64/debug/bundle/pactus-wallet

# cp linux/pactus-daemon build/linux/x64/release/bundle/
# cp linux/pactus-wallet build/linux/x64/release/bundle/
# chmod +x build/linux/x64/release/bundle/pactus-daemon
# chmod +x build/linux/x64/release/bundle/pactus-wallet

echo "Running Flutter Linux app..."
flutter run -d linux