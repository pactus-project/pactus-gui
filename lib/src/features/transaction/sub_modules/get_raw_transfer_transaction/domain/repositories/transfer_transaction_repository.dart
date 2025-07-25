import 'package:dartz/dartz.dart';
import 'package:gui/src/data/data_sources/remote_data_state.dart';
import 'package:gui/src/data/models/error_response_model.dart';
import 'package:gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/data/params/transfer_transaction_params.dart';
import 'package:gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/domain/entities/transfer_transaction_entity.dart';

mixin TransferTransactionRepository {
  Future<
          Either<RemoteDataState<ErrorResponseModel>,
              RemoteDataState<TransferTransactionEntity>>>
      getRawTransferTransaction(TransferTransactionParams params);
}
