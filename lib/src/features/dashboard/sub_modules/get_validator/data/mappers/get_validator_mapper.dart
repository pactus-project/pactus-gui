import 'package:pactus_gui/src/data/models/generated/blockchain.pbgrpc.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/data/models/get_validator_model.dart';
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
