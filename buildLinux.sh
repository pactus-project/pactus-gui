#!/bin/bash

# Step 1: Build the Flutter application for Linux
echo "Building Flutter Linux app..."
flutter build linux

# Define the source files and destination directories
sourceFiles=(
    "./linux/pactus-daemon" # Adjust paths as needed
    "./linux/pactus-wallet" # Adjust paths as needed
)
destinationDir="./build/linux/x64/debug/bundle" # Adjust based on your build configuration
releaseDestinationDir="./build/linux/x64/release/bundle" # Adjust based on your build configuration

# Function to copy files to a destination
copy_files() {
    destinationDir=$1
    # Ensure the destination directory exists
    if [ ! -d "$destinationDir" ]; then
        echo "Destination directory does not exist: $destinationDir"
        return
    fi

    # Copy each source file to the destination directory
    for file in "${sourceFiles[@]}"; do
        echo "Copying $file to $destinationDir"
        cp "$file" "$destinationDir"
    done
}

# Step 2: Copy files to Debug and Release directories
copy_files "$destinationDir"
copy_files "$releaseDestinationDir"

# Step 3: Run the Flutter Linux app
echo "Running Flutter Linux app..."
flutter run -d linux