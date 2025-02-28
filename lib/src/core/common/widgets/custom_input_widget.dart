import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

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
  _CustomInputWidgetState createState() => _CustomInputWidgetState();
}

class _CustomInputWidgetState extends State<CustomInputWidget> {
  late TextEditingController _controller;
  late bool _obscureText;
  String? errorText;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _obscureText = widget.obscureText;
    _controller.addListener(validateInput);
    widget.confirmationController?.addListener(validateInput);
  }

  @override
  void dispose() {
    _controller.dispose();
    widget.confirmationController?.removeListener(validateInput);
    super.dispose();
  }

  void validateInput() {
    if (widget.confirmationController != null) {
      setState(() {
        errorText = (_controller.text != widget.confirmationController!.text)
            ? "Passwords do not match"
            : null;
      });
    }
    if (widget.onChanged != null) widget.onChanged!(_controller.text);
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
                color: errorText != null ? Colors.red : AppColors.expandableSeedTypeColor,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: WidgetStateProperty.resolveWith((states) {
                final isFocused = states.isFocused;
                return BoxDecoration(
                  color: widget.backgroundColor ?? AppTheme.of(context).extension<LightPallet>()!.light900,
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(4),
                  border: Border.all(
                    color: errorText != null ? Colors.red : (isFocused ? AppColors.inputActiveColor : Colors.transparent),
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
            child: Text(errorText!, style: TextStyle(color: Colors.red, fontSize: 12)),
          ),
      ],
    );
  }
}
