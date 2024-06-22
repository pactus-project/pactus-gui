import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pactus/provider/rpc_api/grpc_provider.dart';
import 'package:protobuf/protobuf.dart';

import '../../grpc_gen/network.pbgrpc.dart';

// Provider for the gRPC service client
final networkClientProvider = Provider<NetworkClient>((ref) {
  final channel = ref.watch(grpcChannelProvider);
  return NetworkClient(channel);
});

// Provider for NetworkInfoNotifier
final networkInfoProvider =
    StateNotifierProvider<NetworkInfoNotifier, AsyncValue<GeneratedMessage>>(
        (ref) {
  final client = ref.watch(networkClientProvider);
  return NetworkInfoNotifier(client);
});

class NetworkInfoNotifier extends StateNotifier<AsyncValue<GeneratedMessage>> {
  NetworkInfoNotifier(this.client) : super(const AsyncValue.loading());
  final NetworkClient client;

  Future<void> fetchNetworkInfo() async {
    try {
      state = const AsyncValue.loading();
      final request = GetNetworkInfoRequest();
      final response = await client.getNetworkInfo(request);
      state = AsyncValue.data(response);
    } on Exception catch (e, st) {
      debugPrint(e.toString());
      state = AsyncValue.error(e, st);
    }
  }
}

final nodeInfoProvider =
    StateNotifierProvider<NodeInfoNotifier, AsyncValue<GeneratedMessage>>((ref) {
  final client = ref.watch(networkClientProvider);
  return NodeInfoNotifier(client);
});

class NodeInfoNotifier extends StateNotifier<AsyncValue<GeneratedMessage>> {
  NodeInfoNotifier(this.client) : super(const AsyncValue.loading());
  final NetworkClient client;

  Future<void> fetchData() async {
    try {
      state = const AsyncValue.loading();
      final request = GetNodeInfoRequest();
      final response = await client.getNodeInfo(request);
      state = AsyncValue.data(response);
    } on Exception catch (e, st) {
      debugPrint(e.toString());
      state = AsyncValue.error(e, st);
    }
  }
}
