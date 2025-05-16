#!/bin/bash
set -e

echo "📦 Installing Flutter dependencies and generating files..."

flutter pub get


# Generate locale files
echo "* Rebuilding translation files using the l10n package..."
output=$(flutter gen-l10n --output-dir=lib/l10n --arb-dir=lib/l10n)
echo "$output"

if echo "$output" | grep -q "untranslated message"; then
  echo "::error file=lib/l10n/l10n.yaml::Error: Untranslated messages detected in your localization files."
  echo "::error::There are untranslated messages in the following languages:"
  echo "$output" | grep "untranslated message"
  echo "::error::Please ensure that all translations are provided in the respective .arb files."
  exit 1
fi

echo "* Running custom translations utilities from lib/src/core/utils/gen/localization/translations_utils.dart..."
dart lib/src/core/utils/gen/localization/translations_utils.dart

echo "* Running build_runner to generate code for localization and other assets..."
dart run build_runner build --delete-conflicting-outputs

echo "* Running flutter pub get to update l10n dependencies..."
flutter pub get

echo "* Running dart format to re-arrange code styles..."
dart format .

# Generating asset files
echo "* Generating asset files..."
dart run build_runner build --delete-conflicting-outputs --build-filter="lib/src/core/utils/gen/assets/*.dart" || (
  echo "Error: Failed to generate asset files."
  exit 1
)

dart run build_runner build --delete-conflicting-outputs

dart format .

flutter analyze
