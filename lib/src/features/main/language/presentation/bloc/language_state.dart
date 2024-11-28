part of 'language_bloc.dart';

class LanguageState extends Equatable {
  const LanguageState({
    this.selectedLanguage = Language.english, // Default to English
  });

  final Language selectedLanguage;

  @override
  List<Object> get props => [selectedLanguage];

  LanguageState copyWith({Language? selectedLanguage}) {
    return LanguageState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}

class LanguageInitial extends LanguageState {
  const LanguageInitial()
      : super(
          selectedLanguage: Language.english,
        ); // Explicitly set default language to English
}
