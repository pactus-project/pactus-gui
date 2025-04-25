import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:pactus_gui/src/data/models/generated/blockchain.pbgrpc.dart';
import 'package:pactus_gui/src/data/services/base_grpc_service.dart';

class BlockchainService with BaseGrpcService<GetBlockchainInfoResponse> {
  BlockchainService();

  @override
  Future<GetBlockchainInfoResponse> service() async {
    final request = GetBlockchainInfoRequest();
    final result = await BlockchainClient(
      GetIt.I<ClientChannel>(),
    ).getBlockchainInfo(request);
    return result;
  }
}
