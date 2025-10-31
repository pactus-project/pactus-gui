import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:pactus_gui/src/core/enums/app_enums.dart' show TransactionType;
import 'package:pactus_gui/src/features/transactions/presentation/blocs/transaction_type_cubit.dart'
    show TransactionTypeCubit;
import 'package:pactus_gui/src/features/transactions/presentation/views/result/bond_result.dart'
    show BondResult;
import 'package:pactus_gui/src/features/transactions/presentation/views/result/transfer_result.dart'
    show TransferResult;
import 'package:pactus_gui/src/features/transactions/presentation/views/result/unbond_result.dart'
    show UnBondResult;
import 'package:pactus_gui/src/features/transactions/presentation/views/result/withdraw_result.dart'
    show WithdrawResult;

class ResultTransaction extends StatelessWidget {
  const ResultTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionTypeCubit, TransactionType>(
      builder: (context, state) {
        return switch (state) {
          TransactionType.unbond => UnBondResult(),
          TransactionType.bond => BondResult(),
          TransactionType.transfer => TransferResult(),
          TransactionType.withdraw => WithdrawResult(),
        };
      },
    );
  }
}
