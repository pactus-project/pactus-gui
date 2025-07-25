import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/codegen_loader.dart';

/// [LocalizationExtension] documentation:
/// An extension on `BuildContext` that provides easy access to localized -
/// strings.
///
/// This extension adds a `tr` method to the `BuildContext` class, which is -
/// used to retrieve translated
/// strings based on a provided key. It allows for dynamic localization -
/// support in the app.
///
extension LocalizationExtension on BuildContext {
  /// ** [tr] Method:**
  /// - `tr(String key)`: Retrieves the localized string corresponding to the -
  /// provided `key`.
  ///   - The `key` represents a unique identifier for the localized string.
  ///   - The method first checks the current locale using -
  ///   `Localizations.localeOf(this)` to determine which locale's -
  ///   translations should be used.
  ///   - It then looks up the key in the `CodegenLoader.mapLocales` map for -
  ///   the appropriate locale (e.g., `en_US`, `fr_FR`, `es_ES`).
  ///   - If the key is found in the locale map, the corresponding translation-
  ///   is returned.
  ///   - If no translation is found for the key, the method returns the -
  ///   original `key` as a fallback.
  ///
  /// **Usage:**
  /// This extension allows developers to easily retrieve translations in -
  /// their app by calling `tr` on the `BuildContext` object, as shown below:
  /// ```dart
  /// String translatedText = context.tr(LocaleKeys.app_name);
  /// ```
  /// The above call will retrieve the translation for the `app_name` key in -
  /// the current locale, if it exists. Instead of using the raw key as a -
  /// string, you can use constants from the `LocaleKeys` class, which is -
  /// automatically generated from the ARB files.
  ///
  /// **Example:**
  /// If the current locale is `en_US` and the `app_name` key exists in the -
  /// `en_US` locale, `tr(LocaleKeys.app_name)` will return the English -
  /// translation, such as `"Pactus GUI (EN)"` if it is defined in the ARB file.
  /// If no translation is found, it will return the key itself.
  ///
  String tr(String key) {
    final locale = Localizations.localeOf(this);
    final localeMap = CodegenLoader
        .mapLocales['${locale.languageCode}_${locale.countryCode}'];
    if (localeMap != null && localeMap.containsKey(key)) {
      return localeMap[key] as String;
    }
    return key;
  }
}
