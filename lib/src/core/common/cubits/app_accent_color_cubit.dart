import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/constants/storage_keys.dart';
import 'package:gui/src/core/utils/storage_utils.dart';

/// ## [AppAccentColorCubit] Class Documentation
///
/// The `AppAccentColorCubit` class is a cubit that manages the accent
/// color of the application.
/// It stores the current accent color and provides functionality to
/// load and set the accent color using `SharedPreferences`.
///
/// ### Properties:
///
/// - **[state]**:
///   - Represents the current accent color of the application.
///   It is a `Color` object that is initially set to
///   a default value (0xFF0F6CBD).
///
/// ### Methods:
///
/// - **[AppAccentColorCubit()]**:
///   - The constructor initializes the cubit and loads the saved
///   accent color from `SharedPreferences` (if available) using
///   the `_loadAccentColor` method.
///
/// - **[_loadAccentColor()]**:
///   - Asynchronously loads the accent color from `SharedPreferences`
///   and emits the value as the current state. If no color is saved,
///   it defaults to 0xFF0F6CBD.
///
/// - **[setAccentColor(Color color)]**:
///   - Asynchronously saves the provided color to `SharedPreferences`
///   and emits the new color as the current state.
///   - The color is stored in a packed integer format, converting
///   the RGBA components into a single integer.
///
/// ### Notes:
///
/// - The `SharedPreferences` is used to persist the selected accent color
/// across app restarts.
/// - The color is stored in an integer format (ARGB) for efficient storage
/// and retrieval.

class AppAccentColorCubit extends Cubit<int> {
  AppAccentColorCubit() : super(1) {
    _loadAccentColor();
  }

  void _loadAccentColor() {
    final accentColorValue =
        StorageUtils.getData<int>(StorageKeys.savedAccentColor) ?? 0;
    emit(accentColorValue);
  }

  void setAccentColor(int colorId) {
    StorageUtils.saveData(StorageKeys.savedAccentColor, colorId);
    emit(colorId);
  }

  void replaceAccentColor() {
    StorageUtils.saveData(StorageKeys.savedAccentColor, state);
    emit(state);
  }
}
