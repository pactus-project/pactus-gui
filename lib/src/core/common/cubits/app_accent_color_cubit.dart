import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Manages the accent color state.
class AppAccentColorCubit extends Cubit<Color> {
  AppAccentColorCubit() : super(const Color(0xFF0F6CBD)) {
    _loadAccentColor();
  }

  /// Loads the saved accent color from SharedPreferences.
  Future<void> _loadAccentColor() async {
    final prefs = await SharedPreferences.getInstance();
    final accentColorValue = prefs.getInt('accentColor') ?? 0xFF0F6CBD;
    emit(Color(accentColorValue));
  }

  /// Sets the accent color and saves it to SharedPreferences.
  Future<void> setAccentColor(Color color) async {
    final prefs = await SharedPreferences.getInstance();

    // Convert color components (r, g, b, a) from double to int
    final alpha = (color.a * 255).toInt();
    final red = (color.r * 255).toInt();
    final green = (color.g * 255).toInt();
    final blue = (color.b * 255).toInt();

    // Combine color components into a single int
    final colorValue = (alpha << 24) | (red << 16) | (green << 8) | blue;

    // Save the combined color value to SharedPreferences
    await prefs.setInt('accentColor', colorValue);

    // Update the state with the new color
    emit(color);
  }
}
