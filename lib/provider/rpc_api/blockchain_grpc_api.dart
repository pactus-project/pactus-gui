
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pactus/grpc_gen/blockchain.pbgrpc.dart';
import 'package:pactus/provider/rpc_api/grpc_provider.dart';

final blockchainClientProvider = Provider<BlockchainClient>((ref) {
  final channel = ref.watch(grpcChannelProvider);
  return BlockchainClient(channel);
});

// Provider for BlockchainInfoNotifier
final blockchainInfoProvider = StateNotifierProvider<BlockchainInfoNotifier,
    AsyncValue<GetBlockchainInfoResponse>>((ref) {
  final client = ref.watch(blockchainClientProvider);
  return BlockchainInfoNotifier(client);
});

class BlockchainInfoNotifier
    extends StateNotifier<AsyncValue<GetBlockchainInfoResponse>> {
  BlockchainInfoNotifier(this.client) : super(const AsyncValue.loading());
  final BlockchainClient client;

  Future<void> fetchBlockchainInfo() async {
    debugPrint('Fetching blockchain info');
    try {
      state = const AsyncValue.loading();
      final request = GetBlockchainInfoRequest();
      final response = await client.getBlockchainInfo(request);
      state = AsyncValue.data(response);
    } on Exception catch (e, st) {
      debugPrint(e.toString());
      state = AsyncValue.error(e, st);
    }
  }
  
}
