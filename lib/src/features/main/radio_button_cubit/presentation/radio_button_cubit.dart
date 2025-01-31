import 'package:flutter_bloc/flutter_bloc.dart';

class RadioButtonCubit extends Cubit<int> {
  RadioButtonCubit() : super(0);

  void changeValue(int value) => emit(value);
}
