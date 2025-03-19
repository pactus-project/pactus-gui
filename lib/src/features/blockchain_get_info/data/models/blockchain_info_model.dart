class BlockchainInfoModel {
  BlockchainInfoModel({
    required this.lastBlockHash,
    required this.lastBlockHeight,
    required this.committeeSize,
    required this.totalValidators,
    required this.totalPower,
    required this.committeePower,
    required this.isPruned,
  });
  final String lastBlockHash;
  final int lastBlockHeight;
  final int committeeSize;
  final int totalValidators;
  final int totalPower;
  final int committeePower;
  final bool isPruned;
}
