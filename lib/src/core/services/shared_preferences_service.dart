import 'package:gui/src/core/constants/app_constants.dart';
import 'package:gui/src/features/main/language/data/language_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService(this._preferences);
  final SharedPreferences _preferences;

  static Future<SharedPreferencesService> initialize() async {
    final preferences = await SharedPreferences.getInstance();
    return SharedPreferencesService(preferences);
  }

  String getSelectedLanguage() {
    return _preferences.getString(AppConstants.languagePrefsKey) ??
        Language.english.code;
  }

  Future<bool> setSelectedLanguage(String languageCode) {
    return _preferences.setString(AppConstants.languagePrefsKey, languageCode);
  }

  Future<bool> saveSelectedLanguage(String languageCode) {
    return setSelectedLanguage(languageCode);
  }
}
