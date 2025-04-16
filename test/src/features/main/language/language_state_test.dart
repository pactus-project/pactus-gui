import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gui/src/features/main/language/data/language_case.dart';
import 'package:gui/src/features/main/language/presentation/bloc/language_bloc.dart';

void main() {
  group('LanguageState', () {
    final testLanguage = LanguageCase(
      name: 'Test Language',
      language: 'tl',
      country: 'TL',
    );

    test('copyWith returns new state with updated language', () {
      final initialState = LanguageState();
      final newState = initialState.copyWith(selectedLanguage: testLanguage);

      expect(newState.selectedLanguage, testLanguage);
      expect(initialState.selectedLanguage, isNull);
    });

    test('copyWith returns new state with unchanged language when null', () {
      final initialState = LanguageState(selectedLanguage: testLanguage);
      final newState = initialState.copyWith();

      expect(newState.selectedLanguage, testLanguage);
    });
  });

  group('LanguageInitial', () {
    test('default constructor uses enUS as default language', () {
      final state = LanguageInitial();
      expect(state.selectedLanguage?.language, 'en');
      expect(state.selectedLanguage?.country, 'US');
    });

    test('fromStorage with null returns default initial state', () {
      final state = LanguageInitial.fromStorage(null);
      expect(state.selectedLanguage?.language, 'en');
      expect(state.selectedLanguage?.country, 'US');
    });

    test('fromStorage with invalid format throws AssertionError', () {
      // Wrap in assert block since asserts only throw in debug mode
      assert(() {
        expect(
          () => LanguageInitial.fromStorage('invalid_format'),
          throwsA(
            isA<AssertionError>().having(
              (e) => e.message,
              'message',
              contains('Stored language value must be in format "ll_CC"'),
            ),
          ),
        );
        return true; // Required for assert block
      }());

      // For non-debug modes or if you still want to test fallback behavior:
      if (!kDebugMode) {
        final state = LanguageInitial.fromStorage('invalid_format');
        expect(state.selectedLanguage?.language, 'en');
        expect(state.selectedLanguage?.country, 'US');
      }
    });

    test('fromStorage with invalid format throws AssertionError', () {
      if (kDebugMode) {
        expect(
          () => LanguageInitial.fromStorage('invalid_format'),
          throwsA(isA<AssertionError>()),
        );
      } else {
        // Force fail the test in release mode to maintain consistency
        fail('Invalid format should not be accepted in any mode');
        // Or if you prefer to allow it in release mode:
        // final state = LanguageInitial.fromStorage('invalid_format');
        // expect(state.selectedLanguage?.language, 'en');
        // expect(state.selectedLanguage?.country, 'US');
      }
    });

    test('fromStorage with valid format returns state with that language', () {
      final state = LanguageInitial.fromStorage('fr_FR');
      expect(state.selectedLanguage?.language, 'fr');
      expect(state.selectedLanguage?.country, 'FR');
    });
  });
}
