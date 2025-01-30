class NodeConfigData {
  // Private constructor
  NodeConfigData._internal();
  // Singleton instance
  static final NodeConfigData instance = NodeConfigData._internal();

  // Private variables
  String? _workingDirectory;
  String? _restorationSeed;
  String? _password;
  String? _validatorQty;

  // Getters
  String get workingDirectory => _workingDirectory ?? '';
  String get restorationSeed => _restorationSeed ?? '';
  String get password => _password ?? '';
  String get validatorQty => _validatorQty ?? '';

  // Setters
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
