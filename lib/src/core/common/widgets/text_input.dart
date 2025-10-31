import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui/src/core/enums/app_enums.dart' show InputFilter;
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
    this.suffix,
    this.inputFilter,
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
  final Widget? suffix;
  final InputFilter? inputFilter;

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

    // Remove the listener since we're handling changes in onChanged
    // _textController.addListener(_onTextChanged);
  }

  void _handleTextInput(String newValue) {
    final oldValue = _textController.text;

    // FIX: Detect if this is a deletion operation
    final isDeletion = newValue.length < oldValue.length;

    var finalValue = newValue;

    // Only apply filtering for non-deletion operations
    if (!isDeletion && widget.inputFilter != null) {
      finalValue = widget.inputFilter!.filter(newValue);
    }

    // Always update the controller for deletion operations
    // Only update for insertion if the value changed due to filtering
    if (isDeletion || finalValue != oldValue) {
      _textController.text = finalValue;

      // FIX: Smart cursor positioning
      if (isDeletion) {
      } else if (finalValue != newValue) {
        // Filtering occurred during insertion - adjust cursor
        final cursorPosition = _textController.selection.baseOffset;
        final adjustedPosition = (cursorPosition <= finalValue.length)
            ? cursorPosition
            : finalValue.length;
        _textController.selection = TextSelection.collapsed(
          offset: adjustedPosition,
        );
      }
    }

    _textNotifier.value = finalValue;
    widget.onChanged?.call(finalValue);
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
    _textController.dispose();
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

  Align _buildSuffixWidgets(
    BuildContext context,
    FluentThemeData fluentTheme,
    String currentText,
  ) {
    final widgets = <Widget>[];

    // Add custom suffix first (if provided)
    if (widget.suffix != null) {
      widgets.add(
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 8),
          child: widget.suffix,
        ),
      );
    }

    // Add counter suffix (if maxLength is provided)
    if (widget.maxLength != null) {
      widgets.add(_buildCounterSuffix(context, fluentTheme, currentText));
    }

    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Row(mainAxisSize: MainAxisSize.min, children: widgets),
    );
  }

  EdgeInsetsGeometry _calculatePadding() {
    double endPadding = 8; // Base padding

    // Add space for custom suffix
    if (widget.suffix != null) {
      endPadding += 32; // Approximate width for custom suffix
    }

    // Add space for counter
    if (widget.maxLength != null) {
      endPadding += 40; // Approximate width for counter
    }

    return EdgeInsetsDirectional.only(end: endPadding, start: 8);
  }

  @override
  Widget build(BuildContext context) {
    final fluentTheme = FluentTheme.of(context);
    final hasSuffix = widget.suffix != null || widget.maxLength != null;

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

              // Text Field with Suffix Widgets
              SizedBox(
                height: widget.height,
                child: ValueListenableBuilder<String>(
                  valueListenable: _textNotifier,
                  builder: (context, currentText, _) {
                    final Widget textBox = TextBox(
                      maxLength: widget.maxLength,
                      padding: _calculatePadding(),
                      controller: _textController,
                      focusNode: _focusNode,
                      onChanged: _handleTextInput, // Use our filtered handler
                      enabled: widget.enabled,
                      placeholder: context.tr(widget.placeholder!),
                      style: fluentTheme.typography.body,
                    );

                    return !hasSuffix
                        ? textBox
                        : Stack(
                            alignment: AlignmentDirectional.centerEnd,
                            children: [
                              textBox,
                              _buildSuffixWidgets(
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

/*

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
    this.suffix,
    this.inputFilter,
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
  final Widget? suffix;
  final InputFilter? inputFilter;

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

  Align _buildSuffixWidgets(
    BuildContext context,
    FluentThemeData fluentTheme,
    String currentText,
  ) {
    final widgets = <Widget>[];

    // Add custom suffix first (if provided)
    if (widget.suffix != null) {
      widgets.add(
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 8),
          child: widget.suffix,
        ),
      );
    }

    // Add counter suffix (if maxLength is provided)
    if (widget.maxLength != null) {
      widgets.add(_buildCounterSuffix(context, fluentTheme, currentText));
    }

    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Row(mainAxisSize: MainAxisSize.min, children: widgets),
    );
  }

  EdgeInsetsGeometry _calculatePadding() {
    double endPadding = 8; // Base padding

    // Add space for custom suffix
    if (widget.suffix != null) {
      endPadding += 32; // Approximate width for custom suffix
    }

    // Add space for counter
    if (widget.maxLength != null) {
      endPadding += 40; // Approximate width for counter
    }

    return EdgeInsetsDirectional.only(end: endPadding, start: 8);
  }

  @override
  Widget build(BuildContext context) {
    final fluentTheme = FluentTheme.of(context);
    final hasSuffix = widget.suffix != null || widget.maxLength != null;

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

              // Text Field with Suffix Widgets
              SizedBox(
                height: widget.height,
                child: ValueListenableBuilder<String>(
                  valueListenable: _textNotifier,
                  builder: (context, currentText, _) {
                    final Widget textBox = TextBox(
                      maxLength: widget.maxLength,
                      padding: _calculatePadding(),
                      controller: _textController,
                      focusNode: _focusNode,
                      onChanged: widget.onChanged,
                      enabled: widget.enabled,
                      placeholder: context.tr(widget.placeholder!),
                      style: fluentTheme.typography.body,
                    );

                    return !hasSuffix
                        ? textBox
                        : Stack(
                            alignment: AlignmentDirectional.centerEnd,
                            children: [
                              textBox,
                              ...[
                                _buildSuffixWidgets(
                                  context,
                                  fluentTheme,
                                  currentText,
                                ),
                              ],
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
*/
