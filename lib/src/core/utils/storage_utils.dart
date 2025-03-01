import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageUtils {
  StorageUtils._();

  static const String nodeDirectory = 'nodeDirectory';

  static void clearData(String key) {
    final prefs = GetIt.instance<SharedPreferences>();
    if (prefs.containsKey(key)) {
      prefs.remove(key);
    }
  }

  static void saveData(String key, String value) {
    GetIt.instance<SharedPreferences>().setString(key, value);
  }

  static dynamic getData(String key) {
    final prefs = GetIt.instance<SharedPreferences>();
    final savedValue = prefs.getString(key);
    if (savedValue != null) {
      return savedValue;
    } else {
      return null;
    }
  }
}
