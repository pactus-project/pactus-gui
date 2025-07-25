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
      mapLocales["${Locale("${localeMap["language"]}", "${localeMap["country"]}")}"],
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
        'Where the future of blockchain unfolds with trust and transparency in every transaction. Join us in shaping the decentralized revolution!',
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
    'create_local_node_from_scratch': 'Create local node from scratch',
    'restore_local_node_from_seed_pharse':
        'Restore local node from seed phrase',
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
    'number_of_validators': 'Number Of Validators',
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
    'generation_seed_note1': 'Please write these ___ words on paper',
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
    'dashboard': 'Dashboard',
    'transaction': 'Transaction',
    'wallet': 'Wallet',
    'node_logs': 'Node Logs',
    'settings': 'Settings',
    'clock': 'Clock',
    'faqs': 'FAQs',
    'accent_color': 'Accent Color',
    'about': 'About',
    'language': 'Language',
    'faq': 'FAQ',
    'answer_faq':
        'This FAQ (Frequently Asked Questions) page aims to provide helpful information and guidance on common questions and concerns related to Pactus.',
    'what_does_pactus_mean': 'What does "Pactus" mean?',
    'answer_what_does_pactus_mean':
        'The word "Pactus" is of Latin origin and means "to agree together", "contract", or "transact". In English, the term "Pact" is derived from the Latin word "Pactus".',
    'is_pactus_a_copy_of_any_other_blockchain':
        'Is Pactus a copy of any other blockchain?',
    'answer_is_pactus_a_copy_of_any_other_blockchain':
        'No, Pactus is not a copy or a derivative of any other blockchain. It is a new and unique blockchain protocol that has been designed from scratch. The consensus mechanism used in Pactus is unique and specifically created to solve the scalability issue of validators in the Proof of Stake blockchains.',
    'did_pactus_have_an_ico': 'Did Pactus have an ICO?',
    'answer_did_pactus_have_an_ico':
        'No, Pactus did not have any ICO or Initial Coin Offering.',
    'where_can_i_buy_pactus_coins': 'Where can I buy Pactus coins?',
    'answer_where_can_i_buy_pactus_coins':
        'Pactus does not have any pre-sales coins. The only way to obtain Pactus coins at the moment is by installing the Pactus software and actively participating in block validation. By engaging in the network and contributing to block validation, you will be rewarded with Pactus coins.',
    'how_is_pactus_different_from_bitcoin':
        'How is Pactus different from Bitcoin?',
    'answer_how_is_pactus_different_from_bitcoin':
        'Pactus and Bitcoin are two different types of blockchain networks. While Bitcoin uses a process called "Proof of Work" to secure its network, Pactus uses a different method called "Proof of Stake". This means that instead of mining, validators are responsible for voting on incoming blocks and must hold a certain amount of the network coin, known as "stake", as a security deposit to prevent malicious behavior.',
    'how_is_pactus_different_from_ethereum':
        'How is Pactus different from Ethereum?',
    'answer_how_is_pactus_different_from_ethereum':
        'Pactus and Ethereum are both Proof of Stake blockchains, but they differ in their approach to running a validator. Running a validator on Ethereum can be challenging and requires 32 Ethereum coins to stake. In Pactus, there is no fixed amount for staking. Pactus is specifically designed to be more accessible to normal users, and you can run the Pactus blockchain on your personal computer with basic hardware.',
    'about_pactus_gui': 'About Pactus GUI',
    'answer_about_pactus_gui':
        'Pactus GUI is a user-friendly, open-source graphical interface built to provide seamless access to the Pactus blockchain for both beginners and advanced users. Designed to simplify blockchain interaction, Pactus GUI offers an intuitive layout and comprehensive tools for managing nodes, validating transactions, and observing blockchain activity in real time. Through this interface, users can easily perform complex blockchain operations without needing command-line experience, making it accessible for a wide range of participants.',
    'key_features_and_functionalities': 'Key Features and Functionalities',
    'node_management': 'Node Management',
    'answer_first_node_management':
        'Setup and Configuration: Pactus GUI facilitates easy setup for running a blockchain node. It allows users to configure nodes as either full or pruned nodes, depending on their storage capacity and needs. Pruned Mode, introduced in recent versions, ensures nodes retain only the most recent blocks, optimizing storage and improving sync times',
    'answer_second_node_management':
        'Node Type Selection: The GUI provides a streamlined onboarding process with a "Node Type" selection page, making it simple for users to switch between Full Node and Pruned Node setups based on storage capabilities and network role preferences.',
    'transaction_management': 'Transaction Management',
    'answer_transaction_management':
        'Through Pactus GUI, users can handle various transaction types, including sending and receiving PAC (Pactus is native token). The interface provides real-time transaction status, confirmations, and an overview of transaction history, making it easy for users to monitor their PAC activity. Advanced features, such as the gRPC API, allow developers to programmatically interact with the blockchain, pulling detailed transaction data',
    'security_and_privacy': 'Security and Privacy',
    'answer_security_and_privacy':
        'Pactus GUI integrates enhanced security measures to ensure user data protection and safe transaction processing. With the latest update, Pactus has improved firewall functions to validate incoming messages and detect malicious attempts, ensuring a secure environment for users to interact with the blockchain. The system architecture and security features are constantly reviewed to align with the latest in blockchain security protocols',
    'decentralization_and_accessibility': 'Decentralization and Accessibility',
    'answer_decentralization_and_accessibility':
        'As a decentralization-first blockchain, Pactus eliminates centralized control, allowing users to participate without intermediaries. The GUI further promotes this ethos by offering an accessible means to become a validator on the network. Users who stake PAC coins on their nodes gain validator privileges, participate in block creation, and earn rewards, all through the intuitive GUI. This democratizes access to the Pactus ecosystem, making blockchain participation possible for those without specialized technical knowledge',
    'committee_size': 'Committee Size',
    'committee_power': 'Committee Power',
    'total_power': 'Total Power',
    'label': 'Label',
    'address': 'Address',
    'committee': 'Committee',
    'score': 'Score',
    'stake': 'Stake',
    'submit': 'Submit',
    'noSeedGenerated': 'No seed words generated.',
    'generatedSeed': 'Generated Seed',
    'startNode': 'Start Node',
    'user_experience_enhancements': 'User Experience Enhancements',
    'answer_user_experience_enhancements':
        'Pactus GUI is optimized for cross-platform compatibility, running smoothly on Windows, macOS, and Linux. This allows users across different operating systems to access the software effortlessly. The GUI is constantly updated to address issues, improve performance, and add new features, such as faster sync options and more efficient node management tools, enhancing the overall user experience.',
    'realtime_blockchain_monitoring': 'Real-Time Blockchain Monitoring',
    'answer_realtime_blockchain_monitoring':
        'Users can monitor real-time data on the Pactus blockchain, including current block height, transaction rates, and network health, all displayed through an interactive dashboard within the GUI. This feature is especially useful for developers and power users who require detailed network insights for decision-making or development purposes. Pactus GUI embodies the projects commitment to creating a decentralized and user-friendly blockchain ecosystem. With continuous updates, the GUI is evolving to meet the needs of a growing user base, facilitating decentralized finance (DeFi) participation and empowering users to interact with blockchain technology easily and securely. Whether you`re looking to become a validator, manage transactions, or simply monitor blockchain activity, Pactus GUI offers an accessible and powerful solution for engaging with the Pactus network. With Pactus GUI, blockchain becomes intuitive and approachable, inviting users to take part in the decentralization movement through a simple, secure, and efficient platform.',
    'current_application_version': 'Current application version',
    'coming_soon': 'Coming Soon',
    'generate_seed_button': 'Generate seed',
    'generate_button': 'Generate',
    'seed_placeholder': 'Seed will appear here',
    'password_mismatch_error': 'Passwords do not match!',
    'directory_creation_failed':
        'Failed to create application directory. Please check permissions and try again.',
    'error_node_duplicate_running':
        'Duplicate node is running. The node is locked.',
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
    'create_local_node_from_scratch': 'Créer un nœud local à partir de zéro',
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
    'number_of_validators': 'Nombre de Validateurs',
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
    'generation_seed_note1': 'Veuillez écrire ces ___ mots sur papier',
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
    'dashboard': 'Tableau de bord',
    'transaction': 'Transaction',
    'wallet': 'Portefeuille',
    'node_logs': 'Journaux du nœud',
    'settings': 'Paramètres',
    'faqs': 'FAQ',
    'accent_color': 'Couleur d Accent',
    'about': 'À propos',
    'language': 'Langue',
    'faq': 'FAQ',
    'answer_faq':
        'Cette page de FAQ (Foire Aux Questions) vise à fournir des informations utiles et des conseils sur les questions et préoccupations courantes liées à Pactus.',
    'what_does_pactus_mean': 'Que signifie "Pactus" ?',
    'answer_what_does_pactus_mean':
        'Le mot "Pactus" vient du latin et signifie "se mettre en accord", "contrat" ou "transaction". En anglais, le terme "Pact" provient du mot latin "Pactus".',
    'is_pactus_a_copy_of_any_other_blockchain':
        'Pactus est-il une copie de une autre blockchain ?',
    'answer_is_pactus_a_copy_of_any_other_blockchain':
        'Non, Pactus ne représente ni une copie ni une version dérivée de une autre blockchain. Il s’agit d’un protocole de blockchain entièrement nouveau et unique, développé depuis le début. Le mécanisme de consensus utilisé dans Pactus est spécifique et a été créé pour résoudre le problème de la scalabilité des validateurs dans les blockchains fondées sur la Preuve de Participation.',
    'did_pactus_have_an_ico': 'Pactus a-t-il eu une ICO ?',
    'answer_did_pactus_have_an_ico':
        'Non, Pactus ne a pas eu une ICO ou une Offre Initiale de Monnaies.',
    'where_can_i_buy_pactus_coins': 'Où puis-je acheter des pièces Pactus ?',
    'answer_where_can_i_buy_pactus_coins':
        'Pactus ne possède aucune pièce en prévente. La seule manière pour obtenir des pièces Pactus pour le moment est de installer le logiciel Pactus et de participer activement à la validation des blocs. En participant au réseau et en contribuant à la validation, vous recevrez des pièces Pactus en récompense.',
    'how_is_pactus_different_from_bitcoin':
        'En quoi Pactus est-il différent de Bitcoin ?',
    'answer_how_is_pactus_different_from_bitcoin':
        'Pactus et Bitcoin sont deux types de réseaux blockchain différents. Alors que Bitcoin utilise un processus appelé "Preuve de Travail" pour sécuriser son réseau, Pactus utilise une méthode différente appelée "Preuve de Enjeu". Cela signifie que au lieu de miner, les validateurs sont responsables de voter sur les blocs entrants et doivent détenir une certaine quantité de pièces du réseau, appelée "enjeu", comme dépôt de garantie pour prévenir les comportements malveillants.',
    'how_is_pactus_different_from_ethereum':
        'En quoi Pactus est-il différent de Ethereum ?',
    'answer_how_is_pactus_different_from_ethereum':
        'Pactus et Ethereum sont tous les deux des blockchains à Preuve de Enjeu, mais ils diffèrent dans leur approche pour exécuter un validador. Exécuter un validador sur Ethereum peut être difficile et nécessite 32 pièces Ethereum pour miser. Dans Pactus, il ne y a pas de montant fixe pour miser. Pactus est spécifiquement conçu pour être plus accessible aux utilisateurs ordinaires, et vous pouvez exécuter la blockchain Pactus sur votre ordinateur personnel avec un matériel de base.',
    'about_pactus_gui': 'À propos de Pactus GUI',
    'answer_about_pactus_gui':
        'Pactus GUI est une interface graphique open-source et conviviale conçue pour offrir un accès fluide à la blockchain Pactus, tant pour les débutants que pour les utilisateurs avancés. Créée pour simplifier linteraction avec la blockchain, Pactus GUI propose une mise en page intuitive et des outils complets pour gérer les nœuds, valider les transactions et observer lactivité de la blockchain en temps réel. Grâce à cette interface, les utilisateurs peuvent facilement effectuer des opérations complexes sur la blockchain sans avoir besoin dexpérience en ligne de commande, la rendant accessible à un large éventail de participants.',
    'key_features_and_functionalities':
        'Caractéristiques et Fonctionnalités Clés',
    'node_management': 'Gestion des Nœuds',
    'answer_first_node_management':
        'Configuration et Installation : Pactus GUI facilite la mise en place dun nœud de blockchain. Il permet aux utilisateurs de configurer les nœuds en tant que nœuds complets ou nœuds élagués, selon leur capacité de stockage et leurs besoins. Le mode élagué, introduit dans les versions récentes, garantit que les nœuds ne conservent que les blocs les plus récents, optimisant le stockage et améliorant les temps de synchronisation.',
    'answer_second_node_management':
        'Sélection du Type de Nœud : Linterface graphique propose un processus dintégration simplifié avec une page de sélection du Type de Nœud, permettant aux utilisateurs de passer facilement entre les configurations de Nœud Complet et Nœud Élagué en fonction des capacités de stockage et des préférences de rôle dans le réseau.',
    'transaction_management': 'Gestion des Transactions',
    'answer_transaction_management':
        'Via Pactus GUI, les utilisateurs peuvent gérer différents types de transactions, y compris lenvoi et la réception de PAC (le jeton natif de Pactus). Linterface fournit le statut des transactions en temps réel, les confirmations et un aperçu de lhistorique des transactions, facilitant le suivi de lactivité PAC par les utilisateurs. Des fonctionnalités avancées, telles que lAPI gRPC, permettent aux développeurs dinteragir de manière programmatique avec la blockchain, en extrayant des données détaillées sur les transactions.',
    'security_and_privacy': 'Sécurité et Confidentialité',
    'answer_security_and_privacy':
        'Pactus GUI intègre des mesures de sécurité renforcées pour garantir la protection des données des utilisateurs et le traitement sécurisé des transactions. Avec la dernière mise à jour, Pactus a amélioré les fonctions de pare-feu pour valider les messages entrants et détecter les tentatives malveillantes, assurant un environnement sécurisé pour les interactions des utilisateurs avec la blockchain. Larchitecture du système et les fonctionnalités de sécurité sont constamment examinées pour saligner sur les derniers protocoles de sécurité de la blockchain.',
    'decentralization_and_accessibility': 'Décentralisation et Accessibilité',
    'answer_decentralization_and_accessibility':
        'En tant que blockchain privilégiant la décentralisation, Pactus élimine le contrôle centralisé, permettant aux utilisateurs de participer sans intermédiaires. Linterface graphique renforce cet ethos en offrant un moyen accessible de devenir validateur sur le réseau. Les utilisateurs qui misent des jetons PAC sur leurs nœuds obtiennent des privilèges de validateur, participent à la création de blocs et gagnent des récompenses, le tout via linterface graphique intuitive. Cela démocratise laccès à lécosystème Pactus, rendant la participation à la blockchain possible pour ceux qui nont pas de connaissances techniques spécialisées.',
    'committee_size': 'Taille du Comité',
    'committee_power': 'Puissance du Comité',
    'total_power': 'Puissance Totale',
    'label': 'Étiquette',
    'address': 'Adresse',
    'committee': 'Comité',
    'score': 'Score',
    'stake': 'Enjeu',
    'submit': 'Soumettre',
    'noSeedGenerated': 'Aucune graine générée.',
    'generatedSeed': 'Graine Générée',
    'startNode': 'Démarrer le Nœud',
    'user_experience_enhancements': 'Améliorations de l`expérience utilisateur',
    'answer_user_experience_enhancements':
        'L`interface graphique de Pactus est optimisée pour une compatibilité multiplateforme, fonctionnant sans problème sur Windows, macOS et Linux. Cela permet aux utilisateurs de différents systèmes d`exploitation d`accéder au logiciel sans effort. L`interface est constamment mise à jour pour résoudre les problèmes, améliorer les performances et ajouter de nouvelles fonctionnalités, telles que des options de synchronisation plus rapides et des outils de gestion de nœuds plus efficaces, améliorant ainsi l`expérience utilisateur globale.',
    'realtime_blockchain_monitoring':
        'Surveillance en temps réel de la blockchain',
    'answer_realtime_blockchain_monitoring':
        'Les utilisateurs peuvent surveiller les données en temps réel sur la blockchain Pactus, y compris la hauteur de bloc actuelle, les taux de transaction et l`état du réseau, le tout affiché via un tableau de bord interactif dans l`interface graphique. Cette fonctionnalité est particulièrement utile pour les développeurs et les utilisateurs avancés qui ont besoin d`informations détaillées sur le réseau pour la prise de décision ou le développement. L`interface graphique de Pactus incarne l`engagement du projet à créer un écosystème blockchain décentralisé et convivial. Avec des mises à jour continues, l`interface évolue pour répondre aux besoins d`une base d`utilisateurs en croissance, facilitant la participation à la finance décentralisée (DeFi) et permettant aux utilisateurs d`interagir avec la technologie blockchain de manière simple et sécurisée. Que vous souhaitiez devenir un validateur, gérer des transactions ou simplement surveiller l`activité de la blockchain, l`interface graphique de Pactus offre une solution accessible et puissante pour interagir avec le réseau Pactus. Avec Pactus GUI, la blockchain devient intuitive et abordable, invitant les utilisateurs à participer au mouvement de décentralisation à travers une plateforme simple, sécurisée et efficace.',
    'current_application_version': 'Version actuelle de l`application',
    'coming_soon': 'Prochainement',
    'generate_seed_button': 'Générer une graine',
    'generate_button': 'Générer',
    'seed_placeholder': 'La graine apparaîtra ici',
    'password_mismatch_error': 'Les mots de passe ne correspondent pas !',
    'directory_creation_failed':
        'Échec de la création du répertoire. Veuillez vérifier les permissions et réessayer.',
    'error_node_duplicate_running':
        'Un nœud dupliqué est actif. Le nœud est verrouillé.',
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
    'create_local_node_from_scratch': 'Crear nodo local desde cero',
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
    'number_of_validators': 'Número de Validadores',
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
    'generation_seed_note1': 'Por favor escribe estas ___ palabras en papel',
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
    'node_activation_powering':
        'Activación del Nodo, Alimentando el Pulso de la Blockchain',
    'initialization_complete': 'Inicialización Completa',
    'node_ready': 'Nodo Listo',
    'initialization_failed': 'Inicialización Fallida',
    'retry': 'Reintentar',
    'initialization_success': 'Inicialización Exitosa',
    'invalid_validator_number': 'Número de validador inválido proporcionado',
    'ok': 'Aceptar',
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
    'dashboard': 'Panel de control',
    'transaction': 'Transacción',
    'wallet': 'Monedero',
    'node_logs': 'Registros del nodo',
    'settings': 'Configuración',
    'faqs': 'Preguntas frecuentes',
    'accent_color': 'Accent Color',
    'about': 'Acerca de',
    'language': 'Language',
    'faq': 'Preguntas frecuentes',
    'answer_faq':
        'Esta página de Preguntas Frecuentes (FAQ) tiene como objetivo proporcionar información útil y orientación sobre preguntas y preocupaciones comunes relacionadas con Pactus.',
    'what_does_pactus_mean': '¿Qué significa "Pactus"?',
    'answer_what_does_pactus_mean':
        'La palabra "Pactus" es de origen latino y significa "acordar juntos", "contrato" o "transacción". En inglés, el término "Pact" deriva de la palabra latina "Pactus".',
    'is_pactus_a_copy_of_any_other_blockchain':
        '¿Es Pactus una copia de alguna otra blockchain?',
    'answer_is_pactus_a_copy_of_any_other_blockchain':
        'No, Pactus no es una copia ni un derivado de ninguna otra blockchain. Es un protocolo de blockchain nuevo y único que ha sido diseñado desde cero. El mecanismo de consenso utilizado en Pactus es único y creado específicamente para resolver el problema de scalabilidad de los validadores en las blockchains de Prueba de Participación.',
    'did_pactus_have_an_ico': '¿Tuvo Pactus una ICO?',
    'answer_did_pactus_have_an_ico':
        'No, Pactus no tuvo ninguna ICO o Oferta Inicial de Monedas.',
    'where_can_i_buy_pactus_coins': '¿Dónde puedo comprar monedas Pactus?',
    'answer_where_can_i_buy_pactus_coins':
        'Pactus no tiene monedas en preventa. La única forma de obtener monedas Pactus en este momento es instalando el software Pactus y participando activamente en la validación de bloques. Al participar en la red y contribuir a la validación de bloques, serás recompensado con monedas Pactus.',
    'how_is_pactus_different_from_bitcoin':
        '¿En qué se diferencia Pactus de Bitcoin?',
    'answer_how_is_pactus_different_from_bitcoin':
        'Pactus y Bitcoin son dos tipos diferentes de redes blockchain. Mientras que Bitcoin utiliza un proceso llamado "Prueba de Trabajo" para asegurar su red, Pactus usa un método diferente llamado "Prueba de Participación". Esto significa que, en lugar de minar, los validadores son responsables de votar sobre los bloques entrantes y deben poseer una cierta cantidad de monedas de la red, conocida como "participación", como depósito de seguridad para prevenir comportamientos maliciosos.',
    'how_is_pactus_different_from_ethereum':
        '¿En qué se diferencia Pactus de Ethereum?',
    'answer_how_is_pactus_different_from_ethereum':
        'Pactus y Ethereum son ambas blockchains de Prueba de Participación, pero difieren en su enfoque para ejecutar un validador. Ejecutar un validador en Ethereum puede ser desafiante y requiere 32 monedas Ethereum para participar. En Pactus, no hay una cantidad fija para la participación. Pactus está diseñado específicamente para ser más accesible para usuarios normales, y puedes ejecutar la blockchain Pactus en tu computadora personal con hardware básico.',
    'about_pactus_gui': 'Acerca de Pactus GUI',
    'answer_about_pactus_gui':
        'Pactus GUI es una interfaz gráfica de código abierto y fácil de usar diseñada para proporcionar un acceso fluido a la blockchain de Pactus tanto para principiantes como para usuarios avanzados. Creada para simplificar la interacción con la blockchain, Pactus GUI ofrece un diseño intuitivo y herramientas completas para gestionar nodos, validar transacciones y observar la actividad de la blockchain en tiempo real. A través de esta interfaz, los usuarios pueden realizar operaciones complejas de blockchain fácilmente sin necesidad de experiencia en línea de comandos, haciéndola accesible para una amplia gama de participantes.',
    'key_features_and_functionalities':
        'Características y Funcionalidades Clave',
    'node_management': 'Gestión de Nodos',
    'answer_first_node_management':
        'Configuración e Instalación: Pactus GUI facilita la configuración para ejecutar un nodo de blockchain. Permite a los usuarios configurar nodos como nodos completos o nodos podados, dependiendo de su capacidad de almacenamiento y necesidades. El Modo Podado, introducido en versiones recientes, asegura que los nodos solo retengan los bloques más recientes, optimizando el almacenamiento y mejorando los tiempos de sincronización.',
    'answer_second_node_management':
        'Selección de Tipo de Nodo: La GUI ofrece un proceso de incorporación simplificado con una página de selección de Tipo de Nodo, que facilita a los usuarios alternar entre configuraciones de Nodo Completo y Nodo Podado según las capacidades de almacenamiento y preferencias de rol en la red.',
    'transaction_management': 'Gestión de Transacciones',
    'answer_transaction_management':
        'A través de Pactus GUI, los usuarios pueden manejar varios tipos de transacciones, incluyendo el envío y recepción de PAC (el token nativo de Pactus). La interfaz proporciona el estado de las transacciones en tiempo real, confirmaciones y un resumen del historial de transacciones, facilitando a los usuarios el seguimiento de su actividad con PAC. Las características avanzadas, como la API gRPC, permiten a los desarrolladores interactuar programáticamente con la blockchain, extrayendo datos detallados de transacciones.',
    'security_and_privacy': 'Seguridad y Privacidad',
    'answer_security_and_privacy':
        'Pactus GUI integra medidas de seguridad mejoradas para garantizar la protección de los datos de los usuarios y el procesamiento seguro de transacciones. Con la última actualización, Pactus ha mejorado las funciones de firewall para validar mensajes entrantes y detectar intentos maliciosos, asegurando un entorno seguro para que los usuarios interactúen con la blockchain. La arquitectura del sistema y las características de seguridad se revisan constantemente para alinearse con los últimos protocolos de seguridad de blockchain.',
    'decentralization_and_accessibility': 'Descentralización y Accesibilidad',
    'answer_decentralization_and_accessibility':
        'Como una blockchain que prioriza la descentralización, Pactus elimina el control centralizado, permitiendo a los usuarios participar sin intermediarios. La GUI promueve aún más este principio al ofrecer un medio accesible para convertirse en validador en la red. Los usuarios que apuestan monedas PAC en sus nodos obtienen privilegios de validador, participan en la creación de bloques y ganan recompensas, todo a través de la intuitiva GUI. Esto democratiza el acceso al ecosistema de Pactus, haciendo posible la participación en la blockchain para aquellos sin conocimientos técnicos especializados.',
    'committee_size': 'Tamaño del Comité',
    'committee_power': 'Poder del Comité',
    'total_power': 'Poder Total',
    'label': 'Etiqueta',
    'address': 'Dirección',
    'committee': 'Comité',
    'score': 'Puntuación',
    'stake': 'Participación',
    'submit': 'Enviar',
    'noSeedGenerated': 'No se generaron palabras semilla.',
    'generatedSeed': 'Semilla Generada',
    'startNode': 'Iniciar Nodo',
    'user_experience_enhancements': 'Mejoras en la Experiencia de Usuario',
    'answer_user_experience_enhancements':
        'La GUI de Pactus está optimizada para la compatibilidad multiplataforma, funcionando sin problemas en Windows, macOS y Linux. Esto permite a los usuarios de diferentes sistemas operativos acceder al software sin esfuerzo. La GUI se actualiza constantemente para solucionar problemas, mejorar el rendimiento y agregar nuevas funciones, como opciones de sincronización más rápidas y herramientas de gestión de nodos más eficientes, mejorando así la experiencia general del usuario.',
    'realtime_blockchain_monitoring':
        'Monitoreo en Tiempo Real de la Blockchain',
    'answer_realtime_blockchain_monitoring':
        'Los usuarios pueden monitorear datos en tiempo real en la blockchain de Pactus, incluida la altura de bloque actual, las tasas de transacción y el estado de la red, todo mostrado a través de un panel interactivo dentro de la GUI. Esta característica es especialmente útil para desarrolladores y usuarios avanzados que requieren información detallada de la red para la toma de decisiones o fines de desarrollo. La GUI de Pactus encarna el compromiso del proyecto de crear un ecosistema blockchain descentralizado y fácil de usar. Con actualizaciones continuas, la GUI está evolucionando para satisfacer las necesidades de una base de usuarios en crecimiento, facilitando la participación en las finanzas descentralizadas (DeFi) y permitiendo a los usuarios interactuar con la tecnología blockchain de manera fácil y segura. Ya sea que desee convertirse en validador, gestionar transacciones o simplemente monitorear la actividad de la blockchain, la GUI de Pactus ofrece una solución accesible y potente para interactuar con la red Pactus. Con Pactus GUI, la blockchain se vuelve intuitiva y accesible, invitando a los usuarios a ser parte del movimiento de descentralización a través de una plataforma simple, segura y eficiente.',
    'current_application_version': 'Versión actual de la aplicación',
    'coming_soon': 'Próximamente',
    'generate_seed_button': 'Generar semilla',
    'generate_button': 'Generar',
    'seed_placeholder': 'La semilla aparecerá aquí',
    'password_mismatch_error': '¡Las contraseñas no coinciden!',
    'directory_creation_failed':
        'No se pudo crear el directorio. Por favor verifique los permisos e intente nuevamente.',
    'error_node_duplicate_running':
        'Un nodo duplicado está en ejecución. El nodo está bloqueado.',
  };

  static const Map<String, Map<String, dynamic>> mapLocales = {
    'en_US': enUS,
    'fr_FR': frFR,
    'es_ES': esES,
  };
}
