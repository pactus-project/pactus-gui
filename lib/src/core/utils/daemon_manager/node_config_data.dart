import 'package:bip39_mnemonic/bip39_mnemonic.dart';

/// [NodeConfigData] Documentation:
/// `NodeConfigData` is a singleton class that stores and manages
/// configuration data related to a Pactus blockchain node initialization.
///
/// ## Features:
/// - Implements the Singleton pattern to ensure only one instance is used
/// globally.
/// - Provides getters and setters for configuration properties such as:
///   - Working directory
///   - Restoration seed (using [Mnemonic] class from `bip39_mnemonic`)
///   - Password
///   - Validator quantity
///
/// ## Usage:
/// ```dart
/// final config = NodeConfigData.instance;
/// config.workingDirectory = "/path/to/dir";
/// print(config.workingDirectory);
/// config.restorationSeed = Mnemonic.fromWords('word1 word2 word3 ...');
/// print(config.restorationSeed?.words); // prints the 12-word seed
/// ```
///
/// ## Features Explained:
/// - **Working Directory**: Holds the path for the working directory where
/// blockchain-related files are stored.
/// - **Restoration Seed**: A seed phrase for wallet recovery, stored using the
/// [Mnemonic] class from the `bip39_mnemonic` package.
/// - **Password**: Stores the password for securing the node or wallet.
/// - **Validator Quantity**: Stores the number of validators required in the
/// node setup.
///
/// ## Notes:
/// - Default values are empty strings for `workingDirectory`, `password`, and
/// `validatorQty` to prevent null values.
/// - The `restorationSeed` is stored as an instance of the `Mnemonic` class,
/// which provides functionality for working with the BIP-39 seed phrase.
///
/// ## Example Code:
/// ```dart
/// // Retrieve the single instance of NodeConfigData
/// final config = NodeConfigData.instance;
///
/// // Set configuration data
/// config.workingDirectory = '/home/user/pactus';
/// config.restorationSeed = Mnemonic.fromWords('abandon abandon abandon
/// abandon abandon abandon abandon abandon abandon abandon abandon abandon
/// abandon abandon');
/// config.password = 'securepassword123';
/// config.validatorQty = '10';
///
/// // Access configuration data
/// print(config.workingDirectory);  // Output: /home/user/pactus
/// print(config.restorationSeed?.words);  // Output: [abandon, abandon, ...]
/// print(config.password);  // Output: securepassword123
/// print(config.validatorQty);  // Output: 10
/// ```
class NodeConfigData {
  // Private constructor to enforce the Singleton pattern
  NodeConfigData._internal();

  /// The single instance of [NodeConfigData]
  static final NodeConfigData instance = NodeConfigData._internal();

  // Private variables
  String? _workingDirectory;
  Mnemonic? _restorationSeed;
  String? _password;
  String? _validatorQty;

  // Getters - return empty strings if values are null
  String get workingDirectory => _workingDirectory ?? '';
  Mnemonic? get restorationSeed => _restorationSeed;
  String get password => _password ?? '';
  String get validatorQty => _validatorQty ?? '';

  // Setters - update private variables
  set workingDirectory(String value) {
    _workingDirectory = value;
  }

  set restorationSeed(Mnemonic? value) {
    _restorationSeed = value;
  }

  set password(String value) {
    _password = value;
  }

  set validatorQty(String value) {
    _validatorQty = value;
  }
}
