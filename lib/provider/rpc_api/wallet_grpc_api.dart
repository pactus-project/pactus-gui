import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pactus/grpc_gen/wallet.pbgrpc.dart';
import 'package:pactus/provider/rpc_api/grpc_provider.dart';

final walletClientProvider = Provider<WalletClient>((ref) {
  final channel = ref.watch(grpcChannelProvider);
  return WalletClient(channel);
});


// Provider for WalletInfoNotifier
final walletInfoProvider = StateNotifierProvider<WalletInfoNotifier,
    AsyncValue<LoadWalletResponse>>((ref) {
  final client = ref.watch(walletClientProvider);
  return WalletInfoNotifier(client);
});

class WalletInfoNotifier
    extends StateNotifier<AsyncValue<LoadWalletResponse>> {
  WalletInfoNotifier(this.client) : super(const AsyncValue.loading());
  final WalletClient client;

  Future<void> fetchwalletInfo() async {
    debugPrint('Fetching wallet info');
    try {
      state = const AsyncValue.loading();
      final request = LoadWalletRequest();
      final response = await client.loadWallet(request);
      state = AsyncValue.data(response);
    } on Exception catch (e, st) {
      debugPrint(e.toString());
      state = AsyncValue.error(e, st);
    }
  }
  
}
