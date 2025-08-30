import 'package:dartz/dartz.dart';
import 'package:pactus_gui/src/core/utils/error_handeling/failure_model.dart';
import 'package:pactus_gui/src/data/models/generated/blockchain.pbgrpc.dart'
    show GetValidatorRequest;
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/data/mappers/get_validator_mapper.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/data/services/get_validator_service.dart'
    show GetValidatorService;
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/domain/entities/get_validator_entity.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/domain/repositories/get_validator_repository.dart';

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
