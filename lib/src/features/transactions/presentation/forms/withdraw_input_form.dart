import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/common/widgets/form_row_item.dart'
    show FormRowItem;
import 'package:pactus_gui/src/core/common/widgets/text_input.dart'
    show TextInputBox;
import 'package:pactus_gui/src/core/enums/app_enums.dart'
    show InputFilter, TransactionType;
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart'
    show LocaleKeys;
import 'package:pactus_gui/src/features/transactions/presentation/blocs/transaction_type_cubit.dart'
    show TransactionTypeCubit;
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transaction_type_selector.dart'
    show TransactionTypeSelector;
import 'package:pactus_gui_widgetbook/app_styles.dart';

class WithdrawInputForm extends StatelessWidget {
  const WithdrawInputForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        FormRowItem(
          title: LocaleKeys.transaction_type,
          inputWidget: TransactionTypeSelector(
            initialValue: TransactionType.withdraw,
            onChanged: (selectedItem) {
              context.read<TransactionTypeCubit>().selectType(selectedItem!);
            },
          ),
        ),
        FormRowItem(
          isMandatory: true,
          title: LocaleKeys.recipient,
          inputWidget: TextInputBox(
            placeholder: LocaleKeys.enterRecipientAddress,
            onChanged: (result) {},
          ),
        ),
        FormRowItem(
          title: LocaleKeys.memo,
          inputWidget: TextInputBox(
            placeholder: LocaleKeys.addNote,
            onChanged: (result) {},
            maxLength: 64,
          ),
        ),
        FormRowItem(
          title: LocaleKeys.stake,
          isMandatory: true,
          inputWidget: TextInputBox(
            inputFilter: InputFilter.numbersWithDecimal,
            placeholder: LocaleKeys.enterStakeAmount,
            onChanged: (result) {},
            suffix: Text(
              'PAC',
              style: TextStyle(
                color: AppTheme.of(context).extension<DarkPallet>()!.contrast,
              ),
            ),
          ),
        ),
        FormRowItem(
          title: LocaleKeys.fee,
          inputWidget: TextInputBox(
            inputFilter: InputFilter.numbersWithDecimal,
            placeholder: LocaleKeys.enterFee,
            onChanged: (result) {},
            suffix:Text(
              'PAC',
              style: TextStyle(
                color: AppTheme.of(context).extension<DarkPallet>()!.contrast,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
