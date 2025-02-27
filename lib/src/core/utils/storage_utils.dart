import 'package:shared_preferences/shared_preferences.dart';

class StorageUtils {
  factory StorageUtils() => _instance;
  StorageUtils._();
  static final StorageUtils _instance = StorageUtils._();

  static const String _installationFinishedKey = 'isInstallationFinished';
  static const String _passwordKey = 'savedPassword';

  /// Saves the installation completion status to local storage.
  static Future<void> setInstallationFinished({
    required bool isFinished,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_installationFinishedKey, isFinished);
  }

  /// Retrieves the installation completion status from local storage.
  static Future<bool> isInstallationFinished() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_installationFinishedKey) ?? false;
  }

  /// Saves the password to local storage if it's not empty.
  static Future<void> savePasswordIfNotEmpty(String password) async {
    if (password.isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_passwordKey, password);
    }
  }

  /// Retrieves the saved password from local storage.
  static Future<String?> getSavedPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_passwordKey);
  }
}
