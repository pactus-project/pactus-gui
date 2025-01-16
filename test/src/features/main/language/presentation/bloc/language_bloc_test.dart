import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gui/src/features/main/language/core/language_constants.dart';
import 'package:gui/src/features/main/language/presentation/bloc/language_bloc.dart';

void main() {
  late LanguageBloc languageBloc;

  // Set up the LanguageBloc before each test
  setUp(() {
    languageBloc = LanguageBloc();
  });

  // Close the LanguageBloc after each test
  tearDown(() {
    languageBloc.close();
  });

  // Helper method to build the widget tree with BlocProvider
  Widget buildTestableWidget(Widget child) {
    return BlocProvider.value(
      value: languageBloc,
      child: MaterialApp(
        home: Scaffold(body: child),
      ),
    );
  }

  // Test: Ensure the initial language is English (enUS)
  testWidgets('Initial language state is set to English (enUS)',
      (tester) async {
    // Arrange: Set up the initial language state
    await tester.pumpWidget(buildTestableWidget(Container()));

    // Act: No actions needed here, just pumping the widget

    // Assert: The initial language state should be English (enUS)
    expect(languageBloc.state.selectedLanguage, LanguageConstants.enUS);
  });

  // Test: Ensure language changes to French (frFR) when the ChangeLanguage
  // event is triggered
  testWidgets('Change language to French (frFR) when triggered',
      (tester) async {
    // Arrange: Set up the ChangeLanguage event to switch to French
    final frenchLanguageEvent =
        ChangeLanguage(selectedLanguage: LanguageConstants.frFR);
    await tester.pumpWidget(buildTestableWidget(Container()));

    // Act: Add the ChangeLanguage event to switch to French
    languageBloc.add(frenchLanguageEvent);
    await tester.pump();

    // Assert: Verify the language is now French (frFR)
    expect(languageBloc.state.selectedLanguage, LanguageConstants.frFR);
  });

  // Test: Ensure language switches back to English (enUS) when triggered
  testWidgets('Switch back to English (enUS) when triggered again',
      (tester) async {
    // Arrange: Change the language to French first
    languageBloc.add(ChangeLanguage(selectedLanguage: LanguageConstants.frFR));
    await tester.pumpWidget(buildTestableWidget(Container()));
    await tester.pump(); // Wait for state change

    // Act: Now change back to English
    languageBloc.add(ChangeLanguage(selectedLanguage: LanguageConstants.enUS));
    await tester.pump();

    // Assert: The language should now be English (enUS)
    expect(languageBloc.state.selectedLanguage, LanguageConstants.enUS);
  });

  // Test: Ensure language changes to Spanish (esES) when the ChangeLanguage
  // event is triggered
  testWidgets('Change language to Spanish (esES) when triggered',
      (tester) async {
    // Arrange: Set up the ChangeLanguage event to switch to Spanish
    final spanishLanguageEvent =
        ChangeLanguage(selectedLanguage: LanguageConstants.esES);
    await tester.pumpWidget(buildTestableWidget(Container()));

    // Act: Add the ChangeLanguage event to switch to Spanish
    languageBloc.add(spanishLanguageEvent);
    await tester.pump();

    // Assert: Verify the language is now Spanish (esES)
    expect(languageBloc.state.selectedLanguage, LanguageConstants.esES);
  });
}
