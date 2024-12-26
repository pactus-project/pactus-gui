// lib/src/features/main/theme/bloc/theme_state.dart
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  const ThemeState({
    required this.themeData,
  });
  final ThemeData themeData;

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
  );
  static ThemeData darkTheme = ThemeData.dark();

  ThemeState copyWith({ThemeData? themeData}) {
    return ThemeState(
      themeData: themeData ?? this.themeData,
    );
  }

  @override
  List<Object> get props => [themeData];
}
