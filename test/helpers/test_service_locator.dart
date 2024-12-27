import 'package:get_it/get_it.dart';
import 'package:gui/src/core/services/shared_preferences_service.dart';
import 'package:mocktail/mocktail.dart';

final locator = GetIt.instance;

class MockSharedPreferencesService extends Mock
    implements SharedPreferencesService {}

/// Initializes test dependencies within the [locator]
Future<void> initTestDependencies() async {
  // Register mocks
  locator.registerSingleton<SharedPreferencesService>(
    MockSharedPreferencesService(),
  );
}

/// Resets all registered dependencies
void resetDependencies() {
  locator.reset();
}
