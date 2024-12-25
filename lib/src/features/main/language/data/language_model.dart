import 'dart:ui';

enum Language {
  english(
    Locale('en', 'US'),
    'English',
    'en',
  ),
  spanish(
    Locale('es', 'ES'),
    'Español',
    'es',
  ),
  french(
    Locale('fr', 'FR'),
    'Français',
    'fr',
  );

  const Language(
    this.value,
    this.text,
    this.code,
  );

  final Locale value;
  final String text;
  final String code;
}
