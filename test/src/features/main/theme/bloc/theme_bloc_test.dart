import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:gui/src/core/di/locator.dart';
import 'package:gui/src/features/main/theme/bloc/theme_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() {
Future<void> main() async {
  Future<void> prepareSharedPreferencesLocator() async {
    SharedPreferences.setMockInitialValues({});
    await setupSharedPreferences();
  }

  Future<void> cleanUpLocator() async {
    await GetIt.instance.reset();
  }

  late AppThemeCubit themeCubit;

  // Set up the LanguageBloc before each test
  setUp(() async {
    await cleanUpLocator();
    await prepareSharedPreferencesLocator();
    themeCubit = AppThemeCubit();
  });

  // Close the LanguageBloc after each test
  tearDown(() {
    themeCubit.close();
  });

  group('AppThemeCubit Tests', () {
/*
    late AppThemeCubit themeCubit;

    // Set up the ThemeCubit before each test
    setUp(() {
      themeCubit = AppThemeCubit();
    });

    // Close the ThemeCubit after each test
    tearDown(() {
      themeCubit.close();
    });
*/

    // Test: Ensure the initial theme is light
    test('Initial state should be light theme', () {
      expect(themeCubit.state, false); // false indicates light theme
    });

    // Test: Ensure theme toggles to dark when toggleTheme is called
    test('Should toggle to dark theme when toggleTheme is called', () {
      // Act: Toggle theme to dark
      themeCubit.toggleTheme();

      // Assert: The state should now be dark (true indicates dark theme)
      expect(themeCubit.state, true);
    });

    // Test: Ensure theme toggles back to light after dark theme is set
    test('Should toggle back to light theme after dark theme is set', () async {
      // Arrange: First, toggle to dark theme
      themeCubit
        ..toggleTheme()

        // Act: Toggle back to light theme
        ..toggleTheme();

      // Assert: The state should now be light again (false for light theme)
      expect(themeCubit.state, false);
    });

    // Test: Ensure theme changes to dark when setDarkTheme is called
    test('Should set dark theme when setDarkTheme is called', () {
      // Act: Call setDarkTheme
      themeCubit.setDarkTheme();

      // Assert: The state should be dark (true indicates dark theme)
      expect(themeCubit.state, true);
    });

    // Test: Ensure theme changes to light when setLightTheme is called
    test('Should set light theme when setLightTheme is called', () {
      // Arrange: First, set the theme to dark
      themeCubit
        ..setDarkTheme()

        // Act: Call setLightTheme
        ..setLightTheme();

      // Assert: The state should be light (false indicates light theme)
      expect(themeCubit.state, false);
    });
  });
}
