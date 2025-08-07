import 'package:dartz/dartz.dart';
import 'package:pactus_gui/src/data/data_sources/remote_data_state.dart';
import 'package:pactus_gui/src/data/models/error_response_model.dart';
import 'package:pactus_gui/src/data/models/generated/blockchain.pbgrpc.dart'
    show GetValidatorRequest;
import 'package:pactus_gui/src/data/use_cases/use_case.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/domain/entities/get_validator_entity.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/domain/repositories/get_validator_repository.dart';

class GetValidatorUseCase
    implements
        BaseUseCaseWithParams<
          Either<
            RemoteDataState<ErrorResponseModel>,
            RemoteDataState<GetValidatorEntity>
          >,
          GetValidatorRequest
        > {
  GetValidatorUseCase(this._repository);
  final GetValidatorRepository _repository;

  @override
  Future<
    Either<
      RemoteDataState<ErrorResponseModel>,
      RemoteDataState<GetValidatorEntity>
    >
  >
  call({required GetValidatorRequest params}) async {
    return _repository.getValidator(params: params);
  }
}
