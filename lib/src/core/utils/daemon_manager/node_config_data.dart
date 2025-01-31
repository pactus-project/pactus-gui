/// [NodeConfigData] Documentation:
/// `NodeConfigData` is a singleton class that stores and manages
/// configuration data related to a Pactus blockchain node initialization .
///
/// ## Features:
/// - Implements the Singleton pattern to ensure a single instance.
/// - Provides getters and setters for essential configuration properties.
/// - Stores working directory, restoration seed, password, and validator
/// quantity.
///
/// ## Usage:
/// ```dart
/// final config = NodeConfigData.instance;
/// config.workingDirectory = "/path/to/dir";
/// print(config.workingDirectory);
/// ```
///
/// ## Notes:
/// - Default values are empty strings to prevent null issues.
class NodeConfigData {
  // Private constructor to enforce the Singleton pattern
  NodeConfigData._internal();

  /// The single instance of [NodeConfigData]
  static final NodeConfigData instance = NodeConfigData._internal();

  // Private variables
  String? _workingDirectory;
  String? _restorationSeed;
  String? _password;
  String? _validatorQty;

  // Getters - return empty strings if values are null
  String get workingDirectory => _workingDirectory ?? '';
  String get restorationSeed => _restorationSeed ?? '';
  String get password => _password ?? '';
  String get validatorQty => _validatorQty ?? '';

  // Setters - update private variables
  set workingDirectory(String value) {
    _workingDirectory = value;
  }

  set restorationSeed(String value) {
    _restorationSeed = value;
  }

  set password(String value) {
    _password = value;
  }

  set validatorQty(String value) {
    _validatorQty = value;
  }
}
