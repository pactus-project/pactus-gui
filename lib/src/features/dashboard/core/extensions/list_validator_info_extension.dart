import 'package:pactus_gui/src/data/models/generated/blockchain.pbgrpc.dart';

extension ListValidatorInfoExtension on List<ValidatorInfo> {
  ValidatorInfo? getByAddress(String address) {
    ValidatorInfo? validatorInfo;
    try {
      validatorInfo = firstWhere(
        (item) => item.address == address,
      );
      // ignore: avoid_catching_errors
    } on StateError catch (_) {}
    return validatorInfo;
  }
}
