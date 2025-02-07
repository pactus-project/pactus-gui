import 'package:bloc/bloc.dart';

enum SeedType { none, twelve, twentyFour }

class SeedTypeCubit extends Cubit<SeedType> {
  SeedTypeCubit() : super(SeedType.none);

  void selectSeed(int wordsCount) {
    emit(
      wordsCount == 12 ? SeedType.twelve : (wordsCount == 24 ?
      SeedType.twentyFour : SeedType.none),
    );
  }
}
