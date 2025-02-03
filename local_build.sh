#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Version variables
PACTUS_VERSION="1.6.4"
BUILD_NUMBER="local001"

# Asset URLs
LINUX_ASSETS_URL="https://github.com/pactus-project/pactus/releases/download/v${PACTUS_VERSION}/pactus-cli_${PACTUS_VERSION}_linux_amd64.tar.gz"
WINDOWS_ASSETS_URL="https://github.com/pactus-project/pactus/releases/download/v${PACTUS_VERSION}/pactus-cli_${PACTUS_VERSION}_windows_amd64.zip"
MACOS_ASSETS_URL="https://github.com/pactus-project/pactus/releases/download/v${PACTUS_VERSION}/pactus-cli_${PACTUS_VERSION}_darwin_arm64.tar.gz"

# Function to check if a command exists
check_command() {
    if ! command -v $1 &> /dev/null; then
        echo -e "${RED}Error: $1 is not installed${NC}"
        exit 1
    fi
}

# Function to build for Linux
build_linux() {
    echo -e "${BLUE}Building for Linux...${NC}"
    
    # Create directory for assets
    mkdir -p lib/src/core/common/files/
    
    # Download and extract Pactus CLI
    curl -L -o file.tar.gz $LINUX_ASSETS_URL
    tar -xzf file.tar.gz -C lib/src/core/common/files/
    rm file.tar.gz
    
    # Build Flutter application
    flutter config --enable-linux-desktop
    flutter build linux --release
    
    # Package the build
    cd build/linux/x64/release/bundle
    cp -r ../../../../lib/src/core/common/files/* .
    zip -r linux-build-${BUILD_NUMBER}.zip ./*
    
    echo -e "${GREEN}Linux build completed: build/linux/x64/release/bundle/linux-build-${BUILD_NUMBER}.zip${NC}"
}

# Function to build for macOS
build_macos() {
    echo -e "${BLUE}Building for macOS...${NC}"
    
    # Create directory for assets
    mkdir -p lib/src/core/common/files/
    
    # Download and extract Pactus CLI
    curl -L -o file.tar.gz $MACOS_ASSETS_URL
    tar -xzf file.tar.gz -C lib/src/core/common/files/
    rm file.tar.gz
    
    # Build Flutter application
    flutter config --enable-macos-desktop
    flutter build macos --release
    
    # Package the build
    cd build/macos/Build/Products/Release
    cp -r ../../../../../lib/src/core/common/files/* .
    zip -r macos-build-${BUILD_NUMBER}.zip ./*
    
    echo -e "${GREEN}macOS build completed: build/macos/Build/Products/Release/macos-build-${BUILD_NUMBER}.zip${NC}"
}

# Function to build for Windows
build_windows() {
    echo -e "${BLUE}Building for Windows...${NC}"
    
    # Create directory for assets
    mkdir -p lib/src/core/common/files/
    
    # Download and extract Pactus CLI
    curl -L -o file.zip $WINDOWS_ASSETS_URL
    unzip file.zip -d lib/src/core/common/files/
    rm file.zip
    
    # Build Flutter application
    flutter config --enable-windows-desktop
    flutter build windows --release
    
    # Package the build
    cd build/windows/x64/runner/Release
    cp -r ../../../../../lib/src/core/common/files/* .
    zip -r windows-build-${BUILD_NUMBER}.zip ./*
    
    echo -e "${GREEN}Windows build completed: build/windows/x64/runner/Release/windows-build-${BUILD_NUMBER}.zip${NC}"
}

# Check required tools
check_command "flutter"
check_command "curl"
check_command "zip"
check_command "unzip"

# Clean previous builds
echo -e "${BLUE}Cleaning previous builds...${NC}"
flutter clean

# Get Flutter dependencies
echo -e "${BLUE}Getting Flutter dependencies...${NC}"
flutter pub get

flutter gen-l10n

# Detect operating system and build accordingly
case "$(uname -s)" in
    Linux*)
        build_linux
        ;;
    Darwin*)
        build_macos
        ;;
    MINGW*|MSYS*|CYGWIN*)
        build_windows
        ;;
    *)
        echo -e "${RED}Unsupported operating system${NC}"
        exit 1
        ;;
esac

echo -e "${GREEN}Build process completed successfully!${NC}" 