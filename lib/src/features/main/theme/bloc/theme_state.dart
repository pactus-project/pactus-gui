part of 'theme_bloc.dart';

class ThemeState {
  ThemeState._({required this.themeData});

  factory ThemeState.initial(FluentThemeData themeData) {
    return ThemeState._(themeData: themeData);
  }
  final FluentThemeData themeData;
}
