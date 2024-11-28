part of 'theme_bloc.dart';

class ThemeState {
  ThemeState._({required this.themeData});

  factory ThemeState.initial(ThemeData themeData) {
    return ThemeState._(themeData: themeData);
  }
  final ThemeData themeData;
}
