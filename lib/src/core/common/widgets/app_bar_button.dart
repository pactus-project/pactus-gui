import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ## [FluentAppBarButton] Class Documentation
///
/// The `FluentAppBarButton` class represents a custom button widget with
/// an icon
/// that is used in the AppBar. It supports hover effects and is designed
/// to work
/// with the `fluent_ui` and `flutter_svg` packages for a smooth UI experience.
///
/// ### Usage:
///
/// This widget creates a button with an SVG icon and provides a hover effect.
/// The button color changes when hovered over. The button also allows you to
/// define the action that occurs when the button is pressed via the `onPressed`
/// callback.
///
/// ### Properties:
///
/// - **[icon]** (String):
///   - A string representing the path to the SVG icon used in the button.
///   - This path is passed to the `SvgPicture.asset()` constructor.
///
/// - **[onPressed]** (VoidCallback):
///   - A callback function that is triggered when the button is pressed.
///
/// ### Methods:
///
/// - **[build(BuildContext context)]**:
///   - Builds the widget's UI, including the hover button with the SVG icon and
///   hover effect.
///
class FluentAppBarButton extends StatelessWidget {
  const FluentAppBarButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = AppTheme.of(context).brightness == Brightness.dark;
    return HoverButton(
      onPressed: onPressed,
      cursor: SystemMouseCursors.click,
      builder: (context, states) {
        final theme = AppTheme.of(context);
        final defaultColor =
            isDark ? AppColors.primaryLight : AppColors.primaryDark;
        final hoverColor =
            theme.extension<DarkPallet>()?.dark300 ?? Colors.transparent;

        return Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: states.isHovered ? hoverColor : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
          ),
          child: SvgPicture.asset(
            icon,
            semanticsLabel: 'App bar button',
            colorFilter: ColorFilter.mode(
              defaultColor,
              BlendMode.srcIn,
            ),
          ),
        );
      },
    );
  }
}
