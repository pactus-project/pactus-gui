import 'dart:async';

import 'package:dartz/dartz.dart' show Either;
import 'package:flutter_pactus_grpc/exports/blockchain.dart'
    show BlockchainClient, GetBlockchainInfoRequest, GetBlockchainInfoResponse;
import 'package:get_it/get_it.dart';
// ignore: depend_on_referenced_packages
import 'package:grpc/grpc.dart' show ClientChannel;
import 'package:pactus_gui/src/core/utils/error_handeling/failure_model.dart'
    show Failure;
import 'package:pactus_gui/src/core/utils/error_handeling/safe_grpc_call.dart'
    show SafeGrpcCall;
import 'package:pactus_gui/src/data/services/base_grpc_service.dart';

class BlockchainService
    extends BaseGrpcService<Either<Failure, GetBlockchainInfoResponse>> {
  @override
  Future<Either<Failure, GetBlockchainInfoResponse>> service() async {
    final request = GetBlockchainInfoRequest();
    final result = SafeGrpcCall.call(
      () =>
          BlockchainClient(GetIt.I<ClientChannel>()).getBlockchainInfo(request),
    );
    return result;
  }
}
