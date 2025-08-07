import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:pactus_gui/src/core/constants/app_constants.dart'
    show AppConstants;
import 'package:pactus_gui/src/data/models/generated/blockchain.pbgrpc.dart';
import 'package:pactus_gui/src/data/services/base_grpc_service.dart';

class GetValidatorService
    extends
        BaseGrpcWithParamsService<GetValidatorRequest, GetValidatorResponse> {
  @override
  Future<GetValidatorResponse> service(GetValidatorRequest params) async {
    final result = await BlockchainClient(
      GetIt.I<ClientChannel>(),
      options: AppConstants.callOptions,
    ).getValidator(params);
    return result;
  }
}
