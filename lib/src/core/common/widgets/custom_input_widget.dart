import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ## [CustomInputWidget] Class Documentation
///
/// The `CustomInputWidget` is a customizable text input field that
/// supports various configurations,
/// including password masking, validation, and styling.
///
/// ### Properties:
///
/// - **[controller]** (TextEditingController?):
///   - Manages the text input field. If not provided, an internal
///   controller is used.
///
/// - **[confirmationController]** (TextEditingController?):
///   - If set, validates that the input matches the text of
///   another field (e.g., password confirmation).
///
/// - **[placeholder]** (String):
///   - Placeholder text displayed inside the input field.
///
/// - **[onChanged]** (ValueChanged - String?):
///   - Callback triggered when the text value changes.
///
/// - **[maxLines] / [minLines]** (int?):
///   - Controls the number of lines for the input field.
///
/// - **[readOnly]** (bool):
///   - If `true`, the field is non-editable.
///
/// - **[autofocus]** (bool):
///   - Determines whether the field receives focus automatically.
///
/// - **[textStyle] / [placeHolderTextStyle]** (TextStyle?):
///   - Defines the text styling for the input and placeholder.
///
/// - **[backgroundColor]** (Color?):
///   - Background color of the input field.
///
/// - **[borderRadius]** (BorderRadius?):
///   - Defines the border radius of the field.
///
/// - **[width]** (double?):
///   - Specifies the width of the input field.
///
/// - **[obscureText]** (bool):
///   - Enables password masking when `true`.
///
/// - **[obscureIcon]** (Widget?):
///   - Custom icon to toggle password visibility.
///
/// ### Methods:
///
/// - **[validateInput()]**:
///   - Checks if the input matches the `confirmationController`
///   value (if provided).
///   - Updates the error message accordingly.
///
/// - **[build(BuildContext context)]**:
///   - Constructs the UI of the input field, which includes:
///     - A `TextBox` with validation and dynamic styling.
///     - A password visibility toggle if `obscureText` is enabled.
///     - An error message display if validation fails.
///
class CustomInputWidget extends StatefulWidget {
  const CustomInputWidget({
    super.key,
    this.controller,
    this.placeholder = '',
    this.onChanged,
    this.maxLines = 1,
    this.minLines,
    this.readOnly = false,
    this.autofocus = false,
    this.textStyle,
    this.backgroundColor,
    this.borderRadius,
    this.width,
    this.obscureText = false,
    this.obscureIcon,
    this.placeHolderTextStyle,
    this.confirmationController,
  });

  final TextEditingController? controller;
  final TextEditingController? confirmationController;
  final String placeholder;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final int? minLines;
  final bool readOnly;
  final bool autofocus;
  final TextStyle? textStyle;
  final TextStyle? placeHolderTextStyle;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final double? width;
  final bool obscureText;
  final Widget? obscureIcon;

  @override
  CustomInputWidgetState createState() => CustomInputWidgetState();
}

class CustomInputWidgetState extends State<CustomInputWidget> {
  late TextEditingController _controller;
  late bool _obscureText;
  String? errorText;
  bool _isInternalController = false;

  @override
  void initState() {
    super.initState();
    // Only create a new controller if one wasn't provided
    if (widget.controller == null) {
      _controller = TextEditingController();
      _isInternalController = true;
    } else {
      _controller = widget.controller!;
    }
    _obscureText = widget.obscureText;
    _controller.addListener(validateInput);
    widget.confirmationController?.addListener(validateInput);
  }

  @override
  void dispose() {
    // Only dispose the controller if we created it internally
    if (_isInternalController) {
      _controller.dispose();
    }
    // Always remove listeners to prevent memory leaks
    _controller.removeListener(validateInput);
    widget.confirmationController?.removeListener(validateInput);
    super.dispose();
  }

  void validateInput() {
    if (widget.confirmationController != null) {
      setState(() {
        errorText = (_controller.text != widget.confirmationController!.text)
            ? 'Passwords do not match'
            : null;
      });
    }
    if (widget.onChanged != null) {
      widget.onChanged!(_controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: widget.width,
          height: 38,
          child: ExcludeSemantics(
            child: TextBox(
              controller: _controller,
              placeholder: widget.placeholder,
              placeholderStyle: widget.placeHolderTextStyle,
              onChanged: (value) => validateInput(),
              maxLines: widget.maxLines,
              minLines: 1,
              readOnly: widget.readOnly,
              autofocus: widget.autofocus,
              obscureText: _obscureText,
              textAlignVertical: TextAlignVertical.center,
              style: widget.textStyle?.copyWith(
                color: errorText != null
                    ? Colors.red
                    : AppColors.expandableSeedTypeColor,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: WidgetStateProperty.resolveWith((states) {
                final isFocused = states.isFocused;
                return BoxDecoration(
                  color: widget.backgroundColor ??
                      AppTheme.of(context).extension<LightPallet>()!.light900,
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(4),
                  border: Border.all(
                    color: errorText != null
                        ? Colors.red
                        : (isFocused
                            ? AppColors.inputActiveColor
                            : Colors.transparent),
                    width: 2,
                  ),
                );
              }),
              suffix: widget.obscureText
                  ? IconButton(
                      icon: widget.obscureIcon ??
                          Icon(
                            _obscureText ? FluentIcons.hide3 : FluentIcons.view,
                            color: Colors.grey,
                            size: 19,
                          ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              errorText!,
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
