import 'dart:async';

import 'package:dartz/dartz.dart' show Either;
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:pactus_gui/src/core/constants/app_constants.dart'
    show AppConstants;
import 'package:pactus_gui/src/core/utils/error_handeling/failure_model.dart'
    show Failure;
import 'package:pactus_gui/src/core/utils/error_handeling/safe_grpc_call.dart'
    show SafeGrpcCall;
import 'package:pactus_gui/src/data/models/generated/blockchain.pbgrpc.dart'
    show BlockchainClient;
import 'package:pactus_gui/src/data/models/generated/network.pbgrpc.dart';
import 'package:pactus_gui/src/data/services/base_grpc_service.dart';
//
// class GetNodeInfoServicea
//     extends BaseGrpcWithParamsService<GetNodeInfoRequest, GetNodeInfoResponse> {
//   @override
//   Future<GetNodeInfoResponse> service(GetNodeInfoRequest params) async {
//     final result = await NetworkClient(
//       GetIt.I<ClientChannel>(),
//       options: AppConstants.callOptions,
//     ).getNodeInfo(params);
//     return result;
//   }
// }

// class GetValidatorService
//     extends
//     BaseGrpcWithParamsService<
//         GetNodeInfoRequest,
//         Either<Failure, GetValidatorResponse>
//     > {
//   @override
//   Future<Either<Failure, GetValidatorResponse>> service(
//       GetNodeInfoRequest params,
//       ) async {
//     final result = SafeGrpcCall.call(
//           () => BlockchainClient(
//         GetIt.I<ClientChannel>(),
//         options: AppConstants.callOptions,
//       ).getValidator(params),
//     );
//     return result;
//   }
// }

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
      () => NetworkClient(
        GetIt.I<ClientChannel>(),
        options: AppConstants.callOptions,
      ).getNodeInfo(params),
    );
    return result;
  }
}
