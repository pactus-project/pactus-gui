part of 'language_bloc.dart';

// Rest of your existing code remains the same:
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

// Modified LanguageInitial to load from storage
class LanguageInitial extends LanguageState {
  LanguageInitial()
      : super(
          selectedLanguage: LanguageConstants.enUS,
        );

  factory LanguageInitial.fromStorage(String? storedValue) {
    if (storedValue == null) {
      return LanguageInitial();
    }

    final parts = storedValue.split('_');
    if (parts.length != 2) {
      return LanguageInitial();
    }

    return LanguageInitial._internal(
      LanguageCase(
        name: storedValue,
        language: parts[0],
        country: parts[1],
      ),
    );
  }

  LanguageInitial._internal(LanguageCase language)
      : super(
          selectedLanguage: language,
        );
}
