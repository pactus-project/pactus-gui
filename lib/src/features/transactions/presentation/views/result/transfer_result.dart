import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/extensions/ui_extensions.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui/src/features/transactions/presentation/blocs/form_validations/transter_form_validation.dart'
    show TransferFormValidation;
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transaction_row_item.dart'
    show TransactionRowItem;

class TransferResult extends StatelessWidget {
  const TransferResult({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.read<TransferFormValidation>();
    return Column(
      spacing: 8,
      children: [
        TransactionRowItem(
          title: context.tr(LocaleKeys.transaction_type),
          value: context.tr(LocaleKeys.transfer),
        ),
        TransactionRowItem(
          title: context.tr(LocaleKeys.recipient),
          value: '${data.state.recipient}'.centerEllipsis(100, TextStyle()),
        ),
        TransactionRowItem(
          title: context.tr(LocaleKeys.amount),
          value: '${data.state.amount}',
        ),
        TransactionRowItem(
          title: context.tr(LocaleKeys.fee),
          value: '${data.state.fee}',
        ),
        TransactionRowItem(title: 'Status', value: 'Unknown'),
        TransactionRowItem(title: 'Transaction Hash', value: 'Unknown'),
      ],
    );
  }
}
