import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr')
  ];

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Hello, World  !'**
  String get title;

  /// No description provided for @subtitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Localization'**
  String get subtitle;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'You have pushed the button this many times:'**
  String get description;

  /// No description provided for @switch_language.
  ///
  /// In en, this message translates to:
  /// **'Switch language'**
  String get switch_language;

  /// No description provided for @applications.
  ///
  /// In en, this message translates to:
  /// **'Applications'**
  String get applications;

  /// No description provided for @welcome_title.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the Future of Blockchain with Pactus!'**
  String get welcome_title;

  /// No description provided for @welcome_description.
  ///
  /// In en, this message translates to:
  /// **'Where the future of blockchain unfolds with trust and transparency in every transaction. Join us in shaping the decentralized revolution!'**
  String get welcome_description;

  /// No description provided for @start_button_text.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get start_button_text;

  /// No description provided for @initialize_mode.
  ///
  /// In en, this message translates to:
  /// **'Initialize mode'**
  String get initialize_mode;

  /// No description provided for @wallet_seed.
  ///
  /// In en, this message translates to:
  /// **'Wallet seed'**
  String get wallet_seed;

  /// No description provided for @confirm_seed.
  ///
  /// In en, this message translates to:
  /// **'Confirm seed'**
  String get confirm_seed;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @master_password.
  ///
  /// In en, this message translates to:
  /// **'Master Password'**
  String get master_password;

  /// No description provided for @validator_config.
  ///
  /// In en, this message translates to:
  /// **'Validator config'**
  String get validator_config;

  /// No description provided for @initializing.
  ///
  /// In en, this message translates to:
  /// **'Initializing'**
  String get initializing;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @initiate_your_node.
  ///
  /// In en, this message translates to:
  /// **'Initiate your node'**
  String get initiate_your_node;

  /// No description provided for @initiate_your_node_for_first_time.
  ///
  /// In en, this message translates to:
  /// **'Initiate your node for first time'**
  String get initiate_your_node_for_first_time;

  /// No description provided for @create_local_node_from_scratch.
  ///
  /// In en, this message translates to:
  /// **'Create local node from scratch'**
  String get create_local_node_from_scratch;

  /// No description provided for @restore_local_node_from_seed_pharse.
  ///
  /// In en, this message translates to:
  /// **'Restore local node from seed phrase'**
  String get restore_local_node_from_seed_pharse;

  /// No description provided for @connect_to_remote_node.
  ///
  /// In en, this message translates to:
  /// **'Connect to remote node'**
  String get connect_to_remote_node;

  /// No description provided for @remote_address.
  ///
  /// In en, this message translates to:
  /// **'Remote Address'**
  String get remote_address;

  /// No description provided for @auth_method.
  ///
  /// In en, this message translates to:
  /// **'Auth Method'**
  String get auth_method;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @unlock_wallet.
  ///
  /// In en, this message translates to:
  /// **'Unlock'**
  String get unlock_wallet;

  /// No description provided for @unlock_wallet_description.
  ///
  /// In en, this message translates to:
  /// **'Enter the master password to unlock'**
  String get unlock_wallet_description;

  /// No description provided for @enter_your_password.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enter_your_password;

  /// No description provided for @password_cannot_be_empty.
  ///
  /// In en, this message translates to:
  /// **'Password cannot be empty'**
  String get password_cannot_be_empty;

  /// No description provided for @incorrect_password.
  ///
  /// In en, this message translates to:
  /// **'Incorrect password'**
  String get incorrect_password;

  /// No description provided for @unlock_failed.
  ///
  /// In en, this message translates to:
  /// **'Unlock failed. Please try again.'**
  String get unlock_failed;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @working_directory.
  ///
  /// In en, this message translates to:
  /// **'Working directory'**
  String get working_directory;

  /// No description provided for @choose_your_directory.
  ///
  /// In en, this message translates to:
  /// **'Choose your directory'**
  String get choose_your_directory;

  /// No description provided for @select_folder.
  ///
  /// In en, this message translates to:
  /// **'Select folder'**
  String get select_folder;

  /// No description provided for @validator_config_description.
  ///
  /// In en, this message translates to:
  /// **'Setting your path to decentralized consensus with precision and scalability'**
  String get validator_config_description;

  /// No description provided for @number_of_validators.
  ///
  /// In en, this message translates to:
  /// **'Number Of Validators'**
  String get number_of_validators;

  /// No description provided for @directory_not_empty.
  ///
  /// In en, this message translates to:
  /// **'Directory is not empty. Need empty directory to continue.'**
  String get directory_not_empty;

  /// No description provided for @your_journey_finalized.
  ///
  /// In en, this message translates to:
  /// **'Your journey finalized, your success on the horizon'**
  String get your_journey_finalized;

  /// No description provided for @go_to_dashboard.
  ///
  /// In en, this message translates to:
  /// **'Go to Dashboard'**
  String get go_to_dashboard;

  /// No description provided for @go_to_dashboard_description.
  ///
  /// In en, this message translates to:
  /// **'Go to dashboard to manage your node'**
  String get go_to_dashboard_description;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @basic_auth.
  ///
  /// In en, this message translates to:
  /// **'Basic Auth'**
  String get basic_auth;

  /// No description provided for @your_journey_finalized_description.
  ///
  /// In en, this message translates to:
  /// **'Venturing into the realm of blockchain technology, Pactus heralds an era of uncompromised decentralization that stands in contrast to its contemporaries. It eschews traditional power hierarchies, parting ways with delegated proof-of-stake systems and mining operations that could lead to power concentration. By doing so, Pactus lowers its ramparts, inviting participants from all walks of life to join as equals in maintaining the network. Within this communal tapestry, every user has the opportunity to operate as a validator client, contributing to the network#s invulnerability to control or censorship, ensuring the platform#s integrity and autonomy.'**
  String get your_journey_finalized_description;

  /// No description provided for @your_journey_finalized_description_last.
  ///
  /// In en, this message translates to:
  /// **'Pactus isn#t just revolutionizing the structure of blockchain governance; it#s also remapping the user experience. Crafted with the conviction that blockchain should be accessible to all, the Pactus chain boasts a simple yet sophisticated graphical user interface (GUI) that demystifies the process of running a node. The elegance lies in its simplicity - a clear, approachable design that veils the robust and intricate mechanics beneath, allowing users, regardless of their technical prowess, to participate as validator clients. This move towards inclusivity transforms users from mere participants to guardians of the blockchain, an essential facet of the Pactus ecosystem.'**
  String get your_journey_finalized_description_last;

  /// No description provided for @generation_seed_title.
  ///
  /// In en, this message translates to:
  /// **'Your wallet generation seed'**
  String get generation_seed_title;

  /// No description provided for @generation_seed_description.
  ///
  /// In en, this message translates to:
  /// **'Initiate your cryptographic journey with confidence'**
  String get generation_seed_description;

  /// No description provided for @generation_seed_note1.
  ///
  /// In en, this message translates to:
  /// **'Please write these ___ words on paper'**
  String get generation_seed_note1;

  /// No description provided for @generation_seed_note2.
  ///
  /// In en, this message translates to:
  /// **'This seed will allow you to recover your wallet in case of computer failure'**
  String get generation_seed_note2;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'WARNING'**
  String get warning;

  /// No description provided for @generation_seed_warning1.
  ///
  /// In en, this message translates to:
  /// **'Never disclose your seed'**
  String get generation_seed_warning1;

  /// No description provided for @generation_seed_warning2.
  ///
  /// In en, this message translates to:
  /// **'Never type it on a website'**
  String get generation_seed_warning2;

  /// No description provided for @generation_seed_warning3.
  ///
  /// In en, this message translates to:
  /// **'Do not store it electronically'**
  String get generation_seed_warning3;

  /// No description provided for @copy_to_clipboard.
  ///
  /// In en, this message translates to:
  /// **'Copy to clipboard'**
  String get copy_to_clipboard;

  /// No description provided for @clipboard_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Copy Successful'**
  String get clipboard_dialog_title;

  /// No description provided for @clipboard_dialog_content.
  ///
  /// In en, this message translates to:
  /// **'Your seed words have been copied to the clipboard'**
  String get clipboard_dialog_content;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'ok'**
  String get ok;

  /// No description provided for @unlock_button.
  ///
  /// In en, this message translates to:
  /// **'Unlock Button'**
  String get unlock_button;

  /// No description provided for @node_activation_powering.
  ///
  /// In en, this message translates to:
  /// **'Node Activation, Powering the Pulse of the Blockchain'**
  String get node_activation_powering;

  /// No description provided for @initialization_complete.
  ///
  /// In en, this message translates to:
  /// **'Initialization Complete'**
  String get initialization_complete;

  /// No description provided for @node_ready.
  ///
  /// In en, this message translates to:
  /// **'Node Ready'**
  String get node_ready;

  /// No description provided for @initialization_failed.
  ///
  /// In en, this message translates to:
  /// **'Initialization Failed'**
  String get initialization_failed;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @initialization_success.
  ///
  /// In en, this message translates to:
  /// **'Initialization Success'**
  String get initialization_success;

  /// No description provided for @invalid_validator_number.
  ///
  /// In en, this message translates to:
  /// **'Invalid validator number provided'**
  String get invalid_validator_number;

  /// No description provided for @seed_twelve_words.
  ///
  /// In en, this message translates to:
  /// **'12 words'**
  String get seed_twelve_words;

  /// No description provided for @seed_twenty_four_words.
  ///
  /// In en, this message translates to:
  /// **'24 words'**
  String get seed_twenty_four_words;

  /// No description provided for @restoration.
  ///
  /// In en, this message translates to:
  /// **'Restoration'**
  String get restoration;

  /// No description provided for @restoration_seed_title.
  ///
  /// In en, this message translates to:
  /// **'Restoration Seed'**
  String get restoration_seed_title;

  /// No description provided for @restoration_seed_description.
  ///
  /// In en, this message translates to:
  /// **'Restoration seed, your key to digital resilience and recovery'**
  String get restoration_seed_description;

  /// No description provided for @please_input_all_fields.
  ///
  /// In en, this message translates to:
  /// **'Please input all fields before continuing'**
  String get please_input_all_fields;

  /// No description provided for @master_password_description.
  ///
  /// In en, this message translates to:
  /// **'Your keystone to cryptographic security. This password makes your node secure'**
  String get master_password_description;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'skip'**
  String get skip;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @confirmation_seed_title.
  ///
  /// In en, this message translates to:
  /// **'Confirmation Seed'**
  String get confirmation_seed_title;

  /// No description provided for @confirmation_seed_description.
  ///
  /// In en, this message translates to:
  /// **'Embark with assurance, your gateway to secure seed generation'**
  String get confirmation_seed_description;

  /// No description provided for @log.
  ///
  /// In en, this message translates to:
  /// **'Log'**
  String get log;

  /// No description provided for @connection.
  ///
  /// In en, this message translates to:
  /// **'Connection'**
  String get connection;

  /// No description provided for @reachability.
  ///
  /// In en, this message translates to:
  /// **'Reachability'**
  String get reachability;

  /// No description provided for @inbound_outbound.
  ///
  /// In en, this message translates to:
  /// **'(Inbound: 0, Outbound: 1)'**
  String get inbound_outbound;

  /// No description provided for @public.
  ///
  /// In en, this message translates to:
  /// **'Public'**
  String get public;

  /// No description provided for @clock_offset.
  ///
  /// In en, this message translates to:
  /// **'Clock Offset'**
  String get clock_offset;

  /// No description provided for @clock_offset_description.
  ///
  /// In en, this message translates to:
  /// **'0 second(s)'**
  String get clock_offset_description;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @transaction.
  ///
  /// In en, this message translates to:
  /// **'Transaction'**
  String get transaction;

  /// No description provided for @wallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get wallet;

  /// No description provided for @node_logs.
  ///
  /// In en, this message translates to:
  /// **'Node Logs'**
  String get node_logs;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @clock.
  ///
  /// In en, this message translates to:
  /// **'Clock'**
  String get clock;

  /// No description provided for @faqs.
  ///
  /// In en, this message translates to:
  /// **'FAQs'**
  String get faqs;

  /// No description provided for @accent_color.
  ///
  /// In en, this message translates to:
  /// **'Accent Color'**
  String get accent_color;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// No description provided for @answer_faq.
  ///
  /// In en, this message translates to:
  /// **'This FAQ (Frequently Asked Questions) page aims to provide helpful information and guidance on common questions and concerns related to Pactus.'**
  String get answer_faq;

  /// No description provided for @what_does_pactus_mean.
  ///
  /// In en, this message translates to:
  /// **'What does \"Pactus\" mean?'**
  String get what_does_pactus_mean;

  /// No description provided for @answer_what_does_pactus_mean.
  ///
  /// In en, this message translates to:
  /// **'The word \"Pactus\" is of Latin origin and means \"to agree together\", \"contract\", or \"transact\". In English, the term \"Pact\" is derived from the Latin word \"Pactus\".'**
  String get answer_what_does_pactus_mean;

  /// No description provided for @is_pactus_a_copy_of_any_other_blockchain.
  ///
  /// In en, this message translates to:
  /// **'Is Pactus a copy of any other blockchain?'**
  String get is_pactus_a_copy_of_any_other_blockchain;

  /// No description provided for @answer_is_pactus_a_copy_of_any_other_blockchain.
  ///
  /// In en, this message translates to:
  /// **'No, Pactus is not a copy or a derivative of any other blockchain. It is a new and unique blockchain protocol that has been designed from scratch. The consensus mechanism used in Pactus is unique and specifically created to solve the scalability issue of validators in the Proof of Stake blockchains.'**
  String get answer_is_pactus_a_copy_of_any_other_blockchain;

  /// No description provided for @did_pactus_have_an_ico.
  ///
  /// In en, this message translates to:
  /// **'Did Pactus have an ICO?'**
  String get did_pactus_have_an_ico;

  /// No description provided for @answer_did_pactus_have_an_ico.
  ///
  /// In en, this message translates to:
  /// **'No, Pactus did not have any ICO or Initial Coin Offering.'**
  String get answer_did_pactus_have_an_ico;

  /// No description provided for @where_can_i_buy_pactus_coins.
  ///
  /// In en, this message translates to:
  /// **'Where can I buy Pactus coins?'**
  String get where_can_i_buy_pactus_coins;

  /// No description provided for @answer_where_can_i_buy_pactus_coins.
  ///
  /// In en, this message translates to:
  /// **'Pactus does not have any pre-sales coins. The only way to obtain Pactus coins at the moment is by installing the Pactus software and actively participating in block validation. By engaging in the network and contributing to block validation, you will be rewarded with Pactus coins.'**
  String get answer_where_can_i_buy_pactus_coins;

  /// No description provided for @how_is_pactus_different_from_bitcoin.
  ///
  /// In en, this message translates to:
  /// **'How is Pactus different from Bitcoin?'**
  String get how_is_pactus_different_from_bitcoin;

  /// No description provided for @answer_how_is_pactus_different_from_bitcoin.
  ///
  /// In en, this message translates to:
  /// **'Pactus and Bitcoin are two different types of blockchain networks. While Bitcoin uses a process called \"Proof of Work\" to secure its network, Pactus uses a different method called \"Proof of Stake\". This means that instead of mining, validators are responsible for voting on incoming blocks and must hold a certain amount of the network coin, known as \"stake\", as a security deposit to prevent malicious behavior.'**
  String get answer_how_is_pactus_different_from_bitcoin;

  /// No description provided for @how_is_pactus_different_from_ethereum.
  ///
  /// In en, this message translates to:
  /// **'How is Pactus different from Ethereum?'**
  String get how_is_pactus_different_from_ethereum;

  /// No description provided for @answer_how_is_pactus_different_from_ethereum.
  ///
  /// In en, this message translates to:
  /// **'Pactus and Ethereum are both Proof of Stake blockchains, but they differ in their approach to running a validator. Running a validator on Ethereum can be challenging and requires 32 Ethereum coins to stake. In Pactus, there is no fixed amount for staking. Pactus is specifically designed to be more accessible to normal users, and you can run the Pactus blockchain on your personal computer with basic hardware.'**
  String get answer_how_is_pactus_different_from_ethereum;

  /// No description provided for @about_pactus_gui.
  ///
  /// In en, this message translates to:
  /// **'About Pactus GUI'**
  String get about_pactus_gui;

  /// No description provided for @answer_about_pactus_gui.
  ///
  /// In en, this message translates to:
  /// **'Pactus GUI is a user-friendly, open-source graphical interface built to provide seamless access to the Pactus blockchain for both beginners and advanced users. Designed to simplify blockchain interaction, Pactus GUI offers an intuitive layout and comprehensive tools for managing nodes, validating transactions, and observing blockchain activity in real time. Through this interface, users can easily perform complex blockchain operations without needing command-line experience, making it accessible for a wide range of participants.'**
  String get answer_about_pactus_gui;

  /// No description provided for @key_features_and_functionalities.
  ///
  /// In en, this message translates to:
  /// **'Key Features and Functionalities'**
  String get key_features_and_functionalities;

  /// No description provided for @node_management.
  ///
  /// In en, this message translates to:
  /// **'Node Management'**
  String get node_management;

  /// No description provided for @answer_first_node_management.
  ///
  /// In en, this message translates to:
  /// **'Setup and Configuration: Pactus GUI facilitates easy setup for running a blockchain node. It allows users to configure nodes as either full or pruned nodes, depending on their storage capacity and needs. Pruned Mode, introduced in recent versions, ensures nodes retain only the most recent blocks, optimizing storage and improving sync times'**
  String get answer_first_node_management;

  /// No description provided for @answer_second_node_management.
  ///
  /// In en, this message translates to:
  /// **'Node Type Selection: The GUI provides a streamlined onboarding process with a \"Node Type\" selection page, making it simple for users to switch between Full Node and Pruned Node setups based on storage capabilities and network role preferences.'**
  String get answer_second_node_management;

  /// No description provided for @transaction_management.
  ///
  /// In en, this message translates to:
  /// **'Transaction Management'**
  String get transaction_management;

  /// No description provided for @answer_transaction_management.
  ///
  /// In en, this message translates to:
  /// **'Through Pactus GUI, users can handle various transaction types, including sending and receiving PAC (Pactus is native token). The interface provides real-time transaction status, confirmations, and an overview of transaction history, making it easy for users to monitor their PAC activity. Advanced features, such as the gRPC API, allow developers to programmatically interact with the blockchain, pulling detailed transaction data'**
  String get answer_transaction_management;

  /// No description provided for @security_and_privacy.
  ///
  /// In en, this message translates to:
  /// **'Security and Privacy'**
  String get security_and_privacy;

  /// No description provided for @answer_security_and_privacy.
  ///
  /// In en, this message translates to:
  /// **'Pactus GUI integrates enhanced security measures to ensure user data protection and safe transaction processing. With the latest update, Pactus has improved firewall functions to validate incoming messages and detect malicious attempts, ensuring a secure environment for users to interact with the blockchain. The system architecture and security features are constantly reviewed to align with the latest in blockchain security protocols'**
  String get answer_security_and_privacy;

  /// No description provided for @decentralization_and_accessibility.
  ///
  /// In en, this message translates to:
  /// **'Decentralization and Accessibility'**
  String get decentralization_and_accessibility;

  /// No description provided for @answer_decentralization_and_accessibility.
  ///
  /// In en, this message translates to:
  /// **'As a decentralization-first blockchain, Pactus eliminates centralized control, allowing users to participate without intermediaries. The GUI further promotes this ethos by offering an accessible means to become a validator on the network. Users who stake PAC coins on their nodes gain validator privileges, participate in block creation, and earn rewards, all through the intuitive GUI. This democratizes access to the Pactus ecosystem, making blockchain participation possible for those without specialized technical knowledge'**
  String get answer_decentralization_and_accessibility;

  /// No description provided for @committee_size.
  ///
  /// In en, this message translates to:
  /// **'Committee Size'**
  String get committee_size;

  /// No description provided for @committee_power.
  ///
  /// In en, this message translates to:
  /// **'Committee Power'**
  String get committee_power;

  /// No description provided for @total_power.
  ///
  /// In en, this message translates to:
  /// **'Total Power'**
  String get total_power;

  /// No description provided for @label.
  ///
  /// In en, this message translates to:
  /// **'Label'**
  String get label;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @committee.
  ///
  /// In en, this message translates to:
  /// **'Committee'**
  String get committee;

  /// No description provided for @score.
  ///
  /// In en, this message translates to:
  /// **'Score'**
  String get score;

  /// No description provided for @stake.
  ///
  /// In en, this message translates to:
  /// **'Stake'**
  String get stake;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @noSeedGenerated.
  ///
  /// In en, this message translates to:
  /// **'No seed words generated.'**
  String get noSeedGenerated;

  /// No description provided for @generatedSeed.
  ///
  /// In en, this message translates to:
  /// **'Generated Seed'**
  String get generatedSeed;

  /// No description provided for @startNode.
  ///
  /// In en, this message translates to:
  /// **'Start Node'**
  String get startNode;

  /// No description provided for @user_experience_enhancements.
  ///
  /// In en, this message translates to:
  /// **'User Experience Enhancements'**
  String get user_experience_enhancements;

  /// No description provided for @answer_user_experience_enhancements.
  ///
  /// In en, this message translates to:
  /// **'Pactus GUI is optimized for cross-platform compatibility, running smoothly on Windows, macOS, and Linux. This allows users across different operating systems to access the software effortlessly. The GUI is constantly updated to address issues, improve performance, and add new features, such as faster sync options and more efficient node management tools, enhancing the overall user experience.'**
  String get answer_user_experience_enhancements;

  /// No description provided for @realtime_blockchain_monitoring.
  ///
  /// In en, this message translates to:
  /// **'Real-Time Blockchain Monitoring'**
  String get realtime_blockchain_monitoring;

  /// No description provided for @answer_realtime_blockchain_monitoring.
  ///
  /// In en, this message translates to:
  /// **'Users can monitor real-time data on the Pactus blockchain, including current block height, transaction rates, and network health, all displayed through an interactive dashboard within the GUI. This feature is especially useful for developers and power users who require detailed network insights for decision-making or development purposes. Pactus GUI embodies the projects commitment to creating a decentralized and user-friendly blockchain ecosystem. With continuous updates, the GUI is evolving to meet the needs of a growing user base, facilitating decentralized finance (DeFi) participation and empowering users to interact with blockchain technology easily and securely. Whether you`re looking to become a validator, manage transactions, or simply monitor blockchain activity, Pactus GUI offers an accessible and powerful solution for engaging with the Pactus network. With Pactus GUI, blockchain becomes intuitive and approachable, inviting users to take part in the decentralization movement through a simple, secure, and efficient platform.'**
  String get answer_realtime_blockchain_monitoring;

  /// No description provided for @current_application_version.
  ///
  /// In en, this message translates to:
  /// **'Current application version'**
  String get current_application_version;

  /// No description provided for @coming_soon.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get coming_soon;

  /// No description provided for @generate_seed_button.
  ///
  /// In en, this message translates to:
  /// **'Generate seed'**
  String get generate_seed_button;

  /// No description provided for @generate_button.
  ///
  /// In en, this message translates to:
  /// **'Generate'**
  String get generate_button;

  /// No description provided for @seed_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Seed will appear here'**
  String get seed_placeholder;

  /// No description provided for @password_mismatch_error.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match!'**
  String get password_mismatch_error;

  /// No description provided for @directory_creation_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create application directory. Please check permissions and try again.'**
  String get directory_creation_failed;

  /// No description provided for @error_node_duplicate_running.
  ///
  /// In en, this message translates to:
  /// **'Duplicate node is running. The node is locked.'**
  String get error_node_duplicate_running;

  /// No description provided for @network.
  ///
  /// In en, this message translates to:
  /// **'Network'**
  String get network;

  /// No description provided for @moniker.
  ///
  /// In en, this message translates to:
  /// **'Moniker'**
  String get moniker;

  /// No description provided for @networkId.
  ///
  /// In en, this message translates to:
  /// **'Network ID'**
  String get networkId;

  /// No description provided for @workingDir.
  ///
  /// In en, this message translates to:
  /// **'Working Dir'**
  String get workingDir;

  /// No description provided for @encryptedWallet.
  ///
  /// In en, this message translates to:
  /// **'Encrypted Wallet'**
  String get encryptedWallet;

  /// No description provided for @clientVersion.
  ///
  /// In en, this message translates to:
  /// **'Client Version'**
  String get clientVersion;

  /// No description provided for @protocolVersion.
  ///
  /// In en, this message translates to:
  /// **'Protocol Version'**
  String get protocolVersion;

  /// No description provided for @nodeType.
  ///
  /// In en, this message translates to:
  /// **'Node Type'**
  String get nodeType;

  /// No description provided for @isPrune.
  ///
  /// In en, this message translates to:
  /// **'Is Prune'**
  String get isPrune;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @protocols.
  ///
  /// In en, this message translates to:
  /// **'Protocols'**
  String get protocols;

  /// No description provided for @error_no_internet.
  ///
  /// In en, this message translates to:
  /// **'No internet connection or server unreachable'**
  String get error_no_internet;

  /// No description provided for @error_timeout.
  ///
  /// In en, this message translates to:
  /// **'Request timed out, please try again'**
  String get error_timeout;

  /// No description provided for @error_unexpected.
  ///
  /// In en, this message translates to:
  /// **'Unexpected error'**
  String get error_unexpected;

  /// No description provided for @error_grpc_cancelled.
  ///
  /// In en, this message translates to:
  /// **'Request was cancelled'**
  String get error_grpc_cancelled;

  /// No description provided for @error_grpc_unauthenticated.
  ///
  /// In en, this message translates to:
  /// **'You are not authenticated'**
  String get error_grpc_unauthenticated;

  /// No description provided for @error_grpc_permission_denied.
  ///
  /// In en, this message translates to:
  /// **'Permission denied'**
  String get error_grpc_permission_denied;

  /// No description provided for @error_grpc_unavailable.
  ///
  /// In en, this message translates to:
  /// **'Service temporarily unavailable'**
  String get error_grpc_unavailable;

  /// No description provided for @error_grpc_deadline_exceeded.
  ///
  /// In en, this message translates to:
  /// **'Server took too long to respond'**
  String get error_grpc_deadline_exceeded;

  /// No description provided for @transaction_type.
  ///
  /// In en, this message translates to:
  /// **'Transaction Type'**
  String get transaction_type;

  /// No description provided for @withdraw.
  ///
  /// In en, this message translates to:
  /// **'Withdraw'**
  String get withdraw;

  /// No description provided for @bond.
  ///
  /// In en, this message translates to:
  /// **'Bond'**
  String get bond;

  /// No description provided for @unbond.
  ///
  /// In en, this message translates to:
  /// **'Unbond'**
  String get unbond;

  /// No description provided for @transfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get transfer;

  /// No description provided for @transaction_form.
  ///
  /// In en, this message translates to:
  /// **'Transaction'**
  String get transaction_form;

  /// No description provided for @confirmation.
  ///
  /// In en, this message translates to:
  /// **'Confirmation'**
  String get confirmation;

  /// No description provided for @result.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get result;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @validator.
  ///
  /// In en, this message translates to:
  /// **'Validator'**
  String get validator;

  /// No description provided for @addNote.
  ///
  /// In en, this message translates to:
  /// **'Add a note...'**
  String get addNote;

  /// No description provided for @retryGettingData.
  ///
  /// In en, this message translates to:
  /// **'Retry to getting Data'**
  String get retryGettingData;

  /// No description provided for @memo.
  ///
  /// In en, this message translates to:
  /// **'Memo'**
  String get memo;

  /// No description provided for @selectValidator.
  ///
  /// In en, this message translates to:
  /// **'Select Validator'**
  String get selectValidator;

  /// No description provided for @selectWallet.
  ///
  /// In en, this message translates to:
  /// **'Select Wallet'**
  String get selectWallet;

  /// No description provided for @error_grpc_unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown gRPC error'**
  String get error_grpc_unknown;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
