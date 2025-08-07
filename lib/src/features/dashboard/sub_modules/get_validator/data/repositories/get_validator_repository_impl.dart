import 'package:dartz/dartz.dart';
import 'package:pactus_gui/src/data/data_sources/remote_data_state.dart';
import 'package:pactus_gui/src/data/models/error_response_model.dart';
import 'package:pactus_gui/src/data/models/generated/blockchain.pbgrpc.dart'
    show GetValidatorRequest;
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/data/data_sources/get_validator_remote_data_source.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/data/mappers/get_validator_mapper.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/domain/entities/get_validator_entity.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/domain/repositories/get_validator_repository.dart';

class GetValidatorRepositoryImpl implements GetValidatorRepository {
  GetValidatorRepositoryImpl(this._remoteDataSource);
  final GetValidatorRemoteDataSource _remoteDataSource;

  @override
  Future<
    Either<
      RemoteDataState<ErrorResponseModel>,
      RemoteDataState<GetValidatorEntity>
    >
  >
  getValidator({required GetValidatorRequest params}) async {
    try {
      await Future<void>.delayed(Duration(seconds: 3));
      print('params: validatorAddress ${params.address}');

      final model = await _remoteDataSource.getValidator(params: params);
      print('model: validatorAddress ${model.validatorAddress}');
      print(
        'model:validatorAvailabilityScore ${model.validatorAvailabilityScore}',
      );
      print('model:validatorStack ${model.validatorStack}');
      final entity = GetValidatorMapper.toEntity(model);
      return Right(RemoteDataState.success(remoteData: entity));
    } on Exception catch (e, s) {
      print('model: validatorAddress ${e} , ${s}');

      return Left(RemoteDataState.failed(error: e.toString()));
    }
  }
}
