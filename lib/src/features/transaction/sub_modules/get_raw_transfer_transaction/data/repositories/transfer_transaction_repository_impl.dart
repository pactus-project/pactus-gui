import 'package:dartz/dartz.dart';
import 'package:pactus_gui/src/data/data_sources/remote_data_state.dart';
import 'package:pactus_gui/src/data/models/error_response_model.dart';
import 'package:pactus_gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/data/data_sources/transfer_transaction_remote_data_source.dart';
import 'package:pactus_gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/data/mappers/transfer_transaction_mapper.dart';
import 'package:pactus_gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/data/params/transfer_transaction_params.dart';
import 'package:pactus_gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/domain/entities/transfer_transaction_entity.dart';
import 'package:pactus_gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/domain/repositories/transfer_transaction_repository.dart';

class TransferTransactionRepositoryImpl with TransferTransactionRepository {
  TransferTransactionRepositoryImpl(this._dataSource);

  final TransferTransactionRemoteDataSource _dataSource;

  @override
  Future<
          Either<RemoteDataState<ErrorResponseModel>,
              RemoteDataState<TransferTransactionEntity>>>
      getRawTransferTransaction(TransferTransactionParams params) async {
    try {
      final model = await _dataSource.getRawTransferTransaction(params);
      final entity = TransferTransactionMapper().toEntity(model);
      return Right(RemoteDataState.success(remoteData: entity));
    } on Exception catch (e) {
      return Left(RemoteDataState.failed(error: e.toString()));
    }
  }
}
