import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ## [CustomPasswordWidget] Class Documentation
///
/// The `CustomPasswordWidget` is a customizable password input field
/// that supports various configurations, including placeholder text,
/// dynamic styling, and focus behavior.
///
/// ### Properties:
///
/// - **[placeholder]** (`String`)
///   - Placeholder text displayed when the input is empty.
///
/// - **[onChanged]** (`ValueChanged<String>?`)
///   - Callback triggered when text is modified.
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
///   - If not provided, defaults to a font size of `14` and height of `1`.
///
/// - **[backgroundColor]** (`Color?`)
///   - Background color of the input field.
///   - If not specified, it defaults to `light900` from `LightPallet`.
///
/// - **[borderRadius]** (`BorderRadius?`)
///   - Defines the border radius of the input field.
///   - Defaults to `BorderRadius.circular(4)`.
///
/// - **[width]** (`double?`)
///   - Custom width for the input field.
///
/// ### Constructor:
///
/// - `CustomPasswordWidget({required this.placeholder, ...})`
///   - Initializes the input field with customizable properties.
///
/// ### Important Notes:
///
/// - Uses `PasswordBox` from Fluent UI.
/// - Applies custom styling for placeholder text.
/// - Dynamically adjusts border and background color based on the focus state.
/// - A bottom border appears when the field is focused.
class CustomPasswordWidget extends StatelessWidget {
  const CustomPasswordWidget({
    super.key,
    required this.placeholder,
    this.onChanged,
    this.readOnly = false,
    this.autofocus = false,
    this.textStyle,
    this.backgroundColor,
    this.borderRadius,
    this.width,
  });

  final String placeholder;
  final ValueChanged<String>? onChanged;
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
        child: PasswordBox(
          placeholder: placeholder,
          placeholderStyle: TextStyle(
            color: AppTheme.of(context).extension<DarkPallet>()!.dark600,
          ),
          onChanged: onChanged,
          readOnly: readOnly,
          autofocus: autofocus,
          textAlignVertical: TextAlignVertical.center,
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
