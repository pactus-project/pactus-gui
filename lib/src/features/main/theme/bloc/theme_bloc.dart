// lib/src/features/main/theme/bloc/theme_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gui/src/features/main/theme/bloc/theme_state.dart';
import '../../../../core/services/shared_preferences_service.dart';

part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(this._sharedPreferencesService)
      : super(ThemeState(themeData: ThemeState.lightTheme)) {
    on<InitializeThemeEvent>(_onInitializeTheme);
    on<ChangeTheme>(_onChangeTheme);
    add(InitializeThemeEvent());
  }

  final SharedPreferencesService _sharedPreferencesService;

  Future<void> _onInitializeTheme(
    InitializeThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final themeCode = await _sharedPreferencesService.getSelectedTheme();
    final themeData = themeCode == ThemeMode.dark.name
        ? ThemeState.darkTheme
        : ThemeState.lightTheme;
    await _sharedPreferencesService.saveSelectedTheme(themeCode);
    emit(state.copyWith(themeData: themeData));
  }

  Future<void> _onChangeTheme(
    ChangeTheme event,
    Emitter<ThemeState> emit,
  ) async {
    final themeCode = event.themeData.brightness == Brightness.dark
        ? ThemeMode.dark.name
        : ThemeMode.light.name;
    await _sharedPreferencesService.saveSelectedTheme(themeCode);
    emit(state.copyWith(themeData: event.themeData));
  }
}
