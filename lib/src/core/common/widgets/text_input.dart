import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';

class TextInputBox extends StatefulWidget {
  const TextInputBox({
    super.key,
    this.initialValue = '',
    this.onChanged,
    this.height = 32,
    this.width = 428,
    this.placeholder,
    this.enabled = true,
    this.errorText,
    this.header,
    this.maxLength,
  });

  final double width;
  final double height;
  final String initialValue;
  final ValueChanged<String>? onChanged;
  final String? placeholder;
  final bool enabled;
  final String? errorText;
  final String? header;
  final int? maxLength;

  @override
  State<TextInputBox> createState() => _TextInputBoxState();
}

class _TextInputBoxState extends State<TextInputBox> {
  late final TextEditingController _textController;
  late final FocusNode _focusNode;
  late final ValueNotifier<String> _textNotifier;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.initialValue);
    _focusNode = FocusNode();
    _textNotifier = ValueNotifier(widget.initialValue);

    _textController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    _textNotifier.value = _textController.text;
    widget.onChanged?.call(_textController.text);
  }

  @override
  void didUpdateWidget(covariant TextInputBox oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initialValue != oldWidget.initialValue &&
        widget.initialValue != _textController.text) {
      _textController.text = widget.initialValue;
      _textNotifier.value = widget.initialValue;
    }
  }

  @override
  void dispose() {
    _textController
      ..removeListener(_onTextChanged)
      ..dispose();
    _focusNode.dispose();
    _textNotifier.dispose();
    super.dispose();
  }

  Widget _buildCounterSuffix(
    BuildContext context,
    FluentThemeData fluentTheme,
    String currentText,
  ) {
    if (widget.maxLength == null) {
      return const SizedBox.shrink();
    }

    final currentLength = currentText.length;
    final isOverLimit = currentLength > widget.maxLength!;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Text(
        '$currentLength/${widget.maxLength}',
        style: fluentTheme.typography.caption?.copyWith(
          color: isOverLimit
              ? fluentTheme.resources.systemFillColorCritical
              : fluentTheme.resources.textFillColorSecondary,
          fontSize: 12,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fluentTheme = FluentTheme.of(context);
    final padding = widget.maxLength != null
        ? EdgeInsetsDirectional.only(end: 56, start: 8)
        : EdgeInsetsDirectional.only(start: 8);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: UnconstrainedBox(
        child: SizedBox(
          width: widget.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              if (widget.header != null) ...[
                Text(
                  context.tr(widget.header!),
                  style: fluentTheme.typography.body?.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 8),
              ],

              // Text Field with Counter Suffix
              SizedBox(
                height: widget.height,
                child: ValueListenableBuilder<String>(
                  valueListenable: _textNotifier,
                  builder: (context, currentText, _) {
                    final Widget textBox = TextBox(
                      maxLength: widget.maxLength,
                      padding: padding,
                      controller: _textController,
                      focusNode: _focusNode,
                      onChanged: widget.onChanged,
                      enabled: widget.enabled,
                      placeholder: context.tr(widget.placeholder!),
                      style: fluentTheme.typography.body,
                    );
                    return widget.maxLength == null
                        ? textBox
                        : Stack(
                            alignment: AlignmentDirectional.centerEnd,
                            children: [
                              textBox,
                              _buildCounterSuffix(
                                context,
                                fluentTheme,
                                currentText,
                              ),
                            ],
                          );
                  },
                ),
              ),

              // Error Text
              if (widget.errorText != null) ...[
                const SizedBox(height: 4),
                Text(
                  context.tr(widget.errorText!),
                  style: fluentTheme.typography.caption?.copyWith(
                    color: fluentTheme.resources.systemFillColorCritical,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
