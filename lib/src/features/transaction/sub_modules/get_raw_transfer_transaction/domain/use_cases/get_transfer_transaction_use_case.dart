import 'package:dartz/dartz.dart';
import 'package:pactus_gui/src/data/data_sources/remote_data_state.dart';
import 'package:pactus_gui/src/data/models/error_response_model.dart';
import 'package:pactus_gui/src/data/use_cases/use_case.dart';
import 'package:pactus_gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/data/params/transfer_transaction_params.dart';
import 'package:pactus_gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/domain/entities/transfer_transaction_entity.dart';
import 'package:pactus_gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/domain/repositories/transfer_transaction_repository.dart';

class GetTransferTransactionUseCase
    implements
        FutureUseCase<
            Either<RemoteDataState<ErrorResponseModel>,
                RemoteDataState<TransferTransactionEntity>>,
            TransferTransactionParams> {
  GetTransferTransactionUseCase(this._repository);
  final TransferTransactionRepository _repository;

  @override
  Future<
      Either<RemoteDataState<ErrorResponseModel>,
          RemoteDataState<TransferTransactionEntity>>> call({
    TransferTransactionParams? params,
  }) async {
    return _repository.getRawTransferTransaction(params!);
  }
}
