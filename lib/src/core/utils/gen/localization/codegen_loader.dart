import 'dart:ui' show Locale;

/// [CodegenLoader] class loads translations for different locales.
///
/// - [load] : Loads translation data based on the provided locale.
/// - [mapLocales] : Maps locales (e.g., `en_US`, `fr_FR`, `es_ES`) to their -
/// respective translation data.
///
/// Example translations include:
/// - `enUS`: English translations.
/// - `frFR`: French translations.
/// - `esES`: Spanish translations.
///
class CodegenLoader {
  const CodegenLoader();

  Future<Map<String, dynamic>?> load(
    String path,
    Map<String, dynamic> localeMap,
  ) {
    return Future.value(
      mapLocales["${Locale(
        "${localeMap["language"]}",
        "${localeMap["country"]}",
      )}"],
    );
  }

  static const Map<String, dynamic> enUS = {
    'title': 'Hello, World  !',
    'subtitle': 'Welcome to Localization',
    'description': 'You have pushed the button this many times:',
    'switch_language': 'Switch language',
    'applications': 'Applications',
    'initialize_mode': 'Initialize mode',
    'wallet_seed': 'Wallet seed',
    'confirm_seed': 'Confirm seed',
    'master_password': 'Confirm seed',
    'validator_config': 'Validator config',
    'initializing': 'Initializing',
    'finish': 'Finish',
  };
  static const Map<String, dynamic> frFR = {
    'title': 'Bonjour le monde  !',
    'subtitle': 'Bienvenue dans Localisation',
    'description': 'Vous avez appuyé sur le bouton autant de fois :',
    'switch_language': 'Changer de langue',
    'applications': 'Applications',
    'initialize_mode': 'Mode dinitialisation',
    'wallet_seed': 'Graine de portefeuille',
    'confirm_seed': 'Confirmer la graine',
    'master_password': 'Confirmer le mot de passe principal',
    'validator_config': 'Configuration du validateur',
    'initializing': 'Initialisation',
    'finish': 'Terminer',
  };
  static const Map<String, dynamic> esES = {
    'title': '¡Hola, Mundo  !',
    'subtitle': 'Bienvenido a Localización',
    'description': 'Has pulsado el botón tantas veces:',
    'switch_language': 'Cambiar idioma',
    'applications': 'Applications',
    'initialize_mode': 'Modo de inicialización',
    'wallet_seed': 'Semilla de billetera',
    'confirm_seed': 'Confirmar semilla',
    'master_password': 'Confirmar contraseña maestra',
    'validator_config': 'Configuración del validador',
    'initializing': 'Inicializando',
    'finish': 'Finalizar',
  };

  static const Map<String, Map<String, dynamic>> mapLocales = {
    'en_US': enUS,
    'fr_FR': frFR,
    'es_ES': esES,
  };
}
