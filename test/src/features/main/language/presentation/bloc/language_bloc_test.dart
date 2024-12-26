import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gui/src/core/services/shared_preferences_service.dart';
import 'package:gui/src/features/main/language/data/language_model.dart';
import 'package:gui/src/features/main/language/presentation/bloc/language_bloc.dart';

void main() {
  group('LanguageBloc', () {
    late LanguageBloc languageBloc;

    setUp(() async {
      final sharedPreferencesService =
          await SharedPreferencesService.initialize();
      languageBloc = LanguageBloc(sharedPreferencesService);
    });

    tearDown(() {
      languageBloc.close();
    });

    test('initial state should be English', () {
      expect(languageBloc.state.selectedLanguage, equals(Language.english));
    });

    blocTest<LanguageBloc, LanguageState>(
      'emits Spanish language when changed to Spanish',
      build: () => languageBloc,
      act: (bloc) =>
          bloc.add(ChangeLanguage(selectedLanguage: Language.spanish)),
      expect: () => [
        isA<LanguageState>().having(
          (state) => state.selectedLanguage,
          'language',
          Language.spanish,
        ),
      ],
    );

    blocTest<LanguageBloc, LanguageState>(
      'emits French language when changed to French',
      build: () => languageBloc,
      act: (bloc) =>
          bloc.add(ChangeLanguage(selectedLanguage: Language.french)),
      expect: () => [
        isA<LanguageState>().having(
          (state) => state.selectedLanguage,
          'language',
          Language.french,
        ),
      ],
    );
  });
}
