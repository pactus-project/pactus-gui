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
    'welcome_title': 'Welcome to the Future of Blockchain with Pactus!',
    'welcome_description': 'Where the future of blockchain unfolds with trust'
        ' and transparency in every transaction. Join us in shaping'
        ' a decentralized revolution!',
    'start_button_text': 'Get Started',
  };
  static const Map<String, dynamic> frFR = {
    'title': 'Bonjour le monde  !',
    'subtitle': 'Bienvenue dans Localisation',
    'description': 'Vous avez appuyé sur le bouton autant de fois :',
    'switch_language': 'Changer de langue',
    'applications': 'Applications',
    'welcome_title': 'Bienvenue dans le futur de la Blockchain avec Pactus!',
    'welcome_description': 'Là où lavenir de la blockchain se dévoile avec'
        ' confiance et transparence dans chaque transaction. Rejoignez-nous'
        ' pour façonner une révolution décentralisée!',
    'start_button_text': 'Commencer',
  };
  static const Map<String, dynamic> esES = {
    'title': '¡Hola, Mundo  !',
    'subtitle': 'Bienvenido a Localización',
    'description': 'Has pulsado el botón tantas veces:',
    'switch_language': 'Cambiar idioma',
    'applications': 'Applications',
    'welcome_title': 'Bienvenido al futuro de la cadena de bloques con Pactus!',
    'welcome_description': 'Donde el futuro de la cadena de bloques'
        ' se desarrolla con confianza y transparencia en cada transacción.'
        ' Únase a nosotros para dar forma a una revolución descentralizada!',
    'start_button_text': 'Empezar',
  };

  static const Map<String, Map<String, dynamic>> mapLocales = {
    'en_US': enUS,
    'fr_FR': frFR,
    'es_ES': esES,
  };
}
