import 'package:dartz/dartz.dart';
import 'package:pactus_gui/src/core/utils/error_handeling/failure_model.dart';
import 'package:pactus_gui/src/data/models/generated/network.pbgrpc.dart';
 import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/data/mappers/get_node_info_mapper.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/data/services/get_node_info_service.dart'
    show GetNodeInfoService;
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/domain/entities/get_node_info_entity.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/domain/repositories/get_node_info_repository.dart';

// class GetValidatorR
// class GetNodeInfoRepositoryImpl implements GetNodeInfoRepository {
//   GetNodeInfoRepositoryImpl(this._remoteDataSource);
//   final GetNodeInfoRemoteDataSource _remoteDataSource;
//
//   @override
//   Future<
//     Either<
//       Failure,
//       GetNodeInfoEntity
//     >
//   >
//   getNodeInfo({required GetNodeInfoRequest params}) async {
//     try {
//       final responseData = await _remoteDataSource.getNodeInfo(params: params);
//
//       final entity = GetNodeInfoMapper.toEntity(
//         model: responseData,
//         isEncryptedWallet: true,
//         networkName: './networkName',
//         workingDir: './workingDir',
//       );
//       return Right(entity );
//     } on Exception catch (e, s) {
//       printDebug('model: validatorAddress $e , $s');
//
//       return Left(  e  );
//     }
//   }
// }

// class GetNodeInfoRepositoryImpl implements GetNodeInfoRepository {
//   GetNodeInfoRepositoryImpl(this._service);
//   final GetNodeInfoService _service;
//
//   @override
//   Future<Either<Failure, GetNodeInfoResponse>> getValidator(
//       GetNodeInfoRequest request,
//       ) async {
//     final result = await _service.service(request);
//
//     return result.map(GetNodeInfoMapper.toEntity);
//   }
//
//   @override
//   Future<Either<Failure, GetNodeInfoEntity>> getNodeInfo(
//       GetNodeInfoRequest params,
//    ) async {
//     final result = await _service.service(request);
//
//     return result.map(GetNodeInfoMapper.toEntity);
//   }
// }
class GetNodeInfoRepositoryImpl implements GetNodeInfoRepository {
  GetNodeInfoRepositoryImpl(this._service);
  final GetNodeInfoService _service;

  @override
  Future<Either<Failure, GetNodeInfoEntity>> getNodeInfo(
    GetNodeInfoRequest request,
  ) async {
    final result = await _service.service(request);

    return result.map(GetNodeInfoMapper.toEntity);
  }
}
