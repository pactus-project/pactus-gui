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
/// - **[obscureText]** (`bool`)
///   - Determines whether the text is obscured.
///   - Defaults to `true`.
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
    required this.width,
    required this.placeholder,
    required this.controller,
    required this.onChanged,
  });
  final double width;
  final String placeholder;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 38,
      child: ExcludeSemantics(
        child: PasswordBox(
          controller: controller,
          placeholder: placeholder,
          onChanged: onChanged,
          placeholderStyle: TextStyle(
            color: AppTheme.of(context).extension<DarkPallet>()!.dark600,
          ),
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(
            fontSize: 14,
            height: 1,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: WidgetStateProperty.resolveWith((states) {
            final isFocused = states.isFocused;
            return BoxDecoration(
              color: AppTheme.of(context).extension<LightPallet>()!.light900,
              borderRadius: BorderRadius.circular(4),
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
