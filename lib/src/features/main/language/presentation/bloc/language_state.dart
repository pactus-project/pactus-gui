part of 'language_bloc.dart';

class LanguageState extends Equatable {
  const LanguageState({
    this.selectedLanguage = Language.english,
  });

  final Language selectedLanguage;

  LanguageState copyWith({
    Language? selectedLanguage,
    bool? isInitialized,
  }) {
    return LanguageState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }

  @override
  List<Object?> get props => [selectedLanguage];
}

class LanguageInitial extends LanguageState {
  const LanguageInitial()
      : super(
          selectedLanguage: Language.english,
        ); // Explicitly set default language to English
}
