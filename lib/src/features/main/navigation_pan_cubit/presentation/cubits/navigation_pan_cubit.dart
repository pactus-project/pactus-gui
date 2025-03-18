import 'package:flutter_bloc/flutter_bloc.dart';

/// ## [NavigationPaneCubit] Class Documentation
///
/// The `NavigationPaneCubit` class manages the state of
/// the selected index in a navigation pane. It extends `Cubit<int>`,
/// where the integer value represents the current selected index.
///
/// ### Properties:
///
/// - **state**: The current selected index, which is an integer representing
/// the active item in the navigation pane. The default value is 0 (first item).
///
/// ### Methods:
///
/// - **setSelectedIndex(int index)**: This method allows changing the selected
/// index within the valid range (0 to 6). If the provided index is outside
/// this range, the state will not change.

class NavigationPaneCubit extends Cubit<int> {
  NavigationPaneCubit() : super(0);
  int _maxVisitedIndex = 0;

  void setSelectedIndex(int index) {
    if (index >= 0 && index <= 6) {
      if (index > _maxVisitedIndex) {
        _maxVisitedIndex = index;
      }
      emit(index);
    }
  }
}
