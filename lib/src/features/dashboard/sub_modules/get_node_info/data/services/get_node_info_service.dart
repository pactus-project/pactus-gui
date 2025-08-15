import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:pactus_gui/src/core/constants/app_constants.dart'
    show AppConstants;
import 'package:pactus_gui/src/data/models/generated/network.pbgrpc.dart';
import 'package:pactus_gui/src/data/services/base_grpc_service.dart';

class GetNodeInfoService
    extends
        BaseGrpcWithParamsService<GetNodeInfoRequest, GetNodeInfoResponse> {
  @override
  Future<GetNodeInfoResponse> service(GetNodeInfoRequest params) async {
    final result = await NetworkClient(
      GetIt.I<ClientChannel>(),
      options: AppConstants.callOptions,
    ).getNodeInfo(params);
    return result;
  }
}
