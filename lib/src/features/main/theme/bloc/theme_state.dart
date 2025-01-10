part of 'theme_bloc.dart';

class ThemeState {
  ThemeState._({
    required this.themeMode,
  });

  factory ThemeState.initial(ThemeMode themeMode) {
    return ThemeState._(themeMode: themeMode);
  }
  final ThemeMode themeMode;
}
