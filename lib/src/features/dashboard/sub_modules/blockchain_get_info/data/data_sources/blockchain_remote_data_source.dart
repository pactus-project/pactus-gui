import 'package:gui/src/features/dashboard/sub_modules/blockchain_get_info/data/mappers/blockchain_info_mapper.dart';
import 'package:gui/src/features/dashboard/sub_modules/blockchain_get_info/data/models/blockchain_info_model.dart';
import 'package:gui/src/features/dashboard/sub_modules/blockchain_get_info/data/services/blockchain_service.dart';

mixin BlockchainRemoteDataSource {
  Future<BlockchainInfoModel> getBlockchainInfo();
}

class BlockchainRemoteDataSourceImpl implements BlockchainRemoteDataSource {
  BlockchainRemoteDataSourceImpl(this._service);
  final BlockchainService _service;

  @override
  Future<BlockchainInfoModel> getBlockchainInfo() async {
    final response = await _service.service();
    return BlockchainInfoMapper.fromResponse(response);
  }
}
