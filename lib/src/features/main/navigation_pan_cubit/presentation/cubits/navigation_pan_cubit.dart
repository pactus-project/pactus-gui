import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationPaneCubit extends Cubit<int> {
  NavigationPaneCubit() : super(0);

  void setSelectedIndex(int index) {
    if (index >= 0 && index <= 6) {
      emit(index);
    }
  }
}
