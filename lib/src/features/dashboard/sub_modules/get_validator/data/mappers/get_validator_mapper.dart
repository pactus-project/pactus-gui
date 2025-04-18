import 'package:gui/src/data/models/generated/blockchain.pbgrpc.dart';
import 'package:gui/src/features/dashboard/sub_modules/get_validator/data/models/get_validator_model.dart';
import 'package:gui/src/features/dashboard/sub_modules/get_validator/domain/entities/get_validator_entity.dart';

mixin GetValidatorMapper {
  static GetValidatorEntity toEntity(
    GetValidatorModel model,
  ) {
    return GetValidatorEntity(
      validatorAddress: model.validatorAddress,
      validatorAvailabilityScore: model.validatorAvailabilityScore,
      validatorStack: model.validatorStack,
    );
  }

  static GetValidatorModel fromResponse(
    GetValidatorResponse response,
  ) {
    return GetValidatorModel(
      validatorAddress: response.validator.address,
      validatorAvailabilityScore: response.validator.availabilityScore,
      validatorStack: response.validator.stake.toInt(),
    );
  }
}
