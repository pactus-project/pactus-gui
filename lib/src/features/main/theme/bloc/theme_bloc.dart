import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/enums/theme_modes.dart';
import 'package:gui/src/features/main/theme/theme_data/app_theme_data.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
          ThemeState.initial(AppThemeData.themeDataModes[ThemeModes.light]!),
        ) {
    on<ThemeChanged>(_onThemeChanged);
  }

  void _onThemeChanged(ThemeChanged event, Emitter<ThemeState> emit) {
    final isLightTheme = event.theme == ThemeModes.light;

    final textTheme = isLightTheme
        ? AppThemeData.lightTypography
        : AppThemeData.darkTypography;

    emit(
      ThemeState.initial(
        AppThemeData.themeDataModes[event.theme]!
            .copyWith(typography: textTheme),
      ),
    );
  }
}
