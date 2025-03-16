import 'package:gui/src/features/blockchain_get_info/data/models/blockchain_info_model.dart';
import 'package:gui/src/features/blockchain_get_info/domain/entities/blockchain_info_entity.dart';

class BlockchainInfoMapper {
  BlockchainInfoEntity toEntity(BlockchainInfoModel model) {
    return BlockchainInfoEntity(
      lastBlockHash: model.lastBlockHash,
      lastBlockHeight: model.lastBlockHeight,
    );
  }
}
