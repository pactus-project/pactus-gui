import 'package:pactus_gui/src/data/models/generated/blockchain.pb.dart';

class BlockchainInfoModel {
  BlockchainInfoModel({
    required this.lastBlockHash,
    required this.lastBlockHeight,
    required this.committeeSize,
    required this.totalValidators,
    required this.totalPower,
    required this.committeePower,
    required this.isPruned,
    required this.committeeValidators,
  });
  final String lastBlockHash;
  final int lastBlockHeight;
  final int committeeSize;
  final int totalValidators;
  final int totalPower;
  final int committeePower;
  final bool isPruned;
  final List<ValidatorInfo> committeeValidators;
}
