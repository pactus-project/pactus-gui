import 'package:dartz/dartz.dart';
import 'package:pactus_gui/src/core/utils/methods/print_debug.dart';
import 'package:pactus_gui/src/data/data_sources/remote_data_state.dart';
import 'package:pactus_gui/src/data/models/error_response_model.dart';
import 'package:pactus_gui/src/data/models/generated/network.pbgrpc.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/data/data_sources/get_node_info_remote_data_source.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/data/mappers/get_node_info_mapper.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/domain/entities/get_node_info_entity.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/domain/repositories/get_node_info_repository.dart';

class GetNodeInfoRepositoryImpl implements GetNodeInfoRepository {
  GetNodeInfoRepositoryImpl(this._remoteDataSource);
  final GetNodeInfoRemoteDataSource _remoteDataSource;

  @override
  Future<
    Either<
      RemoteDataState<ErrorResponseModel>,
      RemoteDataState<GetNodeInfoEntity>
    >
  >
  getNodeInfo({required GetNodeInfoRequest params}) async {
    try {
      final responseData = await _remoteDataSource.getNodeInfo(params: params);

      final entity = GetNodeInfoMapper.toEntity(
        model: responseData,
        isEncryptedWallet: true,
        networkName: './networkName',
        workingDir: './workingDir',
      );
      return Right(RemoteDataState.success(remoteData: entity));
    } on Exception catch (e, s) {
      printDebug('model: validatorAddress $e , $s');

      return Left(RemoteDataState.failed(error: e.toString()));
    }
  }
}
