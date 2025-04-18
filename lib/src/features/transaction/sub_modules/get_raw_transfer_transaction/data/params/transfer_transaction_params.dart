import 'package:gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/presentation/bloc/get_transfer_bloc.dart';

class TransferTransactionParams {
  TransferTransactionParams({
    this.lockTime,
    required this.sender,
    required this.receiver,
    required this.amount,
    this.fee,
    required this.memo,
  });
  final int? lockTime;
  final String sender;
  final String receiver;
  final int amount;
  final int? fee;
  final String memo;
}
