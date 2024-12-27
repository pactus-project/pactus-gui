import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/shared_preferences_service.dart';

final locator = GetIt.instance;

Future<void> setupSharedPreferences() async {
  final preferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferencesService>(
    SharedPreferencesService(preferences),
  );
}
