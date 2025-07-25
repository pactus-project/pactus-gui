class GetValidatorEntity {
  GetValidatorEntity({
    required this.validatorAddress,
    required this.validatorStack,
    required this.validatorAvailabilityScore,
  });
  final String validatorAddress;
  final int validatorStack;
  final double validatorAvailabilityScore;
}
