import 'package:dartz/dartz.dart';
import 'package:flutter_pactus_grpc/exports/network.dart'
    show GetNodeInfoRequest;
import 'package:pactus_gui/src/core/utils/error_handeling/failure_model.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/domain/entities/get_node_info_entity.dart';

abstract class GetNodeInfoRepository {
  Future<Either<Failure, GetNodeInfoEntity>> getNodeInfo(
    GetNodeInfoRequest params,
  );
}
