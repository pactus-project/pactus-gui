import 'package:dartz/dartz.dart';
import 'package:pactus_gui/src/core/utils/error_handeling/failure_model.dart';
import 'package:pactus_gui/src/data/use_cases/use_case.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/blockchain_get_info/domain/entities/blockchain_info_entity.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/blockchain_get_info/domain/repositories/blockchain_repository.dart';

class GetBlockchainInfoUseCase
    implements BaseUseCase<Either<Failure, BlockchainInfoEntity>> {
  GetBlockchainInfoUseCase(this._repository);
  final BlockchainRepository _repository;

  @override
  Future<Either<Failure, BlockchainInfoEntity>> call() async {
    return _repository.getBlockchainInfo();
  }
}
