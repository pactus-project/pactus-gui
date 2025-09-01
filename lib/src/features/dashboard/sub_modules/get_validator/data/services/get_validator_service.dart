import 'dart:async';

import 'package:dartz/dartz.dart' show Either;
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:pactus_gui/src/core/utils/error_handeling/failure_model.dart'
    show Failure;
import 'package:pactus_gui/src/core/utils/error_handeling/safe_grpc_call.dart'
    show SafeGrpcCall;
import 'package:pactus_gui/src/data/models/generated/blockchain.pbgrpc.dart';
import 'package:pactus_gui/src/data/services/base_grpc_service.dart';

class GetValidatorService
    extends
        BaseGrpcWithParamsService<
          GetValidatorRequest,
          Either<Failure, GetValidatorResponse>
        > {
  @override
  Future<Either<Failure, GetValidatorResponse>> service(
    GetValidatorRequest params,
  ) async {
    final result = SafeGrpcCall.call(
      () => BlockchainClient(GetIt.I<ClientChannel>()).getValidator(params),
    );
    return result;
  }
}
