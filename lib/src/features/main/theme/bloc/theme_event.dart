// lib/src/features/main/theme/bloc/theme_event.dart
part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class InitializeThemeEvent extends ThemeEvent {}

class ThemeChanged extends ThemeEvent {
  const ThemeChanged(this.theme);
  final FluentThemeData theme;

  @override
  List<Object> get props => [theme];
}

class SystemThemeChanged extends ThemeEvent {}
