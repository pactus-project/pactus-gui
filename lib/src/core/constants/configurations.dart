import 'package:fluent_ui/fluent_ui.dart';

class AppConfigs {
  AppConfigs._();

  static const translationsPath = 'assets/translations';
  static const enLocale = Locale('en', 'US'); // English (United States)
  static const esLocale = Locale('es', 'ES'); // Spanish (Spain)
  static const frLocale = Locale('fr', 'FR'); // French (France)

  /// Define the list of supported locales in the desired order
  static const supportedLocales = [enLocale, esLocale, frLocale];
}
