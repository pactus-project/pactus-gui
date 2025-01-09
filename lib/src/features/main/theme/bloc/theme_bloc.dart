import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/enums/theme_modes.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
          ThemeState.initial(AppThemeData.lightTheme()),
        ) {
    on<ThemeChanged>(_onThemeChanged);
  }

  void _onThemeChanged(ThemeChanged event, Emitter<ThemeState> emit) {
    final isLightTheme = event.theme == ThemeModes.light;

    final themeData =
        isLightTheme ? AppThemeData.lightTheme() : AppThemeData.darkTheme();

    emit(
      ThemeState.initial(themeData),
    );
  }
}
