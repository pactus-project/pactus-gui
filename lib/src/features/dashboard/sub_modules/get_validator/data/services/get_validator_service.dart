import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:gui/src/data/models/generated/blockchain.pbgrpc.dart';
import 'package:gui/src/data/services/base_grpc_service.dart';

class GetValidatorService with BaseGrpcService<GetValidatorResponse> {
  GetValidatorService();

  @override
  Future<GetValidatorResponse> service() async {
    final request = GetValidatorRequest();
    final result = await BlockchainClient(
      GetIt.I<ClientChannel>(),
    ).getValidator(request);
    return result;
  }
}
