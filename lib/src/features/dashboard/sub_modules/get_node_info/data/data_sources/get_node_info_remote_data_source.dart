import 'package:pactus_gui/src/core/utils/methods/print_debug.dart';
import 'package:pactus_gui/src/data/models/generated/network.pbserver.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/data/services/get_node_info_service.dart';

mixin GetNodeInfoRemoteDataSource {
  Future<GetNodeInfoResponse> getNodeInfo({required GetNodeInfoRequest params});
}

class GetNodeInfoRemoteDataSourceImpl implements GetNodeInfoRemoteDataSource {
  GetNodeInfoRemoteDataSourceImpl(this._service);
  final GetNodeInfoService _service;

  @override
  Future<GetNodeInfoResponse> getNodeInfo({
    required GetNodeInfoRequest params,
  }) async {
    GetNodeInfoResponse? response;
    try {
      response = await _service.service(params);
    } on Exception catch (e, s) {
      printDebug('$e\n\n$s');
      throw Exception('$e,$s');
    }

    return response;
  }
}
