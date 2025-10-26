import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:pactus_gui/src/core/enums/app_enums.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui/src/features/transactions/presentation/blocs/transaction_step_cubit.dart'
    show TransactionStepCubit;
import 'package:pactus_gui/src/features/transactions/presentation/blocs/transaction_type_cubit.dart';
import 'package:pactus_gui/src/features/transactions/presentation/forms/bond_input_form.dart'
    show BondInputForm;
import 'package:pactus_gui/src/features/transactions/presentation/forms/transfer_input_form.dart'
    show TransferInputForm;
import 'package:pactus_gui/src/features/transactions/presentation/forms/unbond_input_form.dart'
    show UnBondInputForm;
import 'package:pactus_gui/src/features/transactions/presentation/forms/withdraw_input_form.dart'
    show WithdrawInputForm;
import 'package:pactus_gui_widgetbook/app_styles.dart';

class StepViewerWidget extends StatelessWidget {
  const StepViewerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        width: 650,
        decoration: BoxDecoration(
          color: AppTheme.of(context).extension<TransactionsPallet>()!.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(32),
        child: BlocBuilder<TransactionStepCubit, TransactionStep>(
          builder: (context, state) {
            return switch (state) {
              TransactionStep.transactionForm =>
                BlocBuilder<TransactionTypeCubit, TransactionType>(
                  builder: (context, state) {
                    return switch (state) {
                      TransactionType.unbond => UnBondInputForm(),
                      TransactionType.bond => BondInputForm(),
                      TransactionType.transfer => TransferInputForm(),
                      TransactionType.withdraw => WithdrawInputForm(),
                    };
                  },
                ),
              _ => Text(
                context.tr(state.title),
                style: TextStyle(
                  color: AppTheme.of(context).extension<DarkPallet>()!.contrast,
                ),
              ),
            };
          },
        ),
      ),
    );
  }
}
