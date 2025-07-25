import 'package:get_it/get_it.dart';
import 'package:pactus_gui/src/core/constants/cli_constants.dart';
import 'package:pactus_gui/src/data/models/node_details.dart';

void updateNodeDetailsSingleton({
  String? password,
  int? port,
  String? nodeType,
}) {
  // Get the existing instance if it exists
  final existingDetails = GetIt.I.isRegistered<NodeDetails>()
      ? GetIt.I<NodeDetails>()
      : null;

  // Create new instance with updated values, falling back to
  // existing values when null
  final serverDetails = NodeDetails(
    nodeType: nodeType ?? existingDetails?.nodeType ?? '',
    ip: existingDetails?.ip ?? CliConstants.localNodeIP,
    // Provide default if no existing value
    port: port ?? existingDetails?.port ?? 0,
    password: password ?? existingDetails?.password,
  );

  // Unregister if already registered
  if (GetIt.I.isRegistered<NodeDetails>()) {
    GetIt.I.unregister<NodeDetails>();
  }

  // Register the new instance
  GetIt.I.registerSingleton<NodeDetails>(serverDetails);
}
