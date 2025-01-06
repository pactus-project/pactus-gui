// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> fr = {
    "title": "Bonjour",
    "subtitle": "Bienvenue dans Localisation",
    "description": "Vous avez appuyé sur le bouton autant de fois :",
    "switchLanguage": "Changer de langue",
    "applications": "Applications",
    "enter_master_password_to_unlock":
        "Entrez le mot de passe principal pour déverrouiller"
  };
  static const Map<String, dynamic> es = {
    "title": "¡Hola, Mundo!",
    "subtitle": "Bienvenido a Localización",
    "description": "Has pulsado el botón tantas veces:",
    "switchLanguage": "Cambiar idioma",
    "applications": "Applications",
    "enter_master_password_to_unlock":
        "Introduzca la contraseña maestra para desbloquear"
  };
  static const Map<String, dynamic> en = {
    "title": "Hello, World!",
    "subtitle": "Welcome to Localization",
    "description": "You have pushed the button this many times:",
    "switch_language": "Switch language",
    "applications": "Applications",
    "enter_master_password_to_unlock": "Enter the master password to unlock"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "fr": fr,
    "es": es,
    "en": en
  };
}
