import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:pactus_gui/src/core/enums/app_enums.dart';
import 'package:pactus_gui/src/features/transactions/presentation/blocs/transaction_step_cubit.dart'
    show TransactionStepCubit;
import 'package:pactus_gui/src/features/transactions/presentation/views/confirmation/confirm_transaction.dart'
    show ConfirmTransaction;
import 'package:pactus_gui/src/features/transactions/presentation/views/initialization/initial_transaction.dart'
    show InitialTransaction;
import 'package:pactus_gui/src/features/transactions/presentation/views/result/result_transaction.dart'
    show ResultTransaction;
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
              TransactionStep.transactionForm => InitialTransaction(),
              TransactionStep.confirmation => ConfirmTransaction(),
              TransactionStep.result => ResultTransaction(),
            };
          },
        ),
      ),
    );
  }
}
