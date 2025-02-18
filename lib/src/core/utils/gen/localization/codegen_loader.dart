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
// ignore_for_file: lines_longer_than_80_chars
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
    'welcome_description':
        'Where the future of blockchain unfolds with trust and transparency in every transaction. Join us in shaping a decentralized revolution!',
    'start_button_text': 'Get Started',
    'initialize_mode': 'Initialize mode',
    'wallet_seed': 'Wallet seed',
    'confirm_seed': 'Confirm seed',
    'master_password': 'Confirm seed',
    'validator_config': 'Validator config',
    'initializing': 'Initializing',
    'finish': 'Finish',
    'initiate_your_node': 'Initiate your node',
    'initiate_your_node_for_first_time': 'Initiate your node for first time',
    'create_local_node_from_scrache': 'Create local node from scrache',
    'restore_local_node_from_seed_pharse':
        'Restore local node from seed pharse',
    'connect_to_remote_node': 'Connect to remote node',
    'remote_address': 'Remote Address',
    'auth_method': 'Auth Method',
    'username': 'Username',
    'password': 'Password',
    'basic_auth': 'Basic Auth',
    'error': 'Error',
    'directory_not_empty':
        'Directory is not empty. Need empty directory to continue.',
    'select': 'Select',
    'working_directory': 'Working Directory',
    'choose_your_directory': 'Choose your directory',
    'select_folder': 'Select Folder',
    'validator_config_description':
        'Setting your path to decentralized consensus with precision and scalability',
    'number_of_validators': 'Number of Validators',
  };
  static const Map<String, dynamic> frFR = {
    'title': 'Bonjour le monde  !',
    'subtitle': 'Bienvenue dans Localisation',
    'description': 'Vous avez appuyé sur le bouton autant de fois :',
    'switch_language': 'Changer de langue',
    'applications': 'Applications',
    'welcome_title': 'Bienvenue dans le futur de la Blockchain avec Pactus!',
    'welcome_description':
        'Là où lavenir de la blockchain se dévoile avec confiance et transparence dans chaque transaction. Rejoignez-nous pour façonner une révolution décentralisée!',
    'start_button_text': 'Commencer',
    'initialize_mode': 'Mode d initialisation',
    'wallet_seed': 'Graine de portefeuille',
    'confirm_seed': 'Confirmer la graine',
    'master_password': 'Confirmer le mot de passe principal',
    'validator_config': 'Configuration du validateur',
    'initializing': 'Initialisation',
    'finish': 'Terminer',
    'initiate_your_node': 'Initier votre nœud',
    'initiate_your_node_for_first_time':
        'Initier votre nœud pour la première fois',
    'create_local_node_from_scrache': 'Créer un nœud local à partir de zéro',
    'restore_local_node_from_seed_pharse':
        'Restaurer un nœud local à partir de la phrase de récupération',
    'connect_to_remote_node': 'Se connecter à un nœud distant',
    'remote_address': 'Adresse distante',
    'auth_method': 'Méthode d authentification',
    'username': 'Nom d utilisateur',
    'password': 'Mot de passe',
    'basic_auth': 'Authentification de base',
    'error': 'Erreur',
    'directory_not_empty':
        'Le répertoire n est pas vide. Un répertoire vide est nécessaire pour continuer.',
    'select': 'Sélectionner',
    'working_directory': 'Répertoire de travail',
    'choose_your_directory': 'Choisissez votre répertoire',
    'select_folder': 'Sélectionner un dossier',
    'validator_config_description':
        'Définir votre chemin vers un consensus décentralisé avec précision et évolutivité',
    'number_of_validators': 'Nombre de validateurs',
  };
  static const Map<String, dynamic> esES = {
    'title': '¡Hola, Mundo  !',
    'subtitle': 'Bienvenido a Localización',
    'description': 'Has pulsado el botón tantas veces:',
    'switch_language': 'Cambiar idioma',
    'applications': 'Applications',
    'welcome_title': 'Bienvenido al futuro de la cadena de bloques con Pactus!',
    'welcome_description':
        'Donde el futuro de la cadena de bloques se desarrolla con confianza y transparencia en cada transacción. Únase a nosotros para dar forma a una revolución descentralizada!',
    'start_button_text': 'Empezar',
    'initialize_mode': 'Modo de inicialización',
    'wallet_seed': 'Semilla de billetera',
    'confirm_seed': 'Confirmar semilla',
    'master_password': 'Confirmar contraseña maestra',
    'validator_config': 'Configuración del validador',
    'initializing': 'Inicializando',
    'finish': 'Finalizar',
    'initiate_your_node': 'Iniciar tu nodo',
    'initiate_your_node_for_first_time': 'Iniciar tu nodo por primera vez',
    'create_local_node_from_scrache': 'Crear nodo local desde cero',
    'restore_local_node_from_seed_pharse':
        'Restaurar nodo local desde la frase semilla',
    'connect_to_remote_node': 'Conectar a nodo remoto',
    'remote_address': 'Dirección remota',
    'auth_method': 'Método de autenticación',
    'username': 'Nombre de usuario',
    'password': 'Contraseña',
    'basic_auth': 'Autenticación básica',
    'error': 'Error',
    'directory_not_empty':
        'El directorio no está vacío. Se necesita un directorio vacío para continuar.',
    'select': 'Seleccionar',
    'working_directory': 'Directorio de trabajo',
    'choose_your_directory': 'Elige tu directorio',
    'select_folder': 'Seleccionar carpeta',
    'validator_config_description':
        'Estableciendo tu camino hacia un consenso descentralizado con precisión y escalabilidad',
    'number_of_validators': 'Número de validadores',
  };

  static const Map<String, Map<String, dynamic>> mapLocales = {
    'en_US': enUS,
    'fr_FR': frFR,
    'es_ES': esES,
  };
}
