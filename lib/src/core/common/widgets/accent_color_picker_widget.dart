import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/cubits/app_accent_color_cubit.dart';
import 'package:gui/src/features/main/theme/bloc/theme_bloc.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ## [AccentColorPicker] Class Documentation
///
/// The `AccentColorPicker` class is a widget that allows users to select an
/// accent color for the application.
/// It updates the selected color by interacting with the `AppAccentColorCubit`
/// and reflects the current theme's accent colors (light or dark).
///
/// ### Properties:
///
/// - **isDarkMode**:
///   - A boolean value indicating whether the current theme is dark or light.
///   It is retrieved from the `AppThemeCubit`.
///
/// - **colors**:
///   - A list of accent colors that change based on the theme (dark or light).
///   - For dark mode, it uses `AppThemeData.darkAccentColors`, and for light
///   mode, it uses `AppThemeData.lightAccentColors`.
///
/// ### Methods:
///
/// - **[build(BuildContext context)]**:
///   - Builds the widget tree, displaying a list of color circles.
///   Each circle represents an accent color.
///   - The user can select a color by tapping on it, which triggers
///   the `setAccentColor` method of the `AppAccentColorCubit` to update
///   the selected color.
///
/// ### Notes:
///
/// - The colors are displayed in circular containers with a white border
/// around them.
/// - The widget adapts to the current theme mode, displaying the appropriate
/// set of accent colors.

class AccentColorPicker extends StatelessWidget {
  const AccentColorPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<AppThemeCubit>().state;
    final colors = isDarkMode
        ? AppThemeData.darkAccentColors
        : AppThemeData.lightAccentColors;

    return Wrap(
      spacing: 10,
      children: colors.map((color) {
        return GestureDetector(
          onTap: () {
            context.read<AppAccentColorCubit>().setAccentColor(color);
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
