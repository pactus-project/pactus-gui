import 'package:get_it/get_it.dart';
import 'package:gui/src/core/constants/cli_constants.dart';
import 'package:gui/src/data/models/node_details.dart';

void updateNodeDetailsSingleton(String? password) {
  final serverDetails = NodeDetails(
    ip: CliConstants.localNodeIP,
    port: CliConstants.localNodePort,
    password: password,
  );
  GetIt.instance.registerSingleton<NodeDetails>(
    serverDetails,
  );
}
