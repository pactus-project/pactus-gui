import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ## [CustomOutlinedButton] Class Documentation
///
/// The [CustomOutlinedButton] is a customizable outlined button
/// that supports icons, padding, and custom styles.
///
/// ### Properties:
///
/// - **[text]** (String):
///   - The button's label text.
///
/// - **[onPressed]** (VoidCallback):
///   - Function to execute when the button is pressed.
///
/// - **[style]** (ButtonStyle?):
///   - Custom button style.
///
/// - **[icon]** (Widget?):
///   - Optional leading icon for the button.
///
/// - **[autofocus]** (bool):
///   - If true, the button will request focus on initialization.
///
/// - **[focusNode]** (FocusNode?):
///   - Focus node for managing focus state.
///
/// - **[padding]** (EdgeInsetsGeometry?):
///   - Padding inside the button.
///
/// - **[borderColor]** (Color):
///   - The color of the button border.
///
class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.style,
    this.icon,
    this.autofocus = false,
    this.focusNode,
    this.padding,
    required this.borderColor,
  });

  final String text;
  final VoidCallback onPressed;
  final ButtonStyle? style;
  final Widget? icon;
  final bool autofocus;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? padding;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      autofocus: autofocus,
      focusNode: focusNode,
      style: style ??
          ButtonStyle(
            padding: WidgetStateProperty.all<EdgeInsetsDirectional?>(
              const EdgeInsetsDirectional.symmetric(
                horizontal: 24,
                vertical: 4,
              ),
            ),
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: BorderSide(color: borderColor, width: 2),
              ),
            ),
          ),
      child: Padding(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) icon!,
            if (icon != null) const SizedBox(width: 8),
            Text(
              context.tr(text),
              textAlign: TextAlign.center,
              style: InterTextStyles.bodyBold.copyWith(
                height: 0,
                color: AppColors.primaryDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
