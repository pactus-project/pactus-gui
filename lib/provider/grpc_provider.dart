import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';

import '../grpc_gen/network.pbgrpc.dart';

// Provider for ClientChannel
final grpcChannelProvider = Provider<ClientChannel>((ref) {
  return ClientChannel(
    '127.0.0.1', // Change to the actual server IP if necessary.
    port: 50051,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()), // Use secure for production.
  );
});

// Provider for the gRPC service client
final clientProvider = Provider<NetworkClient>((ref) {
  final channel = ref.watch(grpcChannelProvider);
  return NetworkClient(channel);
});

// Provider for NetworkInfoNotifier
final networkInfoProvider = StateNotifierProvider<NetworkInfoNotifier, AsyncValue<GetNetworkInfoResponse>>((ref) {
  final client = ref.watch(clientProvider);
  return NetworkInfoNotifier(client);
});

class NetworkInfoNotifier extends StateNotifier<AsyncValue<GetNetworkInfoResponse>> {
  final NetworkClient client;

  NetworkInfoNotifier(this.client) : super(const AsyncValue.loading());

  Future<void> fetchNetworkInfo() async {
    debugPrint('Fetching network info');
    try {
      state = const AsyncValue.loading();
      GetNetworkInfoRequest request = GetNetworkInfoRequest();
      final response = await client.getNetworkInfo(request);
      state = AsyncValue.data(response);
    } catch (e, st) {
      debugPrint(e.toString());
      state = AsyncValue.error(e, st);
    }
  }
}

final nodeInfoProvider = StateNotifierProvider<NodeInfoNotifier, AsyncValue<GetNodeInfoResponse>>((ref) {
  final client = ref.watch(clientProvider);
  return NodeInfoNotifier(client);
});

class NodeInfoNotifier extends StateNotifier<AsyncValue<GetNodeInfoResponse>> {
  final NetworkClient client;

  NodeInfoNotifier(this.client) : super(const AsyncValue.loading());

  Future<void> fetchNetworkInfo() async {
    try {
      state = const AsyncValue.loading();
      GetNodeInfoRequest request = GetNodeInfoRequest();
      final response = await client.getNodeInfo(request);
      state = AsyncValue.data(response);
    } catch (e, st) {
      debugPrint(e.toString());
      state = AsyncValue.error(e, st);
    }
  }
}