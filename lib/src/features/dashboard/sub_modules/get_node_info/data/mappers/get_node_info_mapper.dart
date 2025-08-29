import 'package:pactus_gui/src/data/models/generated/network.pbgrpc.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/domain/entities/get_node_info_entity.dart';

class GetNodeInfoMapper {
  static GetNodeInfoEntity toEntity(
      GetNodeInfoResponse model,

   ) {
    final agentProperties = _extractAgentProperties(model.agent);

    return GetNodeInfoEntity(
      isEncryptedWallet: 'isEncryptedWallet' /*? 'Yes' : 'No'*/,
      networkName: 'networkName',
      workingDir: 'workingDir',
      networkId: model.peerId,
      moniker: model.moniker,
      services: '${model.services}',
      nodeType: agentProperties['node'] ?? '',
      clientVersion: agentProperties['node-version'] ?? '',
      protocols: agentProperties['protocol-version'] ?? '',
      isPrune: model.servicesNames == 'PRUNED' ? 'Yes' : 'No',
    );
  }

  /// Extracts key-value properties from an agent string.
  static Map<String, String> _extractAgentProperties(String agentString) {
    final agentSegments = agentString.split('/');
    final properties = <String, String>{};

    for (final segment in agentSegments) {
      if (segment.contains('=')) {
        final keyValue = segment.split('=');
        if (keyValue.length == 2) {
          final key = keyValue[0];
          final value = keyValue[1];
          properties[key] = value;
        }
      }
    }
    return properties;
  }
}

class NodeInfoModel {
  // Optional icon for UI

  const NodeInfoModel({
    required this.key,
    required this.value,
    required this.icon,
  });
  final String key;
  final String value;
  final String icon;
}
