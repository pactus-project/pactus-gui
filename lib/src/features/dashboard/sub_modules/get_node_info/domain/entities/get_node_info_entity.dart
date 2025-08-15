import 'package:pactus_gui/src/core/utils/gen/assets/assets.gen.dart'
    show Assets;
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';

class GetNodeInfoEntity {
  GetNodeInfoEntity({
    required this.moniker,
    required this.networkId,
    required this.clientVersion,
    required this.protocols,
    required this.nodeType,
    required this.services,
    required this.isPrune,
    required this.networkName,
    required this.workingDir,
    required this.isEncryptedWallet,
  });
  final String moniker;
  final String networkId;
  final String clientVersion;
  final String protocols;
  final String nodeType;
  final String services;
  final String networkName;
  final String workingDir;
  final String isEncryptedWallet;
  final String isPrune;

  List<String> toList() {
    return [
      networkName,
      moniker,
      networkId,
      workingDir,
      isEncryptedWallet,
      clientVersion,
      protocols,
      nodeType,
      isPrune,
      services,
    ];
  }
}



