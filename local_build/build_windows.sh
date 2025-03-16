#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get version from pubspec.yaml
PACTUS_VERSION="1.6.4"
BUILD_NUMBER=$(grep 'version:' pubspec.yaml | awk '{print $2}' | cut -d+ -f2)

# Function to check if a command exists
check_command() {
    if ! command -v $1 &> /dev/null; then
        echo -e "${RED}Error: $1 is not installed${NC}"
        exit 1
    fi
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

# Generate localization files
echo -e "${BLUE}Generating localization files...${NC}"
flutter gen-l10n --output-dir=lib/l10n --arb-dir=lib/l10n

# Run translation utilities
echo -e "${BLUE}Running translation utilities...${NC}"
dart lib/src/core/utils/gen/localization/translations_utils.dart

# Run build_runner
echo -e "${BLUE}Running build_runner...${NC}"
dart run build_runner build --delete-conflicting-outputs
dart run build_runner build --delete-conflicting-outputs --build-filter="lib/src/core/utils/gen/assets\*.dart"

# Prompt for architecture
echo "Select Windows architecture:"
echo "1) amd64 (64-bit)"
echo "2) 386 (32-bit)"
read -p "Enter choice (1-2): " choice
case $choice in
    1) ARCH="amd64" ;;
    2) ARCH="386" ;;
    *) echo "Invalid choice, defaulting to amd64"; ARCH="amd64" ;;
esac

# Create directory for assets
rm -rf lib/src/core/native_resources/windows/
mkdir -p lib/src/core/native_resources/windows/

# Download and extract Pactus CLI
echo -e "${BLUE}Downloading Windows assets...${NC}"
curl -L -o file