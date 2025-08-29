import 'package:pactus_gui/src/core/di/locator.dart';

class NodeDetails {
  NodeDetails({
    this.ip,
    this.port,
    this.password,
    this.nodeType,
    this.isEncryptedNode,
    this.nodeWorkingDirectory,
    this.networkName,
  });

  final String? ip;
  final String? nodeType;
  final int? port;
  final String? password;
  final bool? isEncryptedNode;
  final String? nodeWorkingDirectory;
  final String? networkName;

  // Check if all required fields are filled
  bool get isComplete =>
      ip != null &&
      port != null &&
      nodeType != null &&
      isEncryptedNode != null &&
      networkName != null &&
      nodeWorkingDirectory != null;

  // CopyWith method for easier updates
  NodeDetails copyWith({
    String? ip,
    String? nodeType,
    int? port,
    String? password,
    String? networkName,
    bool? isEncryptedNode,
    String? nodeWorkingDirectory,
  }) {
    return NodeDetails(
      ip: ip ?? this.ip,
      nodeType: nodeType ?? this.nodeType,
      networkName: networkName ?? this.networkName,
      port: port ?? this.port,
      password: password ?? this.password,
      isEncryptedNode: isEncryptedNode ?? this.isEncryptedNode,
      nodeWorkingDirectory: nodeWorkingDirectory ?? this.nodeWorkingDirectory,
    );
  }

  // Optional: toString method for debugging
  @override
  String toString() {
    return 'NodeDetails('
        'ip: $ip, '
        'port: $port, '
        'nodeType: $nodeType, '
        'networkName: $networkName, '
        'password: $password, '
        'isEncryptedNode: $isEncryptedNode, '
        'nodeWorkingDirectory: $nodeWorkingDirectory)';
  }

  // Update the singleton instance

  static void updateNodeDetailsInstance({
    String? ip,
    String? nodeType,
    int? port,
    String? password,
    String? networkName,
    bool? isEncryptedNode,
    String? nodeWorkingDirectory,
  }) {
    final current = getIt<NodeDetails>();
    final updated = current.copyWith(
      ip: ip,
      nodeType: nodeType,
      networkName: networkName,
      port: port,
      password: password,
    );

    getIt
      ..unregister<NodeDetails>()
      ..registerSingleton<NodeDetails>(updated);
  }
}
