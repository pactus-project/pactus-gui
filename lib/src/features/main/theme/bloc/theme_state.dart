// lib/src/features/main/theme/bloc/theme_state.dart
import 'package:equatable/equatable.dart';
import 'package:fluent_ui/fluent_ui.dart';

class ThemeState extends Equatable {
  const ThemeState({
    required this.themeData,
  });
  final FluentThemeData themeData;

  static FluentThemeData lightTheme = FluentThemeData(
    brightness: Brightness.light,
  );
  static FluentThemeData darkTheme = FluentThemeData.dark();

  ThemeState copyWith({FluentThemeData? themeData}) {
    return ThemeState(
      themeData: themeData ?? this.themeData,
    );
  }

  @override
  List<Object> get props => [themeData];
}
