import 'package:flutter_bloc/flutter_bloc.dart';

/// ## [RadioButtonCubit] Class Documentation
///
/// The `RadioButtonCubit` class manages the state of the selected value
/// in a group of radio buttons. It extends `Cubit<int>`, where the integer
/// value represents the selected radio button.
///
/// ### Properties:
///
/// - **state**: The current selected value in the radio button group, which
/// is an integer. The default value is 0 (first radio button).
///
/// ### Methods:
///
/// - **changeValue(int value)**: This method updates the selected value
/// by emitting the provided value.

class RadioButtonCubit extends Cubit<int> {
  RadioButtonCubit() : super(0);

  void changeValue(int value) => emit(value);
}
