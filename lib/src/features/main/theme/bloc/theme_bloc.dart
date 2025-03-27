import 'package:flutter_bloc/flutter_bloc.dart';

/// Manages the theme state.
class AppThemeCubit extends Cubit<bool> {
  AppThemeCubit() : super(false); // Initial state: Light theme.

  /// Toggles to dark theme.
  void setDarkTheme() {
    if (!state) {
      emit(true);
    }
  }

  /// Toggles to light theme.
  void setLightTheme() {
    if (state) {
      emit(false);
    }
  }

  /// Toggles between light and dark themes.
  void toggleTheme() => emit(!state);
}
