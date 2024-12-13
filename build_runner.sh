#!/bin/bash

# Welcome message
echo "Welcome to the Build Runner Wizard!"

# Display options to the user
echo "Please select an option:"
echo "1. Automatic Execution"
echo "2. Manual Execution"
echo "3. Re-Build Translation Files"
echo "4. Re-Generate Asset Files"

# Read user input
read -p "Enter your choice (1, 2, 3, or 4): " choice

# Check selected option and execute corresponding commands
case $choice in
    1)
        echo "* You selected Automatic Execution."
        # Automatic execution

        # Rebuild translation files
        dart run easy_localization:generate --source-dir=assets/translations --output-dir=lib/src/core/utils/gen/localization
        dart run easy_localization:generate -f keys -o locale_keys.g.dart --source-dir=assets/translations --output-dir=lib/src/core/utils/gen/localization
        dart run build_runner build --delete-conflicting-outputs --build-filter="lib\src\core\constants\localization\*.dart"

        # Execute automatic build runner command
        dart run build_runner build --delete-conflicting-outputs
        ;;
    2)
        echo "* You selected Manual Execution."
        # Read user input text
        read -p "Enter your text (comma-separated list for multiple items): " text

        # Convert input text to an array using ',' as a delimiter
        IFS=',' read -r -a text_array <<< "$text"

        # Loop through each item in the array and execute the command
        for item in "${text_array[@]}"
        do
            # Replace '/' with '\' in the input text
            text_with_backslashes=$(echo "$item" | sed 's/\//\\/g')
            # Replace the desired text in the command and execute it
            dart run build_runner build --delete-conflicting-outputs --build-filter="$text_with_backslashes\*.dart"
        done
        ;;
    3)
        echo "* You selected Re-Build Translation Files."
        # Execute commands for rebuilding translation files
        dart run easy_localization:generate --source-dir=assets/translations --output-dir=lib/src/core/utils/gen/localization
        dart run easy_localization:generate -f keys -o locale_keys.g.dart --source-dir=assets/translations --output-dir=lib/src/core/utils/gen/localization
        dart run build_runner build --delete-conflicting-outputs --build-filter="lib\src\core\constants\localization\*.dart"
        ;;
    4)
        echo "* You selected Re-Generate Asset Files."
        # Execute commands for rebuilding asset files
        dart run build_runner build --delete-conflicting-outputs --build-filter="lib\src\core\utils\gen\assets\*.dart"
        ;;
    *)
        echo "* Invalid choice. Please enter 1, 2, 3, or 4."
        ;;
esac
