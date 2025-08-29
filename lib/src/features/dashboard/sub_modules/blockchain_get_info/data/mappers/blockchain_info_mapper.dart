import 'package:pactus_gui/src/data/models/generated/blockchain.pbgrpc.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/blockchain_get_info/data/models/blockchain_info_model.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/blockchain_get_info/domain/entities/blockchain_info_entity.dart';

mixin BlockchainInfoMapper {
  static BlockchainInfoEntity toEntity(GetBlockchainInfoResponse response) {
    return BlockchainInfoEntity(
      committeeValidators: response.committeeValidators,
      isPruned: response.isPruned,
      committeePower: response.committeePower.toInt(),
      totalPower: response.totalPower.toInt(),
      totalValidators: response.totalValidators,
      committeeSize: response.committeeValidators.length,
      lastBlockHash: response.lastBlockHash,
      lastBlockHeight: response.lastBlockHeight,
    );
  }

}
