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
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/features/transactions/presentation/blocs/form_validations/bond_form_validation.dart'
    show BondFormValidation;
import 'package:pactus_gui/src/features/transactions/presentation/blocs/transaction_type_cubit.dart'
    show TransactionTypeCubit;
import 'package:pactus_gui/src/features/transactions/presentation/widgets/address_combo_box.dart'
    show AddressComboBox;
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transaction_type_selector.dart'
    show TransactionTypeSelector;
import 'package:pactus_gui_widgetbook/app_styles.dart'
    show AppTheme, DarkPallet;

class BondInputForm extends StatelessWidget {
  const BondInputForm({super.key});
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
              initialValue: TransactionType.bond,
              onChanged: (selectedItem) {
                context.read<TransactionTypeCubit>().selectType(selectedItem!);
              },
            ),
          ),
          FormRowItem(
            title: LocaleKeys.sender,
            inputWidget: AddressComboBox(
              addressType: AddressType.wallet,
              onChanged: (result) {
                context.read<BondFormValidation>().setSender(result!.address);
              },
            ),
          ),
          FormRowItem(
            title: LocaleKeys.validatorAddress,
            isMandatory: true,
            inputWidget: TextInputBox(
              placeholder: LocaleKeys.enterValidatorAddress,
              onChanged: (result) {
                context.read<BondFormValidation>().setValidatorAddress(result);
              },
            ),
          ),
          FormRowItem(
            title: LocaleKeys.validatorPublicKey,
            inputWidget: TextInputBox(
              placeholder: LocaleKeys.validatorPublicKeyDescription,
              onChanged: (result) {
                context.read<BondFormValidation>().setValidatorPublicKey(
                  result,
                );
              },
            ),
          ),
          FormRowItem(
            title: LocaleKeys.memo,
            inputWidget: TextInputBox(
              placeholder: LocaleKeys.addNote,
              onChanged: (result) {
                context.read<BondFormValidation>().setMemo(result);
              },
              maxLength: 64,
            ),
          ),
          FormRowItem(
            title: LocaleKeys.amount,
            isMandatory: true,
            inputWidget: TextInputBox(
              inputFilter: InputFilter.numbersWithDecimal,
              placeholder: LocaleKeys.enterAmount,
              onChanged: (result) {
                context.read<BondFormValidation>().setAmount(result);
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
                context.read<BondFormValidation>().setFee(result);
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
