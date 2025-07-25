import 'package:dartz/dartz.dart';
import 'package:pactus_gui/src/data/data_sources/remote_data_state.dart';
import 'package:pactus_gui/src/data/models/error_response_model.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/blockchain_get_info/domain/entities/blockchain_info_entity.dart';

mixin BlockchainRepository {
  Future<
    Either<
      RemoteDataState<ErrorResponseModel>,
      RemoteDataState<BlockchainInfoEntity>
    >
  >
  getBlockchainInfo({void params});
}
