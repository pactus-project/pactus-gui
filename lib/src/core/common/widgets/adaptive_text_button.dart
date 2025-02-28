import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ## [AdaptiveTextButton] Class Documentation
///
/// The `AdaptiveTextButton` class represents a customizable text button widget
/// that doesn't have a background or border color, and the content is
/// passed in as parameters.
///
/// ### Properties:
/// - **[text]** (String):
///   - The text displayed on the button, localized using `context.tr`.
///
/// - **[onPressed]** (VoidCallback):
///   - The function executed when the button is pressed.
///
/// - **[style]** (ButtonStyle?):
///   - Custom button style; if not provided, a default style is used.
///
/// - **[icon]** (Widget?):
///   - An optional icon displayed before the text.
///
/// - **[autofocus]** (bool):
///   - Determines if the button should autofocus.
///
/// - **[focusNode]** (FocusNode?):
///   - An optional focus node.
///
/// - **[padding]** (EdgeInsetsGeometry?):
///   - Custom padding for button content.
///
/// - **[textColor]** (Color?):
///   - The color of the text displayed on the button.
///   - If not provided, the text color defaults to `AppColors.primaryDark`.
///
class AdaptiveTextButton extends StatelessWidget {
  const AdaptiveTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.style,
    this.icon,
    this.autofocus = false,
    this.focusNode,
    this.padding,
    this.textColor,
  });

  final String text;
  final VoidCallback onPressed;
  final ButtonStyle? style;
  final Widget? icon;
  final bool autofocus;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? padding;
  final Color? textColor;

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
                color: textColor ?? AppColors.primaryDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
