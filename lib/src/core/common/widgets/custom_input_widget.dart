import 'dart:async';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui/src/core/common/colors/app_colors.dart'
    show AppColors;
import 'package:pactus_gui/src/core/utils/validators/password_validation.dart'
    show PasswordValidation;
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ## [CustomInputWidget] Class Documentation
///
/// The `CustomInputWidget` class is a customizable input field
/// widget with various properties for user input interactions.
/// It supports features such as obscured text, custom styling,
/// validation, and controller management.
///
/// ### Properties:
///
/// - **[controller]**:
///   - A `TextEditingController` used to manage the text being
///   edited. If not provided, an internal controller is created.
///
/// - **[confirmationController]**:
///   - An optional `TextEditingController` used for password
///   confirmation input validation.
///
/// - **[placeholder]**:
///   - The placeholder text displayed inside the input field.
///
/// - **[onChanged]**:
///   - A callback function triggered whenever the text in the
///   input field changes.
///
/// - **[maxLines]**:
///   - The maximum number of lines the input field can expand to.
///
/// - **[minLines]**:
///   - The minimum number of lines the input field will display.
///
/// - **[readOnly]**:
///   - A boolean indicating whether the input field is read-only.
///
/// - **[autofocus]**:
///   - A boolean indicating whether the input field should
///   automatically gain focus upon widget build.
///
/// - **[textStyle]**:
///   - A `TextStyle` for the text displayed in the input field.
///
/// - **[placeHolderTextStyle]**:
///   - A `TextStyle` for the placeholder text.
///
/// - **[backgroundColor]**:
///   - The background color of the input field.
///
/// - **[borderRadius]**:
///   - The border radius of the input field.
///
/// - **[width]**:
///   - The width of the input field.
///
/// - **[obscureText]**:
///   - A boolean indicating whether the text should be obscured
///   (e.g., for passwords).
///
/// - **[obscureIcon]**:
///   - An optional custom icon displayed to toggle the obscured
///   text visibility.
///
/// ### Methods:
///
/// - **[initState()]**:
///   - Initializes the widget, sets up the controller, and adds listeners
///   for input validation.
///
/// - **[dispose()]**:
///   - Disposes of the internal controller and removes listeners when the
///   widget is disposed.
///
/// - **[validateInput()]**:
///   - Validates the input text, checking if it matches the confirmation text
///   (if provided), and triggers the `onChanged` callback.
///
/// - **[build(BuildContext context)]**:
///   - Builds the widget, displaying the input field and managing the text
///   input, validation, and styling.
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
    this.passwordValidation, // New optional parameter
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
  final PasswordValidation? passwordValidation; // Optional LoginValidation

  @override
  CustomInputWidgetState createState() => CustomInputWidgetState();
}

class CustomInputWidgetState extends State<CustomInputWidget> {
  late TextEditingController _controller;
  late bool _obscureText;
  String? errorText;
  bool _isInternalController = false;
  StreamSubscription<String>? _passwordSubscription;

  @override
  void initState() {
    super.initState();
    // Initialize controller
    if (widget.controller == null) {
      _controller = TextEditingController();
      _isInternalController = true;
    } else {
      _controller = widget.controller!;
    }
    _obscureText = widget.obscureText;
    _controller.addListener(validateInput);

    // Setup password validation if LoginValidation is provided
    if (widget.passwordValidation != null) {
      _passwordSubscription = widget.passwordValidation!.password.listen(
        (password) {
          setState(() {
            errorText = null; // Clear error on valid input
          });
        },
        onError: (Object error) {
          setState(() {
            errorText = error.toString(); // Display validation error
          });
        },
      );
    }

    widget.confirmationController?.addListener(validateInput);
  }

  @override
  void dispose() {
    // Cleanup subscription
    _passwordSubscription?.cancel();
    // Cleanup controller if internal
    if (_isInternalController) {
      _controller.dispose();
    }
    _controller.removeListener(validateInput);
    widget.confirmationController?.removeListener(validateInput);
    super.dispose();
  }

  void validateInput() {
    // Confirmation validation
    if (widget.confirmationController != null) {
      setState(() {
        errorText = (_controller.text != widget.confirmationController!.text)
            ? 'Passwords do not match'
            : null;
      });
    }
    // Update LoginValidation if provided
    if (widget.passwordValidation != null) {
      widget.passwordValidation!.changePassword(_controller.text);
    }
    // Trigger onChanged callback
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
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 5,
              ),
              decoration: WidgetStateProperty.resolveWith((states) {
                final isFocused = states.isFocused;
                return BoxDecoration(
                  color: widget.backgroundColor ??
                      AppTheme.of(context).extension<LightPallet>()!.light900,
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(4),
                  border: Border(
                    bottom: BorderSide(
                      color: errorText != null
                          ? Colors.red
                          : (isFocused
                              ? FluentTheme.of(context).accentColor
                              : Colors.transparent),
                      width: 2,
                    ),
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
