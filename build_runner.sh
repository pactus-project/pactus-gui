#!/bin/bash

# Displaying a welcome message to the user
echo "Welcome to the Build Runner Wizard!"

# Showing the available options to the user
echo "Please select an option:"
echo "1. Automatic Execution"
echo "2. Re-Generate Asset Files"

# Reading the user's input for their choice
read -p "Enter your choice (1 or 2): " choice

# Handling the user's choice with a case statement
case $choice in
    1)
        # User selected Automatic Execution
        echo "* You selected Automatic Execution."

        # Step 1: Rebuilding translation files using the l10n package
        # This command generates localization files from ARB files located in assets/translations.
        flutter gen-l10n --output-dir=lib/l10n --arb-dir=lib/l10n

        # Step 2: Running custom translation utilities
        # Executes the custom logic defined in translations_utils.dart (used for post-processing translations if needed).
        echo "* Running custom translations utilities from lib/src/core/utils/gen/localization/translations_utils.dart"
        dart lib/src/core/utils/gen/localization/translations_utils.dart

        # Step 3: Running build_runner to generate code for localization and other assets
        # This builds the project and deletes any conflicting outputs that may cause issues.
        dart run build_runner build --delete-conflicting-outputs

        # Step 4: flutter pub get for update l10n dependency
        flutter pub get
        ;;
    2)
        # User selected Re-Generate Asset Files
        echo "* You selected Re-Generate Asset Files."

        # Re-running build_runner to regenerate asset files
        # This specifically handles assets located in the 'assets' folder.
        dart run build_runner build --delete-conflicting-outputs --build-filter="lib/src/core/utils/gen/assets\*.dart"
        ;;
    *)
        # Invalid choice entered by the user
        echo "* Invalid choice. Please enter 1 or 2"
        ;;
esac

# Pausing for 3 seconds before exiting to give the user a chance to read the output
sleep 3s ;
