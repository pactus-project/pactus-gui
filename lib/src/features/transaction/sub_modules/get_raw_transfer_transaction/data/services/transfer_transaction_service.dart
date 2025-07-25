import 'dart:async';
import 'package:fixnum/fixnum.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:pactus_gui/src/data/models/generated/transaction.pbgrpc.dart';
import 'package:pactus_gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/data/params/transfer_transaction_params.dart';

class TransferTransactionService {
  Future<GetRawTransactionResponse> getRawTransferTransaction(
    TransferTransactionParams params,
  ) async {
    final request = GetRawTransferTransactionRequest(
      lockTime: params.lockTime,
      sender: params.sender,
      receiver: params.receiver,
      amount: Int64(params.amount),
      fee: params.fee != null ? Int64(params.fee!) : null,
      memo: params.memo,
    );
    return TransactionClient(
      GetIt.I<ClientChannel>(),
    ).getRawTransferTransaction(request);
  }
}
