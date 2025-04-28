import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:pactus_gui/src/features/main/language/core/language_constants.dart';

/// This script generates the necessary files to support localization in your
/// Flutter app.
///
/// The main purpose of this code is to:
/// - Load ARB translation files (in `lib/l10n` directory) for different locales.
/// - Generate the `LocaleKeys` class, `CodegenLoader` class, and `AppLocales`
/// class dynamically based on the ARB files.
/// - Create files to store the translations and helper code required for proper
/// localization in the app.
///
/// **Flow:**
/// 1. Loads translations from ARB files. (e.g., `en_US`, `fr_FR`, `es_ES`).
/// 2. Generates the `LocaleKeys` class, which contains constants for each key
/// in the translations.
/// 3. Generates the `CodegenLoader` class to load translations based on the
/// current locale.
/// 4. Generates the `AppLocales` class, which contains locale constants and the
/// supported locales list.
///
/// **Generated Files:**
/// - `locale_keys.dart`: Contains constants for every key found in the ARB
/// files (e.g., `LocaleKeys.app_name`).
/// - `codegen_loader.dart`: Provides a loader for translations for different
/// locales.
/// - `app_locales.dart`: Contains static constants for each supported locale
/// and their associated settings.
///
/// **Usage:**
/// - Ensure you have the correct ARB files in the `lib/l10n` directory with
/// language-country-specific naming (e.g., `app_en.arb` for English).
/// - Run this script to generate the required localization files. These files
/// will help manage and load translations dynamically in the app.

/// ARB files directory and output file paths
const arbDir = 'lib/l10n';
const outputCodegenLoaderFilePath =
    'lib/src/core/utils/gen/localization/codegen_loader.dart';
const outputLocaleKeysFilePath =
    'lib/src/core/utils/gen/localization/locale_keys.dart';

/// Main entry point
void main() async {
  // 1. Load ARB translations
  final translations = await _loadTranslations();

  // 2. Generate LocaleKeys class
  await _generateLocaleKeysFile(translations);

  // 3. Generate CodegenLoader class
  await _generateCodegenLoaderFile(translations);

  // 4. Create AppLocales class
  await _generateAppLocalesClass();
}

/// Generates the AppLocales class file dynamically based on the language and
/// country codes.
Future<void> _generateAppLocalesClass() async {
  // Define the ARB translations path and a list of language-country pairs
  const translationsPath = arbDir;
  final languageCases = LanguageConstants.languageCases;

  final buffer = StringBuffer()
    ..writeln('import \'dart:ui\' show Locale;')
    ..writeln()
    ..writeln('/// [AppLocales] class manages app localization.')
    ..writeln('///')
    ..writeln(
      '/// - [translationsPath] : Path to translation files (`lib/l10n`).',
    )
    ..writeln(
      '/// - [supportedLocales] : List of supported locales, generated from available',
    )
    ..writeln(
      '/// translations (e.g., `enUSLocale`, `frFRLocale`, `esESLocale`).',
    )
    ..writeln('///')
    ..writeln('/// The class can be extended by adding more locales as needed.')
    ..writeln('class AppLocales {')
    ..writeln('  AppLocales._();\n')
    ..writeln('  static const translationsPath = \'$translationsPath\';\n');

  // Generate constants for each locale
  for (final locale in languageCases) {
    final localeConstName = '${locale.language}${locale.country}Locale';
    final localeString =
        '    \'${locale.language}\',\n    \'${locale.country}\'';
    buffer.writeln(
      '  static const $localeConstName = Locale(\n$localeString,\n  );',
    );
  }

  // Generate the supportedLocales list
  buffer
    ..writeln(
      '\n  /// Define the list of supported locales in the desired order',
    )
    ..writeln('  static const supportedLocales = [');
  for (final locale in languageCases) {
    final localeConstName = '${locale.language}${locale.country}Locale';
    buffer.writeln('    $localeConstName,');
  }
  buffer
    ..writeln('  ];')
    ..writeln('}');

  // Write the generated class to a file
  const appLocalesFilePath =
      'lib/src/core/utils/gen/localization/app_locales.dart';
  await _writeToFile(appLocalesFilePath, buffer.toString());
  log('Generated AppLocales in $appLocalesFilePath');
}

/// Loads ARB files and returns translations grouped by locale.
Future<Map<String, Map<String, dynamic>>> _loadTranslations() async {
  final locales = LanguageConstants.languageCases;
  final translations = <String, Map<String, dynamic>>{};

  for (final locale in locales) {
    final localeKey = '${locale.language}_${locale.country}';
    final filePath = '$arbDir/app_${locale.language}.arb';

    if (_isFileAvailable(filePath)) {
      translations[localeKey] = await _readArbFile(filePath);
    } else {
      _logMissingFile(localeKey, filePath);
    }
  }
  return translations;
}

/// Reads and parses an ARB file into a map.
Future<Map<String, dynamic>> _readArbFile(String filePath) async {
  final content = await File(filePath).readAsString();
  return jsonDecode(content) as Map<String, dynamic>;
}

/// Logs a warning for missing ARB files.
void _logMissingFile(String localeKey, String filePath) {
  log(
    'Warning: ARB file not found for locale "$localeKey" at path "$filePath".',
  );
}

/// Generates the LocaleKeys class file from the translations.
Future<void> _generateLocaleKeysFile(
  Map<String, Map<String, dynamic>> translations,
) async {
  if (translations.isEmpty) {
    log('No translations available to generate LocaleKeys.');

    return;
  }

  final buffer = StringBuffer()
    ..writeln('// ignore_for_file: constant_identifier_names')
    ..writeln('abstract class LocaleKeys {');

  final keys =
      translations.values.first.keys.where((key) => !key.startsWith('@'));
  for (final key in keys) {
    buffer.writeln('  static const String ${_sanitizeKey(key)} = \'$key\';');
  }

  buffer.writeln('}');
  await _writeToFile(outputLocaleKeysFilePath, buffer.toString());

  log('Generated LocaleKeys in $outputLocaleKeysFilePath');
}

/// Generates the CodegenLoader class file from the translations.
Future<void> _generateCodegenLoaderFile(
  Map<String, Map<String, dynamic>> translations,
) async {
  if (translations.isEmpty) {
    log('No translations available to generate CodegenLoader.');

    return;
  }

  final buffer = StringBuffer()
    ..writeln('import \'dart:ui\' show Locale;')
    ..writeln()
    ..writeln(
      '/// [CodegenLoader] class loads translations for different locales.',
    )
    ..writeln('///')
    ..writeln(
      '/// - [load] : Loads translation data based on the provided locale.',
    )
    ..writeln(
      '/// - [mapLocales] : Maps locales (e.g., `en_US`, `fr_FR`, `es_ES`) to their -\n/// respective translation data.',
    )
    ..writeln('///')
    ..writeln('/// Example translations include:')
    ..writeln('/// - `enUS`: English translations.')
    ..writeln('/// - `frFR`: French translations.')
    ..writeln('/// - `esES`: Spanish translations.')
    ..writeln('///')
    ..writeln('// ignore_for_file: lines_longer_than_80_chars')
    ..writeln('class CodegenLoader {')
    ..writeln('  const CodegenLoader();')
    ..writeln()
    ..writeln('  Future<Map<String, dynamic>?> load(')
    ..writeln('    String path,')
    ..writeln('    Map<String, dynamic> localeMap,')
    ..writeln('  ) {')
    ..writeln('    return Future.value(')
    ..writeln(
      '      mapLocales["\${Locale(',
    )
    ..writeln(
      '        "\${localeMap["language"]}",',
    )
    ..writeln(
      '        "\${localeMap["country"]}",',
    )
    ..writeln(
      '      )}"],',
    )
    ..writeln('    );')
    ..writeln('  }')
    ..writeln();

  // Generate locale-specific translation maps
  for (final entry in translations.entries) {
    buffer.writeln(
      '  static const Map<String, dynamic> ${_removeUnderscore(entry.key)} = {',
    );
    entry.value.forEach((key, value) {
      if (!key.startsWith('@')) {
        buffer.writeln('    \'$key\': \'$value\',');
      }
    });
    buffer.writeln('  };');
  }

  buffer
    ..writeln()
    ..writeln(
      '  static const Map<String, Map<String, dynamic>> mapLocales = {',
    );
  for (final localeKey in translations.keys) {
    buffer.writeln('    \'$localeKey\': ${_removeUnderscore(localeKey)},');
  }
  buffer
    ..writeln('  };')
    ..writeln('}');

  await _writeToFile(outputCodegenLoaderFilePath, buffer.toString());

  log('Generated CodegenLoader in $outputCodegenLoaderFilePath');
}

/// Writes content to a file at the specified path.
Future<void> _writeToFile(String filePath, String content) async {
  final file = File(filePath);
  await file.writeAsString(content);
}

/// Sanitizes a key for use as a constant name in Dart.
String _sanitizeKey(String key) {
  return key
      .replaceAll(RegExp(r'[^a-zA-Z0-9_]'), '_')
      .replaceFirst(RegExp(r'^[^a-zA-Z]'), '_');
}

/// Utility method to remove underscores from locale keys (e.g., en_US -> enUS).
String _removeUnderscore(String localeKey) {
  return localeKey.replaceAll(
    '_',
    '',
  ); // Removes the underscore between language and country
}

/// Checks if a file exists at the given path using a synchronous method
bool _isFileAvailable(String filePath) {
  return File(filePath).existsSync(); // Mobile/desktop - Sync check
}
