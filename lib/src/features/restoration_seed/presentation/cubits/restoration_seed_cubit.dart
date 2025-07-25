import 'package:bloc/bloc.dart';
import 'package:pactus_gui/src/features/generation_seed/core/constants/enums/seed_type_enum.dart';

/// ## [SeedTextCubit] Class Documentation
///
/// The `SeedTextCubit` class manages the state of the seed words in a list.
/// It is responsible for handling the update of individual seed words based
/// on user input.
///
/// ### Properties:
///
/// - **[state]** (`List<String>`):
///   - A list representing the seed words, initialized with empty strings.
///   - The length of the list is determined by the `seedType.qty` value.
///
/// ### Methods:
///
/// - **[updateWord(int index, String word)]**:
///   - Updates the seed word at the specified index with the new word value.
///     The state is emitted with the updated list of seed words.
///
/// - **[areAllWordsEntered()]**:
///   - Checks if all words in the list are entered (none are empty).
///   - Returns `true` if all words are filled; `false` otherwise.

class SeedTextCubit extends Cubit<List<String>> {
  SeedTextCubit(SeedTypeEnum seedType) : super(List.filled(seedType.qty, ''));

  void updateWord(int index, String word) {
    final updatedList = List<String>.from(state);
    updatedList[index] = word;
    emit(updatedList);
  }

  /// Checks if all words are entered (no empty strings).
  bool areAllWordsEntered() {
    return state.every((word) => word.isNotEmpty);
  }
}
