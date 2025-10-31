import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/extensions/ui_extensions.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart'
    show LocaleKeys;
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui/src/features/transactions/presentation/blocs/form_validations/unbond_form_validation.dart'
    show UnBondFormValidation;
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transaction_row_item.dart'
    show TransactionRowItem;

class UnBondResult extends StatelessWidget {
  const UnBondResult({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.read<UnBondFormValidation>();

    return Column(
      spacing: 8,
      children: [
        TransactionRowItem(
          title: context.tr(LocaleKeys.transaction_type),
          value: context.tr(LocaleKeys.unbond),
        ),
        TransactionRowItem(
          title: context.tr(LocaleKeys.validator),
          value: '${data.state.validator}'.centerEllipsis(100, TextStyle()),
        ),
        TransactionRowItem(title: 'Status', value: 'Unknown'),
        TransactionRowItem(title: 'Transaction Hash', value: 'Unknown'),
      ],
    );
  }
}
