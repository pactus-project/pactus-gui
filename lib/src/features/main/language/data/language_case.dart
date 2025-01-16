/// The [LanguageCase] class represents a language and country combination.
///
/// It provides a lightweight alternative to the `Locale` object in Flutter,
/// making it ideal for use cases where only the language and country code are
/// required. This class is useful when you need to pass language-specific data
/// across widgets or handle localization logic without the full overhead of a
/// `Locale` object.
///
/// **Constructor:**
/// ```dart
/// LanguageCase({
///   required this.name,
///   required this.language,
///   required this.country,
/// });
/// ```
///
/// - [name] : A human-readable name for the language (e.g., `"English"`).
/// - [language] : The ISO 639-1 language code (e.g., `"en"` for English).
/// - [country] : The ISO 3166-1 alpha-2 country code (e.g.,`"US"` for the USA).
///
class LanguageCase {
  LanguageCase({
    required this.name,
    required this.language,
    required this.country,
  });
  final String name;
  final String language;
  final String country;
}
