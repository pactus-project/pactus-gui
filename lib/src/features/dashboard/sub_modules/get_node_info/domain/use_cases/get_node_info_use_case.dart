import 'package:dartz/dartz.dart';
import 'package:pactus_gui/src/data/data_sources/remote_data_state.dart';
import 'package:pactus_gui/src/data/models/error_response_model.dart';
import 'package:pactus_gui/src/data/models/generated/network.pbgrpc.dart'
    show GetNodeInfoRequest;
import 'package:pactus_gui/src/data/use_cases/use_case.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/domain/entities/get_node_info_entity.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/domain/repositories/get_node_info_repository.dart';

class GetNodeInfoUseCase
    implements
        BaseUseCaseWithParams<
          Either<
            RemoteDataState<ErrorResponseModel>,
            RemoteDataState<GetNodeInfoEntity>
          >,
          GetNodeInfoRequest
        > {
  GetNodeInfoUseCase(this._repository);
  final GetNodeInfoRepository _repository;

  @override
  Future<
    Either<
      RemoteDataState<ErrorResponseModel>,
      RemoteDataState<GetNodeInfoEntity>
    >
  >
  call({required GetNodeInfoRequest params}) async {
    return _repository.getNodeInfo(params: params);
  }
}
