import 'package:flutter_pactus_grpc/exports/blockchain.dart'
    show GetValidatorResponse;
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/domain/entities/get_validator_entity.dart';

class GetValidatorMapper {
  static GetValidatorEntity toEntity(GetValidatorResponse model) {
    return GetValidatorEntity(
      validatorAddress: model.validator.address,
      validatorAvailabilityScore: double.parse(
        model.validator.availabilityScore.toStringAsFixed(1),
      ),
      validatorStack: model.validator.stake.toInt(),
    );
  }
}
