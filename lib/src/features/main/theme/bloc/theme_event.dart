// lib/src/features/main/theme/bloc/theme_event.dart
part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class InitializeThemeEvent extends ThemeEvent {}

class ChangeTheme extends ThemeEvent {
  const ChangeTheme(this.themeData);
  final ThemeData themeData;

  @override
  List<Object> get props => [themeData];
}

class SystemThemeChanged extends ThemeEvent {}
