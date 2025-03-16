import 'package:dartz/dartz.dart';
import 'package:gui/src/data/data_sources/remote_data_state.dart';
import 'package:gui/src/data/models/error_response_model.dart';
import 'package:gui/src/features/blockchain_get_info/data/data_sources/blockchain_remote_data_source.dart';
import 'package:gui/src/features/blockchain_get_info/data/mappers/blockchain_info_mapper.dart';
import 'package:gui/src/features/blockchain_get_info/domain/entities/blockchain_info_entity.dart';
import 'package:gui/src/features/blockchain_get_info/domain/repositories/blockchain_repository.dart';

class BlockchainRepositoryImpl implements BlockchainRepository {
  BlockchainRepositoryImpl(this._remoteDataSource);
  final BlockchainRemoteDataSource _remoteDataSource;

  @override
  Future<
      Either<RemoteDataState<ErrorResponseModel>,
          RemoteDataState<BlockchainInfoEntity>>> getBlockchainInfo({
    void params,
  }) async {
    try {
      final model = await _remoteDataSource.getBlockchainInfo();
      final entity = BlockchainInfoMapper().toEntity(model);
      return Right(RemoteDataState.success(remoteData: entity));
    } on Exception catch (e) {
      return Left(RemoteDataState.failed(error: e.toString()));
    }
  }
}
