import 'package:dartz/dartz.dart';
import 'package:gui/src/data/data_sources/remote_data_state.dart';
import 'package:gui/src/data/models/error_response_model.dart';
import 'package:gui/src/features/dashboard/sub_modules/get_validator/domain/entities/get_validator_entity.dart';

mixin GetValidatorRepository {
  Future<
      Either<RemoteDataState<ErrorResponseModel>,
          RemoteDataState<GetValidatorEntity>>> getValidator({
    void params,
  });
}
