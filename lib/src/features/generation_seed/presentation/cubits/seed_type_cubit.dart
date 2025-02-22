import 'package:bloc/bloc.dart';
import 'package:gui/src/features/generation_seed/core/constants/enums/seed_type_enum.dart';

/// ## [SeedTypeCubit] Class Documentation
///
/// The `SeedTypeCubit` class is a state management cubit that manages the
/// selected seed type (either 12-word or 24-word) for seed generation.
///
/// ### Properties:
///
/// - **[state]** (`SeedTypeEnum`):
///   - Holds the current selected seed type, initialized to
///     `SeedTypeEnum.twelve`.
///
/// ### Methods:
///
/// - **[selectSeed(int wordsCount)]**:
///   - Updates the seed type based on the provided `wordsCount`.
///   - If `wordsCount` is 12, it sets the seed type to `SeedTypeEnum.twelve`.
///   - If `wordsCount` is 24, it sets the seed type to
///   `SeedTypeEnum.twentyFour`.
///   - If `wordsCount` is any other value, it sets the seed type to
///     `SeedTypeEnum.none`.
///
/// ### Notes:
///
/// - This cubit is part of the state management logic for managing seed type
///   selection in the seed generation process.
/// - Uses `emit()` to update the state when a new seed type is selected.

class SeedTypeCubit extends Cubit<SeedTypeEnum> {
  SeedTypeCubit() : super(SeedTypeEnum.twelve);

  void selectSeed(int wordsCount) {
    emit(
      wordsCount == 12
          ? SeedTypeEnum.twelve
          : (wordsCount == 24 ? SeedTypeEnum.twentyFour : SeedTypeEnum.none),
    );
  }
}
