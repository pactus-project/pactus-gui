import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/common/widgets/form_row_item.dart'
    show FormRowItem;
import 'package:pactus_gui/src/core/common/widgets/text_input.dart'
    show TextInputBox;
import 'package:pactus_gui/src/core/enums/app_enums.dart'
    show AddressType, TransactionType;
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/daemon_manager_bloc.dart'
    show DaemonManagerBloc;
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart'
    show LocaleKeys;
import 'package:pactus_gui/src/features/transactions/presentation/blocs/form_validations/unbond_form_validation.dart'
    show UnBondFormValidation;
import 'package:pactus_gui/src/features/transactions/presentation/blocs/transaction_type_cubit.dart'
    show TransactionTypeCubit;
import 'package:pactus_gui/src/features/transactions/presentation/widgets/address_combo_box.dart'
    show AddressComboBox;
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transaction_type_selector.dart'
    show TransactionTypeSelector;

class UnBondInputForm extends StatelessWidget {
  const UnBondInputForm({super.key});
  @override
  Widget build(BuildContext context) {
    final formData = context.read<UnBondFormValidation>().state;

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
              initialValue: TransactionType.unbond,
              onChanged: (selectedItem) {
                context.read<TransactionTypeCubit>().selectType(selectedItem!);
              },
            ),
          ),
          FormRowItem(
            title: LocaleKeys.validator,
            inputWidget: AddressComboBox(
              initialValue: formData.validator,
              addressType: AddressType.validator,
              onChanged: (result) {
                context.read<UnBondFormValidation>().setValidator(
                  result!.address,
                );
              },
            ),
          ),
          FormRowItem(
            title: LocaleKeys.memo,
            inputWidget: TextInputBox(
              initialValue: formData.memo ?? '',
              placeholder: LocaleKeys.addNote,
              onChanged: (result) {
                context.read<UnBondFormValidation>().setMemo(result);
              },
              maxLength: 64,
            ),
          ),
        ],
      ),
    );
  }
}
