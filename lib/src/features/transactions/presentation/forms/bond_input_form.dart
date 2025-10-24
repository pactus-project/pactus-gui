import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/enums/app_enums.dart' show TransactionType;
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui/src/features/transactions/presentation/blocs/transaction_type_cubit.dart'
    show TransactionTypeCubit;
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transaction_type_selector.dart'
    show TransactionTypeSelector;
import 'package:pactus_gui_widgetbook/app_styles.dart'
    show AppTheme, DarkPallet;

class BondInputForm extends StatelessWidget {
  const BondInputForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                context.tr(LocaleKeys.transaction_type),
                style: TextStyle(
                  color: AppTheme.of(context).extension<DarkPallet>()!.contrast,
                ),
                maxLines: 2,
                overflow: TextOverflow.fade,
              ),
            ),
            TransactionTypeSelector(
              initialValue: TransactionType.bond,
              onChanged: (selectedItem) {
                context.read<TransactionTypeCubit>().selectType(selectedItem!);
              },
            ),
          ],
        ),
      ],
    );
  }
}
