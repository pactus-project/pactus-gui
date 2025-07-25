import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/constants/storage_keys.dart';
import 'package:pactus_gui/src/core/utils/storage_utils.dart';

/// Manages the theme state.
class AppThemeCubit extends Cubit<bool> {
  // Initial state: Light theme.
  AppThemeCubit() : super(false) {
    _loadTheme();
  }

  /// Toggles to dark theme.
  void setDarkTheme() {
    if (!state) {
      StorageUtils.saveData(StorageKeys.savedTheme, true);
      emit(true);
    }
  }

  /// Toggles to light theme.
  void setLightTheme() {
    if (state) {
      StorageUtils.saveData(StorageKeys.savedTheme, false);

      emit(false);
    }
  }

  /// Toggles between light and dark themes.
  void toggleTheme() {
    final reverseTheme = !state;
    StorageUtils.saveData(StorageKeys.savedTheme, reverseTheme);

    emit(reverseTheme);
  }

  void _loadTheme() {
    final isDarkMode =
        StorageUtils.getData<bool>(StorageKeys.savedTheme) ?? false;
    emit(isDarkMode);
  }
}
