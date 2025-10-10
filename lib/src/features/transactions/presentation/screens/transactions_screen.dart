import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:pactus_gui/src/core/constants/app_constants.dart'
    show AppConstants;
import 'package:pactus_gui/src/core/enums/app_enums.dart';
import 'package:pactus_gui/src/features/transactions/presentation/blocs/transaction_type_cubit.dart';
import 'package:pactus_gui/src/features/transactions/presentation/forms/bond_input_form.dart'
    show BondInputForm;
import 'package:pactus_gui/src/features/transactions/presentation/forms/transfer_input_form.dart'
    show TransferInputForm;
import 'package:pactus_gui/src/features/transactions/presentation/forms/unbond_input_form.dart'
    show UnbondInputForm;
import 'package:pactus_gui/src/features/transactions/presentation/forms/withdraw_input_form.dart'
    show WithdrawInputForm;
import 'package:pactus_gui_widgetbook/app_styles.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bgTransactionBoxColor =
        AppTheme.of(context).brightness == Brightness.light
        ? AppConstants.bgTransactionBoxLight
        : AppConstants.bgTransactionBoxDark;
    final transactionBoxColor =
        AppTheme.of(context).brightness == Brightness.light
        ? AppConstants.transactionBoxLight
        : AppConstants.transactionBoxDark;

    return ColoredBox(
      color: bgTransactionBoxColor,
      child: UnconstrainedBox(
        child: Container(
          width: 553,
          decoration: BoxDecoration(
            color: transactionBoxColor,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(32),
          child: BlocBuilder<TransactionTypeCubit, TransactionType>(
            builder: (context, state) {
              return switch (state) {
                TransactionType.unbond => UnbondInputForm(),
                TransactionType.bond => BondInputForm(),
                TransactionType.transfer => TransferInputForm(),
                TransactionType.withdraw => WithdrawInputForm(),
              };
            },
          ),
        ),
      ),
    );
  }
}
