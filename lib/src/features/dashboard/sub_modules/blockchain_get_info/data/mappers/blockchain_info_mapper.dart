import 'package:gui/src/data/models/generated/blockchain.pbgrpc.dart';
import 'package:gui/src/features/dashboard/sub_modules/blockchain_get_info/data/models/blockchain_info_model.dart';
import 'package:gui/src/features/dashboard/sub_modules/blockchain_get_info/domain/entities/blockchain_info_entity.dart';

mixin BlockchainInfoMapper {
  static BlockchainInfoEntity toEntity(BlockchainInfoModel model) {
    return BlockchainInfoEntity(
      committeeValidators: model.committeeValidators,
      isPruned: model.isPruned,
      committeePower: model.committeePower,
      totalPower: model.totalPower,
      totalValidators: model.totalValidators,
      committeeSize: model.committeeSize,
      lastBlockHash: model.lastBlockHash,
      lastBlockHeight: model.lastBlockHeight,
    );
  }

  static BlockchainInfoModel fromResponse(GetBlockchainInfoResponse response) {
    return BlockchainInfoModel(
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
