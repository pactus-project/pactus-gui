import 'package:bloc/bloc.dart';

// Generic Dropdown Cubit
class DropdownCubit<T> extends Cubit<T> {
  DropdownCubit(super.initialState);

  void selectItem(T item) {
    emit(item);
  }
}
