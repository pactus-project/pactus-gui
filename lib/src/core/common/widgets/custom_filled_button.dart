import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';
/// ## [CustomFilledButton] Class Documentation
///
/// The `CustomFilledButton` class represents a custom styled filled button
/// widget.
/// It is built using the `Button` widget from the `fluent_ui` package and
/// provides customization options
/// for styling, text, icon, and various button properties.
///
/// ### Usage:
/// This class allows you to create a custom filled button with a text label
/// , an optional icon, and customizable properties.
/// It is ideal for creating buttons with specific styles and behaviors within
/// a Fluent UI-based application.
///
/// ### Properties:
/// - **[text]** (String):
///   - The text to be displayed on the button.
///   - This will be localized using the `context.tr` method.
///
/// - **[onPressed]** (VoidCallback):
///   - The callback function that is executed when the button is pressed.
///   - This is a required parameter.
///
/// - **[style]** (ButtonStyle?):
///   - Optional button style that can be passed to customize the button's
///   appearance.
///   - If not provided, a default style is used.
///
/// - **[icon]** (Widget?):
///   - An optional widget (usually an icon) that will be displayed
///   before the button's text.
///   - If no icon is provided, the button will only display the text.
///
/// - **[autofocus]** (bool):
///   - A boolean indicating whether the button should autofocus when
///   the widget is built.
///   - Defaults to `false`.
///
/// - **[focusNode]** (FocusNode?):
///   - An optional focus node to manage the focus state of the button.
///
/// - **[padding]** (EdgeInsetsGeometry?):
///   - Optional padding for the button's content. If not provided,
///   default padding is used.
///
/// ### Notes:
/// - The button's text is automatically localized using the `context.tr(text)`
/// method from the localization extension.
/// - If no `style` is provided, the button will use a default style with a
/// specific padding, background color, and rounded shape.

class CustomFilledButton extends StatelessWidget {

  const CustomFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.style,
    this.icon,
    this.autofocus = false,
    this.focusNode,
    this.padding,
  });
  final String text;
  final VoidCallback onPressed;
  final ButtonStyle? style;
  final Widget? icon;
  final bool autofocus;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      autofocus: autofocus,
      focusNode: focusNode,
      style: style ?? ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsDirectional?>(
          const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 4),
        ),
        backgroundColor: WidgetStateProperty.all(const Color(0xFF0066B4)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
      child: Padding(
        padding: padding ??
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) icon!,
            if (icon != null) const SizedBox(width: 8),
            Text(
              context.tr(text),
              style: InterTextStyles.bodyBold.copyWith(
                color: AppColors.primaryLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
