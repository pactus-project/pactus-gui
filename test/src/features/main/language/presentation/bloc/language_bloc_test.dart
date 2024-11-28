import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gui/src/features/main/language/data/language_model.dart';
import 'package:gui/src/features/main/language/presentation/bloc/language_bloc.dart';

void main() {
  late LanguageBloc languageBloc;

  setUp(() {
    languageBloc = LanguageBloc();
  });

  tearDown(() {
    languageBloc.close();
  });
  test('initial state is LanguageState with default language', () {
    // Verify the initial state is LanguageState, not LanguageInitial directly
    expect(languageBloc.state, isA<LanguageState>());

    // Verify that the initial language is English (Language.english)
    expect(languageBloc.state.selectedLanguage, Language.english);
  });

  blocTest<LanguageBloc, LanguageState>(
    'emits changeLanguage to es',
    build: () => languageBloc,
    act: (bloc) {
      // Change language to Spanish
      bloc.add(ChangeLanguage(selectedLanguage: Language.spanish));
    },
    expect: () => [
      // Expect the new state with the updated language (Spanish)
      isA<LanguageState>().having(
        (state) => state.selectedLanguage,
        'selectedLanguage',
        Language.spanish, // Expect the selected language to be Spanish
      ),
    ],
  );

  blocTest<LanguageBloc, LanguageState>(
    'emits changeLanguage to Fr',
    build: () => languageBloc,
    act: (bloc) {
      // Change language to Spanish
      bloc.add(ChangeLanguage(selectedLanguage: Language.french));
    },
    expect: () => [
      // Expect the new state with the updated language (Spanish)
      isA<LanguageState>().having(
        (state) => state.selectedLanguage,
        'selectedLanguage',
        Language.french, // Expect the selected language to be Spanish
      ),
    ],
  );
}
