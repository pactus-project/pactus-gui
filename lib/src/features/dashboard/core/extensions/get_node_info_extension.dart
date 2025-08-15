import 'package:pactus_gui/src/core/utils/gen/assets/assets.gen.dart'
    show Assets;
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart'
    show LocaleKeys;
import 'package:pactus_gui/src/features/dashboard/core/enums/get_node_info_enum.dart'
    show GetNodeInfoEnum;

extension GetNodeInfoEnumExtension on GetNodeInfoEnum {
  String getIconPath() => switch (this) {
    GetNodeInfoEnum.networkName => Assets.icons.icNetwork,
    GetNodeInfoEnum.moniker => Assets.icons.icMonikor,
    GetNodeInfoEnum.networkId => Assets.icons.icNetworkLogo,
    GetNodeInfoEnum.workingDir => Assets.icons.icWorkingDir,
    GetNodeInfoEnum.isEncryptedWallet => Assets.icons.icEncryptWallet,
    GetNodeInfoEnum.clientVersion => Assets.icons.icClientVersion,
    GetNodeInfoEnum.protocols => Assets.icons.icProtocolVersion,
    GetNodeInfoEnum.nodeType => Assets.icons.icNodeType,
    GetNodeInfoEnum.isPrune => Assets.icons.icPrune,
    GetNodeInfoEnum.services => Assets.icons.icServices,
  };

  String getTitle() => switch (this) {
    GetNodeInfoEnum.networkName => LocaleKeys.network,
    GetNodeInfoEnum.moniker => LocaleKeys.moniker,
    GetNodeInfoEnum.networkId => LocaleKeys.networkId,
    GetNodeInfoEnum.workingDir => LocaleKeys.workingDir,
    GetNodeInfoEnum.isEncryptedWallet => LocaleKeys.encryptedWallet,
    GetNodeInfoEnum.clientVersion => LocaleKeys.clientVersion,
    GetNodeInfoEnum.protocols => LocaleKeys.protocols,
    GetNodeInfoEnum.nodeType => LocaleKeys.nodeType,
    GetNodeInfoEnum.isPrune => LocaleKeys.isPrune,
    GetNodeInfoEnum.services => LocaleKeys.services,
  };
}
