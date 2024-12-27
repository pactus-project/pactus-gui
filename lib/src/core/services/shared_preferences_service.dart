import 'package:flutter/material.dart';
import 'package:gui/src/core/constants/app_constants.dart';
import 'package:gui/src/features/main/language/data/language_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../enums/theme_modes.dart';

class SharedPreferencesService {
  SharedPreferencesService(this._preferences);
  final SharedPreferences _preferences;

  Future<String> getSelectedTheme() async {
    final savedTheme = _preferences.getString(AppConstants.themePrefsKey);

    if (savedTheme == null) {
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;

      return brightness == Brightness.light
          ? ThemeModes.light.name
          : ThemeModes.dark.name;
    }

    return savedTheme;
  }

  Future<void> saveSelectedTheme(String themeCode) async {
    if (themeCode.isEmpty) {
      await _preferences.remove(AppConstants.themePrefsKey);
    } else {
      await _preferences.setString(AppConstants.themePrefsKey, themeCode);
    }
  }

  // Language methods
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
