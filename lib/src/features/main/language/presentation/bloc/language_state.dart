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

    // Add assert to validate the stored value format
    assert(
      RegExp(r'^[a-z]{2}_[A-Z]{2}$').hasMatch(storedValue),
      'Stored language value must be in format "ll_CC" (e.g. "en_US")',
    );

    final parts = storedValue.split('_');
    if (parts.length != 2 || parts[0].isEmpty || parts[1].isEmpty) {
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
