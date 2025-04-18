import 'package:gui/src/features/dashboard/sub_modules/get_validator/data/mappers/get_validator_mapper.dart';
import 'package:gui/src/features/dashboard/sub_modules/get_validator/data/models/get_validator_model.dart';
import 'package:gui/src/features/dashboard/sub_modules/get_validator/data/services/get_validator_service.dart';

mixin GetValidatorRemoteDataSource {
  Future<GetValidatorModel> getValidator();
}

class GetValidatorRemoteDataSourceImpl implements GetValidatorRemoteDataSource {
  GetValidatorRemoteDataSourceImpl(this._service);
  final GetValidatorService _service;

  @override
  Future<GetValidatorModel> getValidator() async {
    final response = await _service.service();
    return GetValidatorMapper.fromResponse(response);
  }
}
