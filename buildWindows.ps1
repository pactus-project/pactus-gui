# Step 1: Build the Flutter Windows application
Write-Host "Building Flutter Windows app..."
flutter build windows

# Define the source files and destination directory
# Adjust these paths according to your project's structure
$sourceFiles = @(
    ".\windows\pactus-daemon.exe",
    ".\windows\pactus-wallet.exe"
)
$destinationDir = ".\build\windows\x64\runner\Debug" # Adjust based on your build configuration
$releaseDestinationDir = ".\build\windows\x64\runner\Release" # Adjust based on your build configuration


# Function to copy files to a destination
function Copy-Files {
    param (
        [string]$destinationDir
    )
    # Ensure the destination directory exists
    if (-not (Test-Path -Path $destinationDir)) {
        Write-Host "Destination directory does not exist: $destinationDir"
        return
    }

    # Copy each source file to the destination directory
    foreach ($file in $sourceFiles) {
        Write-Host "Copying $file to $destinationDir"
        Copy-Item -Path $file -Destination $destinationDir
    }
}

# Step 2: Copy files to Debug and Release directories
Copy-Files -destinationDir $destinationDir
Copy-Files -destinationDir $releaseDestinationDir


# Step 3: Run the Flutter Windows app
Write-Host "Running Flutter Windows app..."
flutter run -d windows
