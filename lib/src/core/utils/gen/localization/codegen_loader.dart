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
    'master_password': 'Master Password',
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
    'unlock_wallet': 'Unlock',
    'unlock_wallet_description': 'Enter the master password to unlock',
    'enter_your_password': 'Enter your password',
    'password_cannot_be_empty': 'Password cannot be empty',
    'incorrect_password': 'Incorrect password',
    'unlock_failed': 'Unlock failed. Please try again.',
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
    'your_journey_finalized':
        'Your journey finalized, your success on the horizon',
    'go_to_dashboard': 'Go to Dashboard',
    'go_to_dashboard_description': 'Go to dashboard to manage your node',
    'next': 'Next',
    'basic_auth': 'Basic Auth',
    'your_journey_finalized_description':
        'Venturing into the realm of blockchain technology, Pactus heralds an era of uncompromised decentralization that stands in contrast to its contemporaries. It eschews traditional power hierarchies, parting ways with delegated proof-of-stake systems and mining operations that could lead to power concentration. By doing so, Pactus lowers its ramparts, inviting participants from all walks of life to join as equals in maintaining the network. Within this communal tapestry, every user has the opportunity to operate as a validator client, contributing to the network#s invulnerability to control or censorship, ensuring the platform#s integrity and autonomy.',
    'your_journey_finalized_description_last':
        'Pactus isn#t just revolutionizing the structure of blockchain governance; it#s also remapping the user experience. Crafted with the conviction that blockchain should be accessible to all, the Pactus chain boasts a simple yet sophisticated graphical user interface (GUI) that demystifies the process of running a node. The elegance lies in its simplicity - a clear, approachable design that veils the robust and intricate mechanics beneath, allowing users, regardless of their technical prowess, to participate as validator clients. This move towards inclusivity transforms users from mere participants to guardians of the blockchain, an essential facet of the Pactus ecosystem.',
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
    'unlock_button': 'Unlock Button',
    'node_activation_powering':
        'Node Activation, Powering the Pulse of the Blockchain',
    'initialization_complete': 'Initialization Complete',
    'node_ready': 'Node Ready',
    'initialization_failed': 'Initialization Failed',
    'retry': 'Retry',
    'initialization_success': 'Initialization Success',
    'invalid_validator_number': 'Invalid validator number provided',
    'seed_twelve_words': '12 words',
    'seed_twenty_four_words': '24 words',
    'restoration': 'Restoration',
    'restoration_seed_title': 'Restoration Seed',
    'restoration_seed_description':
        'Restoration seed, your key to digital resilience and recovery',
    'please_input_all_fields': 'Please input all fields before continuing',
    'master_password_description':
        'Your keystone to cryptographic security. This password makes your node secure',
    'confirm_password': 'Confirm Password',
    'skip': 'skip',
    'back': 'Back',
    'confirmation_seed_title': 'Confirmation Seed',
    'confirmation_seed_description':
        'Embark with assurance, your gateway to secure seed generation',
    'log': 'Log',
    'connection': 'Connection',
    'reachability': 'Reachability',
    'inbound_outbound': '(Inbound: 0, Outbound: 1)',
    'public': 'Public',
    'clock_offset': 'Clock Offset',
    'clock_offset_description': '0 second(s)',
  };
  static const Map<String, dynamic> frFR = {
    'title': 'Bonjour le Monde!',
    'subtitle': 'Bienvenue dans la Localisation',
    'description': 'Vous avez appuyé sur le bouton autant de fois:',
    'switch_language': 'Changer de langue',
    'applications': 'Applications',
    'welcome_title': 'Bienvenue dans le Futur de la Blockchain avec Pactus!',
    'welcome_description':
        'Où lavenir de la blockchain se déploie avec confiance et transparence dans chaque transaction. Rejoignez-nous pour façonner une révolution décentralisée!',
    'start_button_text': 'Commencer',
    'initialize_mode': 'Mode dinitialisation',
    'wallet_seed': 'Graine de portefeuille',
    'confirm_seed': 'Confirmer la graine',
    'master_password': 'mot de passe principal',
    'validator_config': 'Configuration du validateur',
    'initializing': 'Initialisation',
    'finish': 'Terminer',
    'initiate_your_node': 'Initialiser votre nœud',
    'initiate_your_node_for_first_time':
        'Initialiser votre nœud pour la première fois',
    'create_local_node_from_scrache': 'Créer un nœud local à partir de zéro',
    'restore_local_node_from_seed_pharse':
        'Restaurer le nœud local à partir de la phrase germinative',
    'connect_to_remote_node': 'Se connecter à un nœud distant',
    'remote_address': 'Adresse distante',
    'auth_method': 'Méthode dauthentification',
    'username': 'Nom dutilisateur',
    'password': 'Mot de passe',
    'unlock_wallet': 'Déverrouiller',
    'unlock_wallet_description':
        'Entrez le mot de passe principal pour déverrouiller',
    'enter_your_password': 'Entrez votre mot de passe',
    'password_cannot_be_empty': 'Le mot de passe ne peut pas être vide',
    'incorrect_password': 'Mot de passe incorrect',
    'unlock_failed': 'Échec du déverrouillage. Veuillez réessayer.',
    'error': 'Erreur',
    'select': 'Sélectionner',
    'working_directory': 'Répertoire de travail',
    'choose_your_directory': 'Choisissez votre répertoire',
    'select_folder': 'Sélectionner un dossier',
    'validator_config_description':
        'Configuration de votre chemin vers un consensus décentralisé avec précision et évolutivité',
    'number_of_validators': 'Nombre de validateurs',
    'directory_not_empty':
        'Le répertoire nest pas vide. Un répertoire vide est nécessaire pour continuer.',
    'your_journey_finalized': 'Votre voyage finalisé, votre succès à lhorizon',
    'go_to_dashboard': 'Aller au Tableau de bord',
    'go_to_dashboard_description':
        'Aller au tableau de bord pour gérer votre nœud',
    'next': 'Suivant',
    'basic_auth': 'Authentification de base',
    'your_journey_finalized_description':
        'Venturing into the realm of blockchain technology, Pactus heralds an era of uncompromised decentralization that stands in contrast to its contemporaries. It eschews traditional power hierarchies, parting ways with delegated proof-of-stake systems and mining operations that could lead to power concentration. By doing so, Pactus lowers its ramparts, inviting participants from all walks of life to join as equals in maintaining the network. Within this communal tapestry, every user has the opportunity to operate as a validator client, contributing to the network#s invulnerability to control or censorship, ensuring the platform#s integrity and autonomy.',
    'your_journey_finalized_description_last':
        'Pactus isn#t just revolutionizing the structure of blockchain governance; it#s also remapping the user experience. Crafted with the conviction that blockchain should be accessible to all, the Pactus chain boasts a simple yet sophisticated graphical user interface (GUI) that demystifies the process of running a node. The elegance lies in its simplicity - a clear, approachable design that veils the robust and intricate mechanics beneath, allowing users, regardless of their technical prowess, to participate as validator clients. This move towards inclusivity transforms users from mere participants to guardians of the blockchain, an essential facet of the Pactus ecosystem.',
    'generation_seed_title': 'Votre graine de génération de portefeuille',
    'generation_seed_description':
        'Commencez votre voyage cryptographique en toute confiance',
    'generation_seed_note1': 'Veuillez écrire ces 24 mots sur papier',
    'generation_seed_note2':
        'Cette graine vous permettra de récupérer votre portefeuille en cas de panne informatique',
    'warning': 'AVERTISSEMENT',
    'generation_seed_warning1': 'Ne divulguez jamais votre graine',
    'generation_seed_warning2': 'Ne la saisissez jamais sur un site web',
    'generation_seed_warning3': 'Ne la stockez pas électroniquement',
    'copy_to_clipboard': 'Copier dans le presse-papiers',
    'clipboard_dialog_title': 'Copie réussie',
    'clipboard_dialog_content':
        'Vos mots de graine ont été copiés dans le presse-papiers',
    'ok': 'ok',
    'node_activation_powering':
        'Activation du Nœud, Alimenter le Pouls de la Blockchain',
    'initialization_complete': 'Initialisation Terminée',
    'node_ready': 'Nœud Prêt',
    'initialization_failed': 'Échec de lInitialisation',
    'retry': 'Réessayer',
    'initialization_success': 'Succès de lInitialisation',
    'invalid_validator_number': 'Nombre de validateur fourni invalide',
    'unlock_button': 'Déverrouiller',
    'seed_twelve_words': '12 mots',
    'seed_twenty_four_words': '24 mots',
    'restoration': 'Restauration',
    'restoration_seed_title': 'Graine de Restauration',
    'restoration_seed_description':
        'Graine de restauration, votre clé pour la résilience et la récupération numériques',
    'please_input_all_fields':
        'Veuillez entrer tous les champs avant de continuer',
    'master_password_description':
        'Votre clé de voûte pour la sécurité cryptographique. Ce mot de passe sécurise votre nœud.',
    'confirm_password': 'Confirmer le mot de passe',
    'skip': 'Passer',
    'back': 'Retour',
    'confirmation_seed_title': 'Confirmation de la graine',
    'confirmation_seed_description':
        'Embarquez en toute confiance, votre passerelle vers une génération de graine sécurisée',
    'log': 'Journal',
    'clock': 'Horloge',
    'connection': 'Connexion',
    'reachability': 'Atteignabilité',
    'inbound_outbound': '(Inbound: 0, Outbound: 1)',
    'public': 'Public',
    'clock_offset': 'Décalage horaire',
    'clock_offset_description': '0 secondes',
  };
  static const Map<String, dynamic> esES = {
    'title': 'Hola Mundo!',
    'subtitle': 'Bienvenido a la Localización',
    'description': 'Has presionado el botón esta cantidad de veces:',
    'switch_language': 'Cambiar idioma',
    'applications': 'Aplicaciones',
    'welcome_title': '¡Bienvenido al Futuro de Blockchain con Pactus!',
    'welcome_description':
        'Donde el futuro de blockchain se despliega con confianza y transparencia en cada transacción. ¡Únase a nosotros para dar forma a una revolución descentralizada!',
    'start_button_text': 'Comenzar',
    'initialize_mode': 'Modo de inicialización',
    'wallet_seed': 'Semilla de billetera',
    'confirm_seed': 'Confirmar semilla',
    'master_password': 'contraseña maestra',
    'validator_config': 'Configuración del validador',
    'initializing': 'Inicializando',
    'finish': 'Finalizar',
    'initiate_your_node': 'Iniciar tu nodo',
    'initiate_your_node_for_first_time': 'Iniciar tu nodo por primera vez',
    'create_local_node_from_scrache': 'Crear nodo local desde cero',
    'restore_local_node_from_seed_pharse':
        'Restaurar nodo local desde frase semilla',
    'connect_to_remote_node': 'Conectar a nodo remoto',
    'remote_address': 'Dirección remota',
    'auth_method': 'Método de autenticación',
    'username': 'Nombre de usuario',
    'password': 'Contraseña',
    'unlock_wallet': 'Desbloquear',
    'unlock_wallet_description':
        'Ingrese la contraseña maestra para desbloquear',
    'enter_your_password': 'Ingrese su contraseña',
    'password_cannot_be_empty': 'La contraseña no puede estar vacía',
    'incorrect_password': 'Contraseña incorrecta',
    'unlock_failed': 'Error al desbloquear. Por favor intente nuevamente.',
    'error': 'Error',
    'select': 'Seleccionar',
    'working_directory': 'Directorio de trabajo',
    'choose_your_directory': 'Elija su directorio',
    'select_folder': 'Seleccionar carpeta',
    'validator_config_description':
        'Configurando tu camino hacia un consenso descentralizado con precisión y escalabilidad',
    'number_of_validators': 'Número de validadores',
    'directory_not_empty':
        'El directorio no está vacío. Necesita un directorio vacío para continuar.',
    'your_journey_finalized': 'Tu viaje finalizado, tu éxito en el horizonte',
    'go_to_dashboard': 'Ir al Panel',
    'go_to_dashboard_description': 'Ir al panel para administrar tu nodo',
    'next': 'Siguiente',
    'basic_auth': 'Autenticación básica',
    'your_journey_finalized_description':
        'Aventurándose en el ámbito de la tecnología blockchain, Pactus anuncia una era de descentralización sin compromisos que contrasta con sus contemporáneos. Rechaza las jerarquías de poder tradicionales, separándose de los sistemas de prueba de participación delegada y las operaciones de minería que podrían llevar a la concentración de poder. Al hacerlo, Pactus baja sus murallas, invitando a participantes de todos los ámbitos a unirse como iguales en el mantenimiento de la red. Dentro de este tapiz comunal, cada usuario tiene la oportunidad de operar como un cliente validador, contribuyendo a la invulnerabilidad de la red al control o censura, asegurando la integridad y autonomía de la plataforma.',
    'your_journey_finalized_description_last':
        'Pactus no solo está revolucionando la estructura de la gobernanza blockchain; también está redefiniendo la experiencia del usuario. Diseñado con la convicción de que blockchain debería ser accesible para todos, la cadena Pactus cuenta con una interfaz gráfica de usuario (GUI) simple pero sofisticada que desmitifica el proceso de ejecución de un nodo. La elegancia radica en su simplicidad: un diseño claro y accesible que oculta la mecánica robusta y compleja debajo, permitiendo a los usuarios, independientemente de su destreza técnica, participar como clientes validadores. Este movimiento hacia la inclusión transforma a los usuarios de meros participantes en guardianes de la blockchain, un aspecto esencial del ecosistema Pactus.',
    'generation_seed_title': 'Tu semilla de generación de billetera',
    'generation_seed_description':
        'Inicia tu viaje criptográfico con confianza',
    'generation_seed_note1': 'Por favor escribe estas 24 palabras en papel',
    'generation_seed_note2':
        'Esta semilla te permitirá recuperar tu billetera en caso de falla de la computadora',
    'warning': 'ADVERTENCIA',
    'generation_seed_warning1': 'Nunca reveles tu semilla',
    'generation_seed_warning2': 'Nunca la ingreses en un sitio web',
    'generation_seed_warning3': 'No la almacenes electrónicamente',
    'copy_to_clipboard': 'Copiar al portapapeles',
    'clipboard_dialog_title': 'Copia exitosa',
    'clipboard_dialog_content':
        'Tus palabras semilla han sido copiadas al portapapeles',
    'ok': 'Aceptar',
    'node_activation_powering':
        'Activación del Nodo, Alimentando el Pulso de la Blockchain',
    'initialization_complete': 'Inicialización Completa',
    'node_ready': 'Nodo Listo',
    'initialization_failed': 'Inicialización Fallida',
    'retry': 'Reintentar',
    'initialization_success': 'Inicialización Exitosa',
    'invalid_validator_number': 'Número de validador inválido proporcionado',
    'unlock_button': 'Acceder al tablero',
    'seed_twelve_words': '12 palabras',
    'seed_twenty_four_words': '24 palabras',
    'restoration': 'Restauración',
    'restoration_seed_title': 'Semilla de Restauración',
    'restoration_seed_description':
        'Semilla de restauración, tu clave para la resiliencia y recuperación digital',
    'please_input_all_fields':
        'Por favor ingrese todos los campos antes de continuar',
    'master_password_description':
        'Tu piedra angular para la seguridad criptográfica. Esta contraseña hace que tu nodo sea seguro.',
    'confirm_password': 'Confirmar contraseña',
    'skip': 'Omitir',
    'back': 'Atrás',
    'confirmation_seed_title': 'Confirmación de la semilla',
    'confirmation_seed_description':
        'Embárcate con confianza, tu puerta de entrada a una generación de semillas segura',
    'log': 'Registro',
    'clock': 'Reloj',
    'connection': 'Conexión',
    'reachability': 'Alcance',
    'inbound_outbound': '(Inbound: 0, Outbound: 1)',
    'public': 'Público',
    'clock_offset': 'Desplazamiento de reloj',
    'clock_offset_description': '0 segundos',
  };

  static const Map<String, Map<String, dynamic>> mapLocales = {
    'en_US': enUS,
    'fr_FR': frFR,
    'es_ES': esES,
  };
}
