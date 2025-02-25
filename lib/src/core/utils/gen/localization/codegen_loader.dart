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
    'welcome_title': 'Welcome to the Future of Blockchain with Pactus!',
    'welcome_description':
        'Where the future of blockchain unfolds with trust and transparency in every transaction. Join us in shaping a decentralized revolution!',
    'start_button_text': 'Get Started',
    'applications': 'Applications',
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
    'next': 'Next',
    'unlock_wallet': 'Unlock',
    'unlock_wallet_description': 'Enter the master password to unlock',
    'enter_your_password': 'Enter your password',
    'password_cannot_be_empty': 'Password cannot be empty',
    'incorrect_password': 'Incorrect password',
    'unlock_failed': 'Unlock failed. Please try again.',
    'basic_auth': 'Basic Auth',
    'error': 'Error',
    'select': 'Select',
    'working_directory': 'Working directory',
    'choose_your_directory': 'Choose your directory',
    'select_folder': 'Select folder',
    'validator_config_description':
        'Setting your path to decentralized consensus with precision and scalability',
    'number_of_validators': 'Number of Validators',
    'directory_not_empty':
        'Directory is not empty. Need empty directory to continue.',
    'generation_seed_title': 'Your wallet generation seed',
    'generation_seed_description':
        'Initiate your cryptographic journey with confidence',
    'generation_seed_note1': 'Please write these 24 words on paper',
    'generation_seed_note2':
        'This seed will allow you to recover your wallet in case of computer failure',
    'warning': 'WARNING',
    'generation_seed_warning1': 'Never disclose your seed',
    'generation_seed_warning2': 'Never type it on a website',
    'generation_seed_warning3': 'Do not store it electronically',
    'copy_to_clipboard': 'Copy to clipboard',
    'clipboard_dialog_title': 'Copy Successful',
    'clipboard_dialog_content':
        'Your seed words have been copied to the clipboard',
    'ok': 'ok',
  };
  static const Map<String, dynamic> frFR = {
    'title': 'Bonjour le monde!',
    'subtitle': 'Bienvenue dans Localisation',
    'description': 'Vous avez appuyé sur le bouton autant de fois :',
    'switch_language': 'Changer de langue',
    'welcome_title': 'Bienvenue dans le futur de la Blockchain avec Pactus!',
    'welcome_description':
        'Là où lavenir de la blockchain se dévoile avec confiance et transparence dans chaque transaction. Rejoignez-nous pour façonner une révolution décentralisée!',
    'start_button_text': 'Commencer',
    'applications': 'Applications',
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
    'next': 'Suivant',
    'unlock_wallet': 'Déverrouiller le portefeuille',
    'unlock_wallet_description':
        'Entrez le mot de passe principal pour déverrouiller',
    'enter_your_password': 'Entrez votre mot de passe',
    'password_cannot_be_empty': 'Le mot de passe ne peut pas être vide',
    'incorrect_password': 'Mot de passe incorrect',
    'unlock_failed': 'Déverrouillage impossible. Veuillez réessayer.',
    'basic_auth': 'Authentification de base',
    'error': 'Erreur',
    'select': 'Sélectionner',
    'working_directory': 'Répertoire de travail',
    'choose_your_directory': 'Choisissez votre répertoire',
    'select_folder': 'Sélectionner un dossier',
    'validator_config_description':
        'Définir votre chemin vers un consensus décentralisé avec précision et évolutivité',
    'number_of_validators': 'Nombre de validateurs',
    'directory_not_empty':
        'Le répertoire n est pas vide. Un répertoire vide est nécessaire pour continuer.',
    'generation_seed_title': 'Votre graine de génération de portefeuille',
    'generation_seed_description':
        'Initiez votre voyage cryptographique en toute confiance',
    'generation_seed_note1': 'Veuillez écrire ces 24 mots sur papier',
    'generation_seed_note2':
        'Cette graine vous permettra de récupérer votre portefeuille en cas de panne de lordinateur',
    'warning': 'AVERTISSEMENT',
    'generation_seed_warning1': 'Ne révélez jamais votre graine',
    'generation_seed_warning2': 'Ne la tapez jamais sur un site Web',
    'generation_seed_warning3': 'Ne la stockez pas électroniquement',
    'copy_to_clipboard': 'Copier dans le presse-papiers',
    'clipboard_dialog_title': 'Copie réussie',
    'clipboard_dialog_content':
        'Vos mots de récupération ont été copiés dans le presse-papiers',
    'ok': 'Daccord',
  };
  static const Map<String, dynamic> esES = {
    'title': '¡Hola, Mundo  !',
    'subtitle': 'Bienvenido a Localización',
    'description': 'Has pulsado el botón tantas veces:',
    'switch_language': 'Cambiar idioma',
    'welcome_title': 'Bienvenido al futuro de la cadena de bloques con Pactus!',
    'welcome_description':
        'Donde el futuro de la cadena de bloques se desarrolla con confianza y transparencia en cada transacción. Únase a nosotros para dar forma a una revolución descentralizada!',
    'start_button_text': 'Empezar',
    'applications': 'Applications',
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
    'next': 'Siguiente',
    'unlock_wallet': 'Desbloquear',
    'unlock_wallet_description':
        'Ingrese la contraseña maestra para desbloquear',
    'enter_your_password': 'Ingrese su contraseña',
    'password_cannot_be_empty': 'La contraseña no puede estar vacía',
    'incorrect_password': 'Contraseña incorrecta',
    'unlock_failed': 'Desbloqueo fallido. Por favor, inténtelo de nuevo.',
    'basic_auth': 'Autenticación básica',
    'error': 'Error',
    'select': 'Seleccionar',
    'working_directory': 'Directorio de trabajo',
    'choose_your_directory': 'Elige tu directorio',
    'select_folder': 'Seleccionar carpeta',
    'validator_config_description':
        'Estableciendo tu camino hacia un consenso descentralizado con precisión y escalabilidad',
    'number_of_validators': 'Número de validadores',
    'directory_not_empty':
        'El directorio no está vacío. Se necesita un directorio vacío para continuar.',
    'generation_seed_title': 'Tu semilla de generación de billetera',
    'generation_seed_description':
        'Inicia tu viaje criptográfico con confianza',
    'generation_seed_note1': 'Por favor, escribe estas 24 palabras en papel',
    'generation_seed_note2':
        'Esta semilla te permitirá recuperar tu billetera en caso de falla del ordenador',
    'warning': 'ADVERTENCIA',
    'generation_seed_warning1': 'Nunca reveles tu semilla',
    'generation_seed_warning2': 'Nunca la escribas en un sitio web',
    'generation_seed_warning3': 'No la almacenes electrónicamente',
    'copy_to_clipboard': 'Copiar al portapapeles',
    'clipboard_dialog_title': 'Copia exitosa',
    'clipboard_dialog_content':
        'Tus palabras clave han sido copiadas al portapapeles',
    'ok': 'Aceptar',
  };

  static const Map<String, Map<String, dynamic>> mapLocales = {
    'en_US': enUS,
    'fr_FR': frFR,
    'es_ES': esES,
  };
}
