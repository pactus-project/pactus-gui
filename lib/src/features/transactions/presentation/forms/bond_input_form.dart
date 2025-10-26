import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/common/widgets/form_row_item.dart'
    show FormRowItem;
import 'package:pactus_gui/src/core/common/widgets/text_input.dart' show TextInputBox;
import 'package:pactus_gui/src/core/enums/app_enums.dart' show TransactionType;
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/features/transactions/presentation/blocs/transaction_type_cubit.dart'
    show TransactionTypeCubit;
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transaction_type_selector.dart'
    show TransactionTypeSelector;

class BondInputForm extends StatelessWidget {
  const BondInputForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
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
          title: LocaleKeys.memo,
          inputWidget: TextInputBox(
            placeholder: LocaleKeys.addNote,
            onChanged: (result) {},
            maxLength: 64,
          ),
        ),
      ],
    );
  }
}
