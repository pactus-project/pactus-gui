// class SeedItemData {
//   SeedItemData({required this.word, required this.isNeedConfirmation});
//   final String word;
//   final bool isNeedConfirmation;
// }


import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeedItemData {
  SeedItemData({required this.word, required this.isNeedConfirmation});
  final String word;
  final bool isNeedConfirmation;
}

class ConfirmationSeedState {
  final List<SeedItemData> words;
  final Map<int, bool> validationResults;

  ConfirmationSeedState({
    required this.words,
    required this.validationResults,
  });

  // متد کپی برای تغییر مقدار
  ConfirmationSeedState copyWith({
    List<SeedItemData>? words,
    Map<int, bool>? validationResults,
  }) {
    return ConfirmationSeedState(
      words: words ?? this.words,
      validationResults: validationResults ?? this.validationResults,
    );
  }
}
