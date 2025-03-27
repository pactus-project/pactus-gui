import 'package:dartz/dartz.dart';
import 'package:gui/src/data/data_sources/remote_data_state.dart';
import 'package:gui/src/data/models/error_response_model.dart';
import 'package:gui/src/features/blockchain_get_info/domain/entities/blockchain_info_entity.dart';

mixin BlockchainRepository {
  Future<
      Either<RemoteDataState<ErrorResponseModel>,
          RemoteDataState<BlockchainInfoEntity>>> getBlockchainInfo({
    void params,
  });
}
