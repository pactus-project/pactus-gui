import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart' show GetIt;
import 'package:pactus_gui/src/core/utils/error_handeling/failure_model.dart';
import 'package:pactus_gui/src/data/models/generated/network.pbgrpc.dart';
import 'package:pactus_gui/src/data/models/node_details.dart' show NodeDetails;
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/data/mappers/get_node_info_mapper.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/data/services/get_node_info_service.dart'
    show GetNodeInfoService;
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/domain/entities/get_node_info_entity.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/domain/repositories/get_node_info_repository.dart';

class GetNodeInfoRepositoryImpl implements GetNodeInfoRepository {
  GetNodeInfoRepositoryImpl(this._service);
  final GetNodeInfoService _service;

  @override
  Future<Either<Failure, GetNodeInfoEntity>> getNodeInfo(
    GetNodeInfoRequest request,
  ) async {
    final result = await _service.service(request);
    final nodeDetails = GetIt.instance<NodeDetails>();
    return result.map(
      (res) => GetNodeInfoMapper.toEntity(
        model: res,
        isEncryptedWallet: nodeDetails.isEncryptedNode ?? false,
        networkName: nodeDetails.networkName ?? '-',
        workingDir: nodeDetails.nodeWorkingDirectory ?? '-',
      ),
    );
  }
}
