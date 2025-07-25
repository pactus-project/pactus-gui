import 'dart:ui' show Locale;

/// [AppLocales] class manages app localization.
///
/// - [translationsPath] : Path to translation files (`lib/l10n`).
/// - [supportedLocales] : List of supported locales, generated from available
/// translations (e.g., `enUSLocale`, `frFRLocale`, `esESLocale`).
///
/// The class can be extended by adding more locales as needed.
class AppLocales {
  AppLocales._();

  static const translationsPath = 'lib/l10n';

  static const enUSLocale = Locale('en', 'US');
  static const frFRLocale = Locale('fr', 'FR');
  static const esESLocale = Locale('es', 'ES');

  /// Define the list of supported locales in the desired order
  static const supportedLocales = [enUSLocale, frFRLocale, esESLocale];
}
