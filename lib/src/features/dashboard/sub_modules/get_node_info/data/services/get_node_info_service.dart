import 'dart:async';

import 'package:dartz/dartz.dart' show Either;
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:pactus_gui/src/core/utils/error_handeling/failure_model.dart'
    show Failure;
import 'package:pactus_gui/src/core/utils/error_handeling/safe_grpc_call.dart'
    show SafeGrpcCall;
import 'package:pactus_gui/src/data/models/generated/network.pbgrpc.dart';
import 'package:pactus_gui/src/data/services/base_grpc_service.dart';

class GetNodeInfoService
    extends
        BaseGrpcWithParamsService<
          GetNodeInfoRequest,
          Either<Failure, GetNodeInfoResponse>
        > {
  @override
  Future<Either<Failure, GetNodeInfoResponse>> service(
    GetNodeInfoRequest params,
  ) async {
    final result = SafeGrpcCall.call(
      () => NetworkClient(GetIt.I<ClientChannel>()).getNodeInfo(params),
    );
    return result;
  }
}
