import 'package:pactus_gui/src/features/main/language/data/language_case.dart';

/// [LanguageConstants] Documentation
/// This class defines the language constants for localization in the -
/// application.
///
/// The `LanguageConstants` class holds predefined `LanguageCase` instances -
/// for supported locales.
/// Each `LanguageCase` includes information about the language, country, and  -
/// language name.
///
/// **Fields:**
/// - [enUS] : Represents English (United States).
/// - [frFR] : Represents French (France).
/// - [esES] : Represents Spanish (Spain).
///
/// **List of Supported Languages:**
/// - [languageCases] : A list containing all the defined language cases,
/// like (`enUS`, `frFR`, `esES`).
///
/// **Usage:**
/// - This class provides easy access to different languages and locales.
/// - It is used to manage the list of supported locales for your app, which -
/// helps in dynamically loading and switching between languages.
///
/// **LanguageCase Structure:**
/// Each `LanguageCase` consists of:
/// - `country`: The country code (e.g., 'US', 'FR', 'ES').
/// - `language`: The language code (e.g., 'en', 'fr', 'es').
/// - `name`: The name of the language (e.g., 'English', 'Français', 'Español').
class LanguageConstants {
  LanguageConstants._();
  static final LanguageCase enUS = LanguageCase(
    country: 'US',
    language: 'en',
    name: 'English',
  );

  static final LanguageCase frFR = LanguageCase(
    country: 'FR',
    language: 'fr',
    name: 'Français',
  );

  static final LanguageCase esES = LanguageCase(
    country: 'ES',
    language: 'es',
    name: 'Español',
  );

  static final List<LanguageCase> languageCases = [
    enUS,
    frFR,
    esES,
  ];
}
