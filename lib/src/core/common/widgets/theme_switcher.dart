import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/enums/theme_modes.dart';
import 'package:gui/src/core/utils/assets/assets.gen.dart';
import 'package:gui/src/features/main/theme/bloc/theme_bloc.dart';

/// ### [ThemeSwitcher] Documentation
/// A widget that toggles between light and dark themes using a animated switch.
///
/// - Uses `Theme.of(context)` to determine the current theme.
/// - Displays different icons for light and dark modes with animations.
/// - Provides a switch that triggers a theme change by `ThemeBloc` when tapped.
///
class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLightTheme = theme.brightness == Brightness.light;
    const duration = Duration(milliseconds: 200);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
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
                    theme: isLightTheme ? ThemeModes.dark : ThemeModes.light,
                  ),
                );
          },
          child: AnimatedContainer(
            margin: EdgeInsets.symmetric(horizontal: 4),
            width: 40, // Total width of the switch
            height: 20, // Total height of the switch
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
                duration: Duration(milliseconds: 100),
                alignment:
                    isLightTheme ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 14, // Thumb width
                  height: 14, // Thumb height
                  decoration: BoxDecoration(
                    color: AppColors.primaryDark,
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
            ),
          ),
        ),
        // Sun icon (right side)
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
  }
}
