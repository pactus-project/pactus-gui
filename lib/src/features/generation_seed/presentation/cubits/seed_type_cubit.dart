import 'package:bloc/bloc.dart';
import 'package:gui/src/features/generation_seed/core/constants/enums/seed_type_enum.dart';

// Generic Dropdown Cubit
class DropdownCubit<T> extends Cubit<T> {
  DropdownCubit(T initialState) : super(initialState);

  void selectItem(T item) {
    emit(item);
  }
}
