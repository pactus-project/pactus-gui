part of 'language_bloc.dart';

class LanguageState {
  const LanguageState({
    this.selectedLanguage,
  });

  final LanguageCase? selectedLanguage;

  LanguageState copyWith({LanguageCase? selectedLanguage}) {
    return LanguageState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}

class LanguageInitial extends LanguageState {
  LanguageInitial()
      : super(
          selectedLanguage: LanguageConstants.enUS,
        ); // Explicitly set default language to English
}
