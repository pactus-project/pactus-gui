import 'package:dartz/dartz.dart';
import 'package:pactus_gui/src/data/data_sources/remote_data_state.dart';
import 'package:pactus_gui/src/data/models/error_response_model.dart';
import 'package:pactus_gui/src/data/models/generated/network.pbgrpc.dart'
    show GetNodeInfoRequest;
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/domain/entities/get_node_info_entity.dart';

mixin GetNodeInfoRepository {
  Future<
    Either<
      RemoteDataState<ErrorResponseModel>,
      RemoteDataState<GetNodeInfoEntity>
    >
  >
  getNodeInfo({required GetNodeInfoRequest params});
}
