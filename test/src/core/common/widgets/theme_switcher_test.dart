import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:pactus_gui/src/core/common/widgets/theme_switcher.dart';
import 'package:pactus_gui/src/core/di/locator.dart';
import 'package:pactus_gui/src/features/main/theme/bloc/theme_bloc.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  // Helper method to build the widget tree with BlocProvider
  Widget buildTestableWidget(Widget child) {
    return BlocProvider.value(
      value: themeCubit,
      child: BlocBuilder<AppThemeCubit, bool>(
        builder: (context, isDarkMode) {
          final theme = isDarkMode
              ? AppThemeData.darkTheme(
                  AppThemeData.darkAccentColors[0],
                ).copyWith(
                  extensions: AppThemeData.darkExtensions,
                  typography: AppThemeData.typography,
                )
              : AppThemeData.lightTheme(
                  AppThemeData.lightAccentColors[0],
                ).copyWith(
                  extensions: AppThemeData.lightExtensions,
                  typography: AppThemeData.typography,
                );
          return Builder(
            builder: (context) {
              return AppTheme(
                themeData: theme,
                child: FluentApp(
                  home: Scaffold(body: child),
                  debugShowCheckedModeBanner: false,
                  themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
                  theme: theme,
                ),
              );
            },
          );
        },
      ),
    );
  }

  testWidgets('Initial state shows light theme UI elements', (tester) async {
    // Arrange: Build the widget tree
    await tester.pumpWidget(buildTestableWidget(const ThemeSwitcher()));

    // Act: Pump to ensure animations settle
    await tester.pumpAndSettle();

    // Assert: Check that the light mode icon is visible
    final lightIconOpacity = tester.widget<AnimatedOpacity>(
      find.byType(AnimatedOpacity).last,
    );
    expect(lightIconOpacity.opacity, 1.0);

    // Assert: Alignment should be for light theme
    final animatedAlignFinder = find.byType(AnimatedAlign);
    expect(
      tester.widget<AnimatedAlign>(animatedAlignFinder).alignment,
      Alignment.centerLeft,
    );
  });

  testWidgets('Tapping switch toggles to dark theme', (tester) async {
    // Arrange: Build the widget tree
    await tester.pumpWidget(buildTestableWidget(const ThemeSwitcher()));

    // Act: Tap the switch to toggle the theme
    final switchFinder = find.byType(GestureDetector);
    await tester.tap(switchFinder);
    await tester.pumpAndSettle();

    // Assert: Check that the dark mode icon is visible
    final darkIconOpacity = tester.widget<AnimatedOpacity>(
      find.byType(AnimatedOpacity).first,
    );
    expect(darkIconOpacity.opacity, 1.0);

    // Assert: Alignment should be for dark theme
    final animatedAlignFinder = find.byType(AnimatedAlign);
    expect(
      tester.widget<AnimatedAlign>(animatedAlignFinder).alignment,
      Alignment.centerRight,
    );

    // Assert: Verify the Cubit's state is updated to dark theme
    expect(themeCubit.state, true);
  });

  testWidgets('Toggling back switches to light theme', (tester) async {
    // Arrange: Build the widget tree
    await tester.pumpWidget(buildTestableWidget(const ThemeSwitcher()));

    // Act: Toggle to dark theme
    final switchFinder = find.byType(GestureDetector);
    await tester.tap(switchFinder);
    await tester.pumpAndSettle();

    // Act: Toggle back to light theme
    await tester.tap(switchFinder);
    await tester.pumpAndSettle();

    // Assert: Check that the light mode icon is visible again
    final lightIconOpacity = tester.widget<AnimatedOpacity>(
      find.byType(AnimatedOpacity).last,
    );
    expect(lightIconOpacity.opacity, 1.0);

    // Assert: Alignment should be for light theme
    final animatedAlignFinder = find.byType(AnimatedAlign);
    expect(
      tester.widget<AnimatedAlign>(animatedAlignFinder).alignment,
      Alignment.centerLeft,
    );

    // Assert: Verify the Cubit's state is updated to light theme
    expect(themeCubit.state, false);
  });

  testWidgets('Switch animations and UI respond to Cubit state changes', (
    tester,
  ) async {
    // Arrange: Set Cubit's state to dark theme
    themeCubit.setDarkTheme();

    // Build the widget tree
    await tester.pumpWidget(buildTestableWidget(const ThemeSwitcher()));
    await tester.pumpAndSettle();

    // Assert: Dark mode icon should be visible
    expect(
      tester
          .widget<AnimatedOpacity>(find.byType(AnimatedOpacity).first)
          .opacity,
      1.0,
    );

    // Assert: Alignment should be for dark theme
    final animatedAlignFinder = find.byType(AnimatedAlign);
    expect(
      tester.widget<AnimatedAlign>(animatedAlignFinder).alignment,
      Alignment.centerRight,
    );
  });
}
