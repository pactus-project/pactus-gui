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
/// - **[controller]** (`TextEditingController`)
///   - Manages the text input value.
///
/// - **[placeholder]** (`String`)
///   - Placeholder text displayed when the input is empty.
///
/// - **[onChanged]** (`ValueChanged<String>?`)
///   - Callback triggered when text is modified.
///
/// - **[onSubmitted]** (`ValueChanged<String>?`)
///   - Callback triggered when the user submits the input.
///
/// - **[obscureText]** (`bool`)
///   - Determines whether text should be obscured (for passwords).
///   - Defaults to `false`.
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
/// ({required this.controller, required this.placeholder, ...})`
///   - Initializes the input field with customizable properties.
///
/// ### Important Notes:
///
/// - Uses `TextBox` for a Fluent UI-style text input.
/// - Implements a toggle for password visibility if `obscureText` is `true`.
/// - Dynamically adjusts border and background color based on the focus state.

///to-do #71 : add actual colors according to theme after there are defining
/// in widget book by Pouria
class CustomInputWidget extends StatefulWidget {
  const CustomInputWidget({
    super.key,
    required this.controller,
    required this.placeholder,
    this.onChanged,
    this.onSubmitted,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.readOnly = false,
    this.autofocus = false,
    this.textStyle,
    this.backgroundColor,
    this.borderRadius,
    this.width,
  });

  final TextEditingController controller;
  final String placeholder;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool obscureText;
  final int? maxLines;
  final int? minLines;
  final bool readOnly;
  final bool autofocus;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final double? width;

  @override
  State<CustomInputWidget> createState() => _CustomInputWidgetState();
}

class _CustomInputWidgetState extends State<CustomInputWidget> {
  late bool isObscured;

  @override
  void initState() {
    super.initState();
    isObscured = widget.obscureText;
  }

  void toggleObscureText() {
    setState(() {
      isObscured = !isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: 28,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          ExcludeSemantics(
            child: TextBox(
              controller: widget.controller,
              placeholder: widget.placeholder,
              placeholderStyle: TextStyle(
                color:
                    AppTheme.of(context).extension<OnSurfacePallet>()!.onSurface3,
              ),
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmitted,
              obscureText: isObscured,
              minLines: 1,
              readOnly: widget.readOnly,
              autofocus: widget.autofocus,
              textAlignVertical: TextAlignVertical.center,

              ///to-do #71 : there is no text style for place holder
              /// in Figma design. replace it after issue resolved by Pouria
              style: widget.textStyle ??
                  TextStyle(
                    fontSize: 14,
                    height: 1,
                  ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: WidgetStateProperty.resolveWith((states) {
                final isFocused = states.isFocused;
                return BoxDecoration(
                  color: widget.backgroundColor ??
                      AppTheme.of(context).extension<SurfacePallet>()!.surface3,
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(4),
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
          if (widget.obscureText)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: toggleObscureText,
                child: Icon(
                  isObscured ? FluentIcons.hide3 : FluentIcons.view,
                  size: 16,
                  color: Colors.grey[120],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
