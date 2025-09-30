import 'package:flutter_pactus_grpc/exports/blockchain.dart'
    show ValidatorInfo;

extension ListValidatorInfoExtension on List<ValidatorInfo> {
  ValidatorInfo? getByAddress(String address) {
    ValidatorInfo? validatorInfo;
    try {
      validatorInfo = firstWhere((item) => item.address == address);
      // ignore: avoid_catching_errors
    } on StateError catch (_) {}
    return validatorInfo;
  }
}
