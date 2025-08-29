import 'package:dartz/dartz.dart';
import 'package:pactus_gui/src/core/utils/error_handeling/failure_model.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/blockchain_get_info/data/mappers/blockchain_info_mapper.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/blockchain_get_info/data/services/blockchain_service.dart'
    show BlockchainService;
import 'package:pactus_gui/src/features/dashboard/sub_modules/blockchain_get_info/domain/entities/blockchain_info_entity.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/blockchain_get_info/domain/repositories/blockchain_repository.dart';

class BlockchainRepositoryImpl implements BlockchainRepository {
  BlockchainRepositoryImpl(this._service);
  final BlockchainService _service;

  @override
  Future<Either<Failure, BlockchainInfoEntity>> getBlockchainInfo() async {
    final result = await _service.service();

    return result.map(BlockchainInfoMapper.toEntity);
  }
}
