import 'package:gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/data/mappers/transfer_transaction_mapper.dart';
import 'package:gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/data/models/transfer_transaction_model.dart';
import 'package:gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/data/params/transfer_transaction_params.dart';
import 'package:gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/data/services/transfer_transaction_service.dart';

abstract class TransferTransactionRemoteDataSource {
  Future<TransferTransactionModel> getRawTransferTransaction(
    TransferTransactionParams params,
  );
}

class TransferTransactionRemoteDataSourceImpl
    implements TransferTransactionRemoteDataSource {
  TransferTransactionRemoteDataSourceImpl(this._service);

  final TransferTransactionService _service;

  @override
  Future<TransferTransactionModel> getRawTransferTransaction(
    TransferTransactionParams params,
  ) async {
    final response = await _service.getRawTransferTransaction(params);
    return TransferTransactionMapper().fromResponse(response);
  }
}
