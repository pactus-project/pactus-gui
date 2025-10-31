import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/extensions/ui_extensions.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart'
    show LocaleKeys;
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui/src/features/transactions/presentation/blocs/form_validations/withdraw_form_validator.dart'
    show WithdrawFormValidation;
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transaction_row_item.dart'
    show TransactionRowItem;

class WithdrawResult extends StatelessWidget {
  const WithdrawResult({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.read<WithdrawFormValidation>();

    return Column(
      spacing: 8,
      children: [
        TransactionRowItem(
          title: context.tr(LocaleKeys.transaction_type),
          value: context.tr(LocaleKeys.withdraw),
        ),
        TransactionRowItem(
          title: context.tr(LocaleKeys.recipient),
          value: '${data.state.recipient}'.centerEllipsis(100, TextStyle()),
        ),
        TransactionRowItem(
          title: context.tr(LocaleKeys.validator),
          value: '${data.state.validator}'.centerEllipsis(100, TextStyle()),
        ),
        TransactionRowItem(
          title: context.tr(LocaleKeys.stake),
          value: '${data.state.stake}',
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
