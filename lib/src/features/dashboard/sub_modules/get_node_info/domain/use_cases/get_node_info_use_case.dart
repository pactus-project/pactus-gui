import 'package:dartz/dartz.dart';
import 'package:flutter_pactus_grpc/exports/network.dart'
    show GetNodeInfoRequest;
import 'package:pactus_gui/src/core/utils/error_handeling/failure_model.dart';
import 'package:pactus_gui/src/data/use_cases/use_case.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/domain/entities/get_node_info_entity.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/domain/repositories/get_node_info_repository.dart';

class GetNodeInfoUseCase
    implements
        BaseUseCaseWithParams<
          Either<Failure, GetNodeInfoEntity>,
          GetNodeInfoRequest
        > {
  GetNodeInfoUseCase(this._repository);
  final GetNodeInfoRepository _repository;

  @override
  Future<Either<Failure, GetNodeInfoEntity>> call({
    required GetNodeInfoRequest params,
  }) async {
    return _repository.getNodeInfo(params);
  }
}
