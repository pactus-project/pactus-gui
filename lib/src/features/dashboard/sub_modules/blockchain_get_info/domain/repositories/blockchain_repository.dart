import 'package:dartz/dartz.dart';
import 'package:pactus_gui/src/core/utils/error_handeling/failure_model.dart'
    show Failure;
import 'package:pactus_gui/src/features/dashboard/sub_modules/blockchain_get_info/domain/entities/blockchain_info_entity.dart';

abstract class BlockchainRepository {
  Future<Either<Failure, BlockchainInfoEntity>> getBlockchainInfo();
}
