import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gui/src/core/common/widgets/theme_switcher.dart';
import 'package:gui/src/features/main/theme/bloc/theme_bloc.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

void main() {
  group('ThemeBloc Tests with FluentApp', () {
    late ThemeBloc themeBloc;

    // Set up the ThemeBloc before each test
    setUp(() {
      themeBloc = ThemeBloc();
    });

    // Close the ThemeBloc after each test
    tearDown(() {
      themeBloc.close();
    });

    // Helper method to build the widget tree with BlocProvider
    Widget buildTestableWidget(Widget child) {
      return BlocProvider.value(
        value: themeBloc,
        child: MaterialApp(
          home: BlocBuilder<ThemeBloc, ThemeState>(
            bloc: themeBloc,
            builder: (context, themeState) {
              return FluentApp(
                title: 'Pactus Gui App',
                theme: FluentThemeData.light().copyWith(
                  extensions: AppThemeData.lightExtensions,
                  typography: AppThemeData.typography,
                ),
                themeMode: themeState.themeMode,
                darkTheme: FluentThemeData.dark().copyWith(
                  extensions: AppThemeData.darkExtensions,
                  typography: AppThemeData.typography,
                ),
                home: Scaffold(body: child),
              );
            },
          ),
        ),
      );
    }

    // Test: Ensure the initial theme is light
    testWidgets('Initial state should be light theme', (tester) async {
      // Build the widget tree
      await tester.pumpWidget(buildTestableWidget(ThemeSwitcher()));

      // Check that the theme is initially light
      expect(themeBloc.state.themeMode, ThemeMode.light);
    });

    // Test: Ensure theme changes to dark
    // when ThemeChanged event is triggered
    testWidgets('Should emit dark theme when ThemeChanged event is added',
        (tester) async {
      // Arrange: Set up the event to change theme to dark
      final darkThemeEvent = ThemeChanged(theme: ThemeMode.dark);

      // Build the widget tree
      await tester.pumpWidget(buildTestableWidget(ThemeSwitcher()));

      // Act: Add the event to change the theme to dark
      themeBloc.add(darkThemeEvent);

      // Rebuild the widget tree to reflect the state change
      await tester.pump();

      // Assert: Verify the theme is now dark
      expect(themeBloc.state.themeMode, ThemeMode.dark);
    });

    // Test: Ensure theme changes back to light
    // when ThemeChanged event is triggered from dark
    testWidgets(
        'Should emit light theme when ThemeChanged event is added from dark',
        (tester) async {
      // Arrange: First, change the theme to dark
      themeBloc.add(ThemeChanged(theme: ThemeMode.dark));

      // Build the widget tree and wait for the state change
      await tester.pumpWidget(buildTestableWidget(ThemeSwitcher()));

      // Wait for the dark theme to apply
      await tester.pump();

      // Act: Change the theme back to light
      final lightThemeEvent = ThemeChanged(theme: ThemeMode.light);
      themeBloc.add(lightThemeEvent);

      // Rebuild the widget tree
      await tester.pump();

      // Assert: Verify the theme is now light
      expect(themeBloc.state.themeMode, ThemeMode.light);
    });

    // Test: Alignment should change based on light theme
    testWidgets('Alignment should change based on light theme', (tester) async {
      // Act: Change the theme to dark
      themeBloc.add(ThemeChanged(theme: ThemeMode.light));
      // Rebuild the widget tree to reflect the theme change
      await tester.pump(Duration(seconds: 1));

      // Build the widget tree with the initial theme (light)
      await tester.pumpWidget(buildTestableWidget(ThemeSwitcher()));

      // Find the AnimatedAlign widget
      final animatedAlignFinder = find.byType(AnimatedAlign);

      // Check that the alignment is initially to the right (light theme)
      final animatedAlignWidget =
          tester.widget<AnimatedAlign>(animatedAlignFinder);

      expect(animatedAlignWidget.alignment, Alignment.centerRight);
    });

    // Test: Alignment should change based on dark theme
    testWidgets('Alignment should change based on dark theme', (tester) async {
      // Act: Change the theme to dark
      themeBloc.add(ThemeChanged(theme: ThemeMode.dark));
      // Rebuild the widget tree to reflect the theme change
      await tester.pump(Duration(seconds: 1));

      // Build the widget tree with the initial theme (light)
      await tester.pumpWidget(buildTestableWidget(ThemeSwitcher()));

      // Find the AnimatedAlign widget
      final animatedAlignFinder = find.byType(AnimatedAlign);

      // Check that the alignment is initially to the right (light theme)
      final animatedAlignWidget =
          tester.widget<AnimatedAlign>(animatedAlignFinder);

      expect(animatedAlignWidget.alignment, Alignment.centerLeft);
    });
  });
}
