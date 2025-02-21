import 'package:bloc/bloc.dart';
import 'package:gui/src/features/generation_seed/core/constants/enums/seed_type_enum.dart';

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
