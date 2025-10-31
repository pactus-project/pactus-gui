import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:pactus_gui/src/core/enums/app_enums.dart';
import 'package:pactus_gui/src/features/transactions/presentation/blocs/transaction_type_cubit.dart';
import 'package:pactus_gui/src/features/transactions/presentation/views/initialization/forms/bond_input_form.dart'
    show BondInputForm;
import 'package:pactus_gui/src/features/transactions/presentation/views/initialization/forms/transfer_input_form.dart'
    show TransferInputForm;
import 'package:pactus_gui/src/features/transactions/presentation/views/initialization/forms/unbond_input_form.dart'
    show UnBondInputForm;
import 'package:pactus_gui/src/features/transactions/presentation/views/initialization/forms/withdraw_input_form.dart'
    show WithdrawInputForm;

class InitialTransaction extends StatelessWidget {
  const InitialTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionTypeCubit, TransactionType>(
      builder: (context, state) {
        return switch (state) {
          TransactionType.unbond => UnBondInputForm(),
          TransactionType.bond => BondInputForm(),
          TransactionType.transfer => TransferInputForm(),
          TransactionType.withdraw => WithdrawInputForm(),
        };
      },
    );
  }
}
