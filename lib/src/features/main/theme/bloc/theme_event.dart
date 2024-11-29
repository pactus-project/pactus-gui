part of 'theme_bloc.dart';

abstract class ThemeEvent {}

class ThemeChanged extends ThemeEvent {
  ThemeChanged({required this.theme});
  final ThemeModes theme;
}
