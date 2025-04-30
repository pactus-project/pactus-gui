import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pactus_gui_widgetbook/app_core.dart';
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
    this.size = 48,
    this.color,
  });
  final double size;
  final String icon;
  final PalletColors? color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return HoverButton(
      onPressed: onPressed,
      cursor: SystemMouseCursors.click,
      builder: (context, states) {
        final actionColor = color == null
            ? AppTheme.of(context).extension<DarkPallet>()!.dark100
            : context.fromPalletColor(color!);
        return Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            color: states.isHovered ? actionColor : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
          ),
          child: SvgPicture.asset(
            icon,
            semanticsLabel: 'App bar button',
            height: size,
            width: size,
            colorFilter: ColorFilter.mode(
              AppTheme.of(context).extension<DarkPallet>()!.contrast!,
              BlendMode.srcIn,
            ),
          ),
        );
      },
    );
  }
}
