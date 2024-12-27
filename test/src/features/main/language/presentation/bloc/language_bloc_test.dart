import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gui/src/core/services/shared_preferences_service.dart';
import 'package:gui/src/features/main/language/data/language_model.dart';
import 'package:gui/src/features/main/language/presentation/bloc/language_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../helpers/test_service_locator.dart';

void main() {
  late LanguageBloc languageBloc;
  late MockSharedPreferencesService mockPrefsService;

  setUp(() async {
    await initTestDependencies();
    mockPrefsService =
        locator<SharedPreferencesService>() as MockSharedPreferencesService;

    // Setup default mock behavior
    when(() => mockPrefsService.getSelectedLanguage())
        .thenReturn(Language.english.code);
    when(() => mockPrefsService.saveSelectedLanguage(any()))
        .thenAnswer((_) async => true);

    languageBloc = LanguageBloc(mockPrefsService);
  });

  tearDown(() {
    languageBloc.close();
    resetDependencies();
  });

  group('LanguageBloc', () {
    group('GetSelectedLanguage', () {
      test('should return English when no language is saved', () {
        // Given
        when(() => mockPrefsService.getSelectedLanguage()).thenReturn('');
        when(() => mockPrefsService.saveSelectedLanguage(Language.english.code))
            .thenAnswer((_) async => true);

        // When
        final bloc = LanguageBloc(mockPrefsService);

        // Then
        expect(bloc.state.selectedLanguage, equals(Language.english));
        verify(() => mockPrefsService.getSelectedLanguage()).called(1);
        verify(
          () => mockPrefsService.saveSelectedLanguage(Language.english.code),
        ).called(1);
      });

      test('should return Spanish when Spanish is saved', () async {
        when(() => mockPrefsService.getSelectedLanguage())
            .thenReturn(Language.spanish.code);
        when(() => mockPrefsService.saveSelectedLanguage(Language.spanish.code))
            .thenAnswer((_) async => true);

        final bloc = LanguageBloc(mockPrefsService)
          ..add(ChangeLanguage(selectedLanguage: Language.spanish));

        // Wait for the state to change
        // ignore: inference_failure_on_instance_creation
        await Future.delayed(Duration.zero);

        // Then
        expect(bloc.state.selectedLanguage, equals(Language.spanish));
      });

      test('should return English for invalid language code', () {
        // Given
        when(() => mockPrefsService.getSelectedLanguage())
            .thenReturn('invalid_code');
        when(() => mockPrefsService.saveSelectedLanguage(any()))
            .thenAnswer((_) async => true);

        // When
        final bloc = LanguageBloc(mockPrefsService);

        // Then
        expect(bloc.state.selectedLanguage, equals(Language.english));
        verify(() => mockPrefsService.getSelectedLanguage()).called(1);
        verify(
          () => mockPrefsService.saveSelectedLanguage(Language.english.code),
        ).called(1);
      });

      test('should handle empty string from preferences', () {
        // Given
        when(() => mockPrefsService.getSelectedLanguage()).thenReturn('');
        when(() => mockPrefsService.saveSelectedLanguage(any()))
            .thenAnswer((_) async => true);

        // When
        final bloc = LanguageBloc(mockPrefsService);

        // Then
        expect(bloc.state.selectedLanguage, equals(Language.english));
        verify(() => mockPrefsService.getSelectedLanguage()).called(1);
        verify(
          () => mockPrefsService.saveSelectedLanguage(Language.english.code),
        ).called(1);
      });
    });

    group('Language Change', () {
      blocTest<LanguageBloc, LanguageState>(
        'should save language when changed',
        setUp: () {
          when(() => mockPrefsService.saveSelectedLanguage(any()))
              .thenAnswer((_) async => true);
        },
        build: () => languageBloc,
        act: (bloc) => bloc.add(
          ChangeLanguage(selectedLanguage: Language.spanish),
        ),
        verify: (_) {
          verify(
            () => mockPrefsService.saveSelectedLanguage(Language.spanish.code),
          ).called(1);
        },
      );

      // test('should throw when save fails', () {
      //   // Given
      //   when(() => mockPrefsService.saveSelectedLanguage(any()))
      //       .thenThrow(Exception('Save failed'));

      //   // Then
      //   expect(
      //     () => languageBloc.add(
      //       ChangeLanguage(selectedLanguage: Language.spanish),
      //     ),
      //     throwsException,
      //   );
      // });
    });
  });
}
