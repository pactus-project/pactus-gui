import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/common/widgets/form_row_item.dart';
import 'package:pactus_gui/src/core/common/widgets/text_input.dart'
    show TextInputBox;
import 'package:pactus_gui/src/core/enums/app_enums.dart'
    show AddressType, TransactionType;
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/daemon_manager_bloc.dart'
    show DaemonManagerBloc;
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart'
    show LocaleKeys;
import 'package:pactus_gui/src/features/transactions/presentation/blocs/transaction_type_cubit.dart'
    show TransactionTypeCubit;
import 'package:pactus_gui/src/features/transactions/presentation/widgets/address_combo_box.dart'
    show AddressComboBox;
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transaction_type_selector.dart'
    show TransactionTypeSelector;

class TransferInputForm extends StatelessWidget {
  const TransferInputForm({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DaemonManagerBloc>(create: (_) => DaemonManagerBloc()),
      ],
      child: Column(
        children: [
          FormRowItem(
            title: LocaleKeys.transaction_type,
            inputWidget: TransactionTypeSelector(
              initialValue: TransactionType.transfer,
              onChanged: (selectedItem) {
                context.read<TransactionTypeCubit>().selectType(selectedItem!);
              },
            ),
          ),
          FormRowItem(
            title: LocaleKeys.sender,
            inputWidget: AddressComboBox(
              addressType: AddressType.wallet,
              onChanged: (result) {},
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
        ],
      ),
    );
  }
}
