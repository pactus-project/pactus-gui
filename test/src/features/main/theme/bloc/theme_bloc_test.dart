import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gui/src/features/main/theme/bloc/theme_bloc.dart';

void main() {
  group('ThemeBloc Tests', () {
    late ThemeBloc themeBloc;

    // Set up the ThemeBloc before each test
    setUp(() {
      themeBloc = ThemeBloc();
    });

    // Close the ThemeBloc after each test
    tearDown(() {
      themeBloc.close();
    });

    // Test: Ensure the initial theme is light
    test('Initial state should be light theme', () {
      expect(themeBloc.state.themeMode, ThemeMode.light);
    });

    // Test: Ensure theme changes to dark when ThemeChanged event is triggered
    test('Should emit dark theme when ThemeChanged event is added', () async {
      // Arrange: Set up the event to change theme to dark
      final darkThemeEvent = ThemeChanged(theme: ThemeMode.dark);

      // Act: Add the event to the bloc
      themeBloc.add(darkThemeEvent);

      // Assert: Verify the emitted state is dark
      await expectLater(
        themeBloc.stream,
        emitsInOrder([
          predicate<ThemeState>((state) => state.themeMode == ThemeMode.dark),
        ]),
      );
    });

    // Test: Ensure theme changes back to light when ThemeChanged event is
    // triggered from dark
    test('Should emit light theme when ThemeChanged event is added from dark',
        () async {
      // Arrange: First, change the theme to dark
      themeBloc.add(ThemeChanged(theme: ThemeMode.dark));

      // Wait for the state to potentially update
      await Future.delayed(
        const Duration(
          milliseconds: 500,
        ),
        () {},
      );

      // Act: Change the theme back to light
      final lightThemeEvent = ThemeChanged(theme: ThemeMode.light);
      themeBloc.add(lightThemeEvent);

      // Assert: Verify the emitted state is light
      await expectLater(
        themeBloc.stream,
        emitsInOrder([
          predicate<ThemeState>((state) => state.themeMode == ThemeMode.light),
        ]),
      );
    });
  });
}
