import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:pactus_gui/src/core/enums/app_enums.dart';
import 'package:pactus_gui/src/features/transactions/presentation/blocs/transaction_type_cubit.dart';
import 'package:pactus_gui/src/features/transactions/presentation/views/confirmation/bond_confirmation.dart'
    show BondConfirmation;
import 'package:pactus_gui/src/features/transactions/presentation/views/confirmation/transfer_confirmation.dart'
    show TransferConfirmation;
import 'package:pactus_gui/src/features/transactions/presentation/views/confirmation/unbond_confirmation.dart'
    show UnBondConfirmation;
import 'package:pactus_gui/src/features/transactions/presentation/views/confirmation/withdraw_confirmation.dart'
    show WithdrawConfirmation;

class ConfirmTransaction extends StatelessWidget {
  const ConfirmTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionTypeCubit, TransactionType>(
      builder: (context, state) {
        return switch (state) {
          TransactionType.unbond => UnBondConfirmation(),
          TransactionType.bond => BondConfirmation(),
          TransactionType.transfer => TransferConfirmation(),
          TransactionType.withdraw => WithdrawConfirmation(),
        };
      },
    );
  }
}
