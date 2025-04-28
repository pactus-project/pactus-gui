import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:pactus_gui/src/data/models/node_details.dart';

class GrpcChannelManager {
  // Factory Method for creating or retrieving a singleton
  factory GrpcChannelManager({required NodeDetails serverDetails}) {
    if (GetIt.I.isRegistered<GrpcChannelManager>()) {
      return GetIt.I<GrpcChannelManager>();
    }

    final instance = GrpcChannelManager._(serverDetails: serverDetails);
    GetIt.I.registerSingleton<GrpcChannelManager>(instance);
    return instance;
  }

  GrpcChannelManager._({
    required this.serverDetails,
  }) {
    _channel = ClientChannel(
      serverDetails.ip,
      port: serverDetails.port,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
  }
  final NodeDetails serverDetails;
  late final ClientChannel _channel;

  // Getter for accessing the Channel
  ClientChannel get channel => _channel;

  // The Dispose method for closing the Channel and unregistering itself.
  void dispose() {
    _channel.shutdown(); // Close Channel
    GetIt.I.unregister<GrpcChannelManager>(); // Unregistering itself
  }
}
