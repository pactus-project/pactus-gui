import 'package:fluent_ui/fluent_ui.dart';

enum Language {
  english(
    Locale('en', 'US'),
    'English',
  ),
  spanish(
    Locale('es', 'ES'),
    'Español',
  ),
  french(
    Locale('fr', 'FR'),
    'Français',
  );

  const Language(
    this.value,
    this.text,
  );

  final Locale value;
  final String text;
}
