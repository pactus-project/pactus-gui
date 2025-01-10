import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:gui/src/features/main/theme/bloc/theme_bloc.dart';

/// ### [ThemeSwitcher] Widget documentation
///
/// A custom widget that toggles between light and dark themes using an
/// animated switch. It provides a smooth user experience with visually
/// engaging transitions between the themes.
///
/// #### Key Features:
/// - Utilizes `Theme.of(context)` to check the current theme mode.
/// - Displays different icons for light and dark themes with animated
///   opacity.
/// - Includes an interactive switch with animations for theme toggling.
/// - Relies on `ThemeBloc` for state management and theme updates.
///
/// #### Widget Structure:
/// 1. **Icons**: Displays a moon icon for the dark theme and a sun icon for
///    the light theme with opacity animations.
/// 2. **Switch**: An interactive container that acts as a theme toggle
///    with animated alignment and styling.
///
/// #### Interaction:
/// - On tapping the switch, a `ThemeChanged` event is dispatched to the
///   `ThemeBloc` to update the theme mode.
///
/// #### Animations:
/// - Icons fade in and out with an `AnimatedOpacity` widget.
/// - Switch thumb aligns to the left or right using `AnimatedAlign`.
/// - Switch background adjusts its appearance with an `AnimatedContainer`.
///
/// #### Example:
/// ```dart
/// ThemeSwitcher();
///
class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        const duration = Duration(milliseconds: 200);
        final isLightTheme = themeState.themeMode == ThemeMode.light;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Dark mode icon
            AnimatedOpacity(
              curve: Curves.easeIn,
              opacity: isLightTheme ? 0.0 : 1.0,
              duration: duration,
              child: SvgPicture.asset(
                Assets.icons.icLightMode,
              ),
            ),
            // Switch
            GestureDetector(
              onTap: () {
                context.read<ThemeBloc>().add(
                      ThemeChanged(
                        theme: isLightTheme ? ThemeMode.dark : ThemeMode.light,
                      ),
                    );
              },
              child: AnimatedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 40,
                height: 20,
                duration: duration * 2,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.primaryDark,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 100),
                    alignment: isLightTheme
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: AppColors.primaryDark,
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Light mode icon
            AnimatedOpacity(
              curve: Curves.easeIn,
              opacity: isLightTheme ? 1.0 : 0.0,
              duration: duration,
              child: SvgPicture.asset(
                Assets.icons.icDarkMode,
              ),
            ),
          ],
        );
      },
    );
  }
}
