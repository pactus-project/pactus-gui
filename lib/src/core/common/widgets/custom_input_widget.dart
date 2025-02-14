import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ## [CustomInputWidget] Class Documentation
///
/// The `CustomInputWidget` is a customizable text input field
/// that supports various configurations, including password hiding,
/// placeholder text, and dynamic styling.
///
/// ### Properties:
///
/// - **[placeholder]** (`String`)
///   - Placeholder text displayed when the input is empty.
///
/// - **[onChanged]** (`ValueChanged<String>?`)
///   - Callback triggered when text is modified.
///
/// - **[maxLines]** (`int?`)
///   - Maximum number of lines for the text input.
///   - Defaults to `1`.
///
/// - **[minLines]** (`int?`)
///   - Minimum number of lines for the text input.
///   - Optional.
///
/// - **[readOnly]** (`bool`)
///   - Determines whether the field is read-only.
///   - Defaults to `false`.
///
/// - **[autofocus]** (`bool`)
///   - Determines whether the field receives focus automatically.
///   - Defaults to `false`.
///
/// - **[textStyle]** (`TextStyle?`)
///   - Custom style for the text input.
///
/// - **[backgroundColor]** (`Color?`)
///   - Background color of the input field.
///
/// - **[borderRadius]** (`BorderRadius?`)
///   - Defines the border radius of the input field.
///
/// - **[width]** (`double?`)
///   - Custom width for the input field.
///
/// ### Constructor:
///
/// - `CustomInputWidget
/// ({required this.placeholder, ...})`
///   - Initializes the input field with customizable properties.
///
/// ### Important Notes:
///
/// - Uses `TextBox` for a Fluent UI-style text input.
/// - Implements a toggle for password visibility if `obscureText` is `true`.
/// - Dynamically adjusts border and background color based on the focus state.
class CustomInputWidget extends StatelessWidget {
  const CustomInputWidget({
    super.key,
    required this.placeholder,
    this.onChanged,
    this.maxLines = 1,
    this.minLines,
    this.readOnly = false,
    this.autofocus = false,
    this.textStyle,
    this.backgroundColor,
    this.borderRadius,
    this.width,
  });

  final String placeholder;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final int? minLines;
  final bool readOnly;
  final bool autofocus;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 38,
      child: ExcludeSemantics(
        child: TextBox(
          placeholder: placeholder,
          placeholderStyle: TextStyle(
            color:
                AppTheme.of(context).extension<LightPallet>()!.light900,
          ),
          onChanged: onChanged,
          maxLines: maxLines,
          minLines: 1,
          readOnly: readOnly,
          autofocus: autofocus,
          textAlignVertical: TextAlignVertical.center,

          // TODO(pouria): #71 there is no text style for placeholder .
          style: textStyle ??
              TextStyle(
                fontSize: 14,
                height: 1,
              ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: WidgetStateProperty.resolveWith((states) {
            final isFocused = states.isFocused;
            return BoxDecoration(
              color: backgroundColor ??
                  AppTheme.of(context).extension<LightPallet>()!.light900,
              borderRadius: borderRadius ?? BorderRadius.circular(4),
              border: Border(
                bottom: BorderSide(
                  color: isFocused
                      ? AppColors.inputActiveColor
                      : Colors.transparent,
                  width: 2,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
