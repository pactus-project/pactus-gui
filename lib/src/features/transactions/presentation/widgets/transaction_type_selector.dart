import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui/src/core/enums/app_enums.dart' show TransactionType;
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart'
    show LocaleKeys;
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';

class TransactionTypeSelector extends StatefulWidget {
  const TransactionTypeSelector({
    super.key,
    this.initialValue,
    this.onChanged,
    this.height = 32,
    this.width = 428,
  });

  final double width;
  final double height;
  final TransactionType? initialValue;
  final ValueChanged<TransactionType?>? onChanged;

  @override
  State<TransactionTypeSelector> createState() =>
      _TransactionTypeSelectorState();
}

class _TransactionTypeSelectorState extends State<TransactionTypeSelector> {
  late final ValueNotifier<TransactionType?> _transactionTypeNotifier;
  final double comboBoxInnerGap = 44;

  @override
  void initState() {
    super.initState();
    _transactionTypeNotifier = ValueNotifier(
      _parseInitialTransactionType(widget.initialValue),
    );
  }

  TransactionType? _parseInitialTransactionType(TransactionType? initialValue) {
    if (initialValue == null) {
      return null;
    }
    final filtered = TransactionType.values.where(
      (transactionType) => transactionType == initialValue,
    );
    return filtered.isNotEmpty ? filtered.first : null;
  }

  List<ComboBoxItem<TransactionType?>> _buildTransactionTypeItems(
    BuildContext context,
  ) {
    return TransactionType.values.map<ComboBoxItem<TransactionType?>>((
      transactionType,
    ) {
      return ComboBoxItem<TransactionType?>(
        value: transactionType,
        child: SizedBox(
          width: widget.width - comboBoxInnerGap,
          child: Row(children: [Text(context.tr(transactionType.title))]),
        ),
      );
    }).toList();
  }

  Widget _buildPlaceholder(BuildContext context) {
    return Row(children: [Text(context.tr(LocaleKeys.transaction_type))]);
  }

  @override
  void didUpdateWidget(covariant TransactionTypeSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      _transactionTypeNotifier.value = _parseInitialTransactionType(
        widget.initialValue,
      );
    }
  }

  @override
  void dispose() {
    _transactionTypeNotifier.dispose();
    super.dispose();
  }

  void _handleTransactionTypeChanged(TransactionType? newTransactionType) {
    _transactionTypeNotifier.value = newTransactionType;
    widget.onChanged?.call(newTransactionType);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: UnconstrainedBox(
        child: SizedBox(
          width: widget.width,
          height: widget.height + 2,
          child: ValueListenableBuilder<TransactionType?>(
            valueListenable: _transactionTypeNotifier,
            builder: (context, currentTransactionType, _) {
              return ComboBox<TransactionType?>(
                value: currentTransactionType,
                items: _buildTransactionTypeItems(context),
                placeholder: _buildPlaceholder(context),
                onChanged: _handleTransactionTypeChanged,
              );
            },
          ),
        ),
      ),
    );
  }
}
