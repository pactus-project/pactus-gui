import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart' show Gap;
import 'package:pactus_gui/src/core/enums/app_enums.dart' show TransactionType;
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui/src/features/transactions/presentation/blocs/transaction_type_cubit.dart'
    show TransactionTypeCubit;
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transaction_type_selector.dart'
    show TransactionTypeSelector;
import 'package:pactus_gui_widgetbook/app_styles.dart'
    show AppTheme, DarkPallet;

class TransferInputForm extends StatelessWidget {
  const TransferInputForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.tr(TransactionType.transfer.title),
          style: AppTheme.of(context).typography.caption!.copyWith(
            color: AppTheme.of(context).extension<DarkPallet>()!.contrast,
          ),
        ),
        Gap(32),
        TransactionTypeSelector(
          initialValue: TransactionType.transfer,
          onChanged: (selectedItem) {
            context.read<TransactionTypeCubit>().selectType(selectedItem!);
          },
        ),
      ],
    );
  }
}
