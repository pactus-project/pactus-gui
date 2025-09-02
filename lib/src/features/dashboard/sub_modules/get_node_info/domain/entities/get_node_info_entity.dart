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

  GetNodeInfoEntity copyWith({
    String? moniker,
    String? networkId,
    String? clientVersion,
    String? protocols,
    String? nodeType,
    String? services,
    String? isPrune,
    String? networkName,
    String? workingDir,
    String? isEncryptedWallet,
  }) {
    return GetNodeInfoEntity(
      moniker: moniker ?? this.moniker,
      networkId: networkId ?? this.networkId,
      clientVersion: clientVersion ?? this.clientVersion,
      protocols: protocols ?? this.protocols,
      nodeType: nodeType ?? this.nodeType,
      services: services ?? this.services,
      isPrune: isPrune ?? this.isPrune,
      networkName: networkName ?? this.networkName,
      workingDir: workingDir ?? this.workingDir,
      isEncryptedWallet: isEncryptedWallet ?? this.isEncryptedWallet,
    );
  }
}
