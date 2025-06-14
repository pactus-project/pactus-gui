class SeedItemData {
  SeedItemData({required this.word, required this.isNeedConfirmation});
  final String word;
  final bool isNeedConfirmation;
}

class ConfirmationSeedState {
  ConfirmationSeedState({required this.words, required this.validationResults});

  final List<SeedItemData> words;
  final Map<int, bool> validationResults;

  ConfirmationSeedState copyWith({
    List<SeedItemData>? words,
    Map<int, bool>? validationResults,
  }) {
    return ConfirmationSeedState(
      words: words ?? this.words,
      validationResults: validationResults ?? this.validationResults,
    );
  }

  bool get areAllWordsConfirmed {
    return validationResults.values.every((isConfirmed) => isConfirmed);
  }
}
