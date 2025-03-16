class BlockchainInfoEntity {

  BlockchainInfoEntity({
    required this.lastBlockHash,
    required this.lastBlockHeight,
  });
  final String lastBlockHash;
  final int lastBlockHeight;
}
