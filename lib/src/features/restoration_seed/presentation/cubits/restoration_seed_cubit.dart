import 'package:bloc/bloc.dart';
import 'package:gui/src/features/generation_seed/core/constants/enums/seed_type_enum.dart';

class SeedTextCubit extends Cubit<List<String>> {
  SeedTextCubit(SeedTypeEnum seedType) : super(List.filled(seedType.qty, ''));

  void updateWord(int index, String word) {
    final updatedList = List<String>.from(state);
    updatedList[index] = word;
    emit(updatedList);
  }
}
