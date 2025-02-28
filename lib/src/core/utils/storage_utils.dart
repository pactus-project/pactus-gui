import 'package:shared_preferences/shared_preferences.dart';

class StorageUtils {
  factory StorageUtils() => _instance;
  StorageUtils._();
  static final StorageUtils _instance = StorageUtils._();

  static const String _installationFinishedKey = 'isInstallationFinished';
  static const String _passwordKey = 'savedPassword';
  static const String _hasPasswordKey = 'hasPassword';

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

  /// Saves a flag indicating whether a password exists.
  /// If password is not empty, saves true, otherwise saves false.
  static Future<void> savePasswordIfNotEmpty(
      {required bool hasPassword,}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hasPasswordKey, hasPassword);
  }

  /// Checks if a password exists in local storage.
  static Future<bool> hasPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_hasPasswordKey) ?? false;
  }

  /// Clears the saved password from local storage.
  static Future<void> clearPassword() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_passwordKey);
    await prefs.setBool(_hasPasswordKey, false);
  }
}
