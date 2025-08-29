import 'package:dartz/dartz.dart';
import 'package:pactus_gui/src/core/utils/error_handeling/failure_model.dart';
import 'package:pactus_gui/src/data/models/generated/blockchain.pbgrpc.dart'
    show GetValidatorRequest;
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/data/mappers/get_validator_mapper.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/data/services/get_validator_service.dart'
    show GetValidatorService;
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/domain/entities/get_validator_entity.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/domain/repositories/get_validator_repository.dart';

// class GetValidatorRepositoryImpl implements GetValidatorRepository {
//   @override
//   Future<Either<Failure, GetValidatorEntity>> getValidator({
//     required GetValidatorRequest params,
//   }) async {
//     try {
//       await Future<void>.delayed(Duration(seconds: 3));
//       print('params: validatorAddress ${params.address}');
//
//       final result = await BlockchainClient(
//         GetIt.I<ClientChannel>(),
//         options: AppConstants.callOptions,
//       ).getValidator(params);
//
//       print('model: validatorAddress ${model.validatorAddress}');
//       print(
//         'model:validatorAvailabilityScore ${model.validatorAvailabilityScore}',
//       );
//       print('model:validatorStack ${model.validatorStack}');
//       final entity = GetValidatorMapper.toEntity(model);
//       return Right(RemoteDataState.success(remoteData: entity));
//     } on Exception catch (e, s) {
//       print('model: validatorAddress ${e} , ${s}');
//
//       return Left(RemoteDataState.failed(error: e.toString()));
//     }
//   }
// }

class GetValidatorRepositoryImpl implements GetValidatorRepository {
  GetValidatorRepositoryImpl(this._service);
  final GetValidatorService _service;

  @override
  Future<Either<Failure, GetValidatorEntity>> getValidator(
    GetValidatorRequest request,
  ) async {
    final result = await _service.service(request);

    return result.map(GetValidatorMapper.toEntity);
  }
}
