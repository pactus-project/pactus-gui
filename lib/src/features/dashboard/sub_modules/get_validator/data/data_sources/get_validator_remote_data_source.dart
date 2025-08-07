import 'package:pactus_gui/src/data/models/generated/blockchain.pbgrpc.dart'
    show GetValidatorRequest, GetValidatorResponse;
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/data/mappers/get_validator_mapper.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/data/models/get_validator_model.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/data/services/get_validator_service.dart';

mixin GetValidatorRemoteDataSource {
  Future<GetValidatorModel> getValidator({required GetValidatorRequest params});
}

class GetValidatorRemoteDataSourceImpl implements GetValidatorRemoteDataSource {
  GetValidatorRemoteDataSourceImpl(this._service);
  final GetValidatorService _service;

  @override
  Future<GetValidatorModel> getValidator({
    required GetValidatorRequest params,
  }) async {
    print('params::::${params.address}');

    GetValidatorResponse? response;
    try {
      response = await _service.service(params);
    } on Exception catch (e, s) {
      print(e);
      print(s);
      throw Exception('$e,$s');
    }

    return GetValidatorMapper.fromResponse(response!);
  }
}
