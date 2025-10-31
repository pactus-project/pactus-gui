import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/common/widgets/form_row_item.dart'
    show FormRowItem;
import 'package:pactus_gui/src/core/common/widgets/text_input.dart'
    show TextInputBox;
import 'package:pactus_gui/src/core/enums/app_enums.dart'
    show AddressType, InputFilter, TransactionType;
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/daemon_manager_bloc.dart'
    show DaemonManagerBloc;
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart'
    show LocaleKeys;
import 'package:pactus_gui/src/features/transactions/presentation/blocs/form_validations/withdraw_form_validator.dart'
    show WithdrawFormValidation;
import 'package:pactus_gui/src/features/transactions/presentation/blocs/transaction_type_cubit.dart'
    show TransactionTypeCubit;
import 'package:pactus_gui/src/features/transactions/presentation/widgets/address_combo_box.dart'
    show AddressComboBox;
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transaction_type_selector.dart'
    show TransactionTypeSelector;
import 'package:pactus_gui_widgetbook/app_styles.dart';

class WithdrawInputForm extends StatelessWidget {
  const WithdrawInputForm({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DaemonManagerBloc>(create: (_) => DaemonManagerBloc()),
      ],
      child: Column(
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
            title: LocaleKeys.validator,
            inputWidget: AddressComboBox(
              addressType: AddressType.validator,
              onChanged: (result) {
                context.read<WithdrawFormValidation>().setValidator(
                  result!.address,
                );
              },
            ),
          ),
          FormRowItem(
            isMandatory: true,
            title: LocaleKeys.recipient,
            inputWidget: TextInputBox(
              placeholder: LocaleKeys.enterRecipientAddress,
              onChanged: (result) {
                context.read<WithdrawFormValidation>().setRecipient(result);
              },
            ),
          ),
          FormRowItem(
            title: LocaleKeys.memo,
            inputWidget: TextInputBox(
              placeholder: LocaleKeys.addNote,
              onChanged: (result) {
                context.read<WithdrawFormValidation>().setMemo(result);
              },
              maxLength: 64,
            ),
          ),
          FormRowItem(
            title: LocaleKeys.stake,
            isMandatory: true,
            inputWidget: TextInputBox(
              inputFilter: InputFilter.numbersWithDecimal,
              placeholder: LocaleKeys.enterStakeAmount,
              onChanged: (result) {
                context.read<WithdrawFormValidation>().setStake(result);
              },
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
              onChanged: (result) {
                context.read<WithdrawFormValidation>().setFee(result);
              },
              suffix: Text(
                'PAC',
                style: TextStyle(
                  color: AppTheme.of(context).extension<DarkPallet>()!.contrast,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
