import 'package:bloc/bloc.dart';
import 'package:pactus_gui/src/data/models/fluent_navigation_state_model.dart';

class NavigationPaneCubit extends Cubit<NavigationState> {
  NavigationPaneCubit() : super(NavigationState.initial());
  int _maxVisitedIndex = 0;

  void setSelectedIndex(int index) {
    if (index >= 0 && index <= 6) {
      if (index > _maxVisitedIndex) {
        _maxVisitedIndex = index;
      }
      emit(
        state.copyWith(selectedIndex: index),
      );
    }
  }

  void toggleMenu() {
    emit(state.copyWith(isMenuOpen: !state.isMenuOpen));
  }

  void openMenu() {
    emit(state.copyWith(isMenuOpen: true));
  }

  void closeMenu() {
    emit(state.copyWith(isMenuOpen: false));
  }
}
