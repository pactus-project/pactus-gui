import 'package:dartz/dartz.dart';
import 'package:flutter_pactus_grpc/exports/blockchain.dart'
    show GetValidatorRequest;
import 'package:pactus_gui/src/core/utils/error_handeling/failure_model.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/domain/entities/get_validator_entity.dart';

abstract class GetValidatorRepository {
  Future<Either<Failure, GetValidatorEntity>> getValidator(
    GetValidatorRequest params,
  );
}
