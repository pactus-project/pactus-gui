import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageUtils {
  StorageUtils._();

  static void clearData(String key) {
    final prefs = GetIt.instance<SharedPreferences>();
    if (prefs.containsKey(key)) {
      prefs.remove(key);
    }
  }

  static void saveData<T>(String key, T value) {
    assert(
      value is bool ||
          value is double ||
          value is int ||
          value is List<String> ||
          value is String,
      'Unsupported type: ${value.runtimeType}. '
      'Allowed types: bool, double, int, List<String>, String',
    );

    final pref = GetIt.instance<SharedPreferences>();

    switch (value) {
      case bool _:
        pref.setBool(key, value as bool);
      case double _:
        pref.setDouble(key, value as double);
      case int _:
        pref.setInt(key, value as int);
      case List<String> _:
        pref.setStringList(key, value as List<String>);
      case String _:
        pref.setString(key, value as String);
    }
  }

  static T? getData<T>(String key) {
    assert(
      <Type>{bool, double, int, String, List<String>}.contains(T),
      'Unsupported type: $T. '
      'Allowed types: bool, double, int, String, List<String>',
    );
    final prefs = GetIt.instance<SharedPreferences>();

    if (T == int) {
      return prefs.getInt(key) as T?;
    } else if (T == bool) {
      return prefs.getBool(key) as T?;
    } else if (T == double) {
      return prefs.getDouble(key) as T?;
    } else if (T == String) {
      return prefs.getString(key) as T?;
    } else if (T == List<String>) {
      return prefs.getStringList(key) as T?;
    } else {
      throw UnsupportedError('Unsupported type: $T');
    }
  }
}
