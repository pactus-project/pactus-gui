import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/features/confirmation_seed/data/models/seed_item_data.dart';

class ConfirmationSeedCubit extends Cubit<ConfirmationSeedState> {
  ConfirmationSeedCubit(List<String> words)
    : super(ConfirmationSeedState(words: [], validationResults: {})) {
    generateWords(words);
  }

  void generateWords(List<String> words) {
    final totalWords = words.length;
    final countToFlag = (totalWords * 0.3).ceil();

    final flaggedIndexes = <int>{};
    final random = Random();

    while (flaggedIndexes.length < countToFlag) {
      flaggedIndexes.add(random.nextInt(totalWords));
    }

    final wordEntryList = List.generate(totalWords, (index) {
      final isFlagged = flaggedIndexes.contains(index);
      return SeedItemData(word: words[index], isNeedConfirmation: isFlagged);
    });

    final validationMap = <int, bool>{};
    for (var i = 0; i < wordEntryList.length; i++) {
      if (wordEntryList[i].isNeedConfirmation) {
        validationMap[i] = false;
      }
    }

    emit(
      state.copyWith(words: wordEntryList, validationResults: validationMap),
    );
  }

  void updateValidation(int index, String input) {
    final correctWord = state.words[index].word;
    final isCorrect = input.trim().toLowerCase() == correctWord.toLowerCase();

    final updatedValidation = Map<int, bool>.from(state.validationResults)
      ..[index] = isCorrect;

    emit(state.copyWith(validationResults: updatedValidation));
  }

  bool isAllValid() {
    return state.validationResults.isNotEmpty &&
        state.validationResults.values.every((value) => value);
  }
}
