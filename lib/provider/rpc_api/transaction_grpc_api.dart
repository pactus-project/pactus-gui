import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pactus/grpc_gen/transaction.pbgrpc.dart';
import 'package:pactus/provider/rpc_api/grpc_provider.dart';
import 'package:protobuf/protobuf.dart';

final transactionClientProvider = Provider<TransactionClient>((ref) {
  final channel = ref.watch(grpcChannelProvider);
  return TransactionClient(channel);
});


// Provider for transactionInfoNotifier
final transactionInfoProvider = StateNotifierProvider<TransactionInfoNotifier,
    AsyncValue<GeneratedMessage>>((ref) {
  final client = ref.watch(transactionClientProvider);
  return TransactionInfoNotifier(client);
});

class TransactionInfoNotifier
    extends StateNotifier<AsyncValue<GeneratedMessage>> {
  TransactionInfoNotifier(this.client) : super(const AsyncValue.loading());
  final TransactionClient client;

  Future<void> fetchtransactionInfo() async {
    debugPrint('Fetching transaction info');
    try {
      state = const AsyncValue.loading();
      final request = GetTransactionRequest();
      final response = await client.getTransaction(request);
      state = AsyncValue.data(response);
    } on Exception catch (e, st) {
      debugPrint(e.toString());
      state = AsyncValue.error(e, st);
    }
  }

   Future<void> fetchtransaction() async {
    debugPrint('Fetching transaction info');
    try {
      state = const AsyncValue.loading();
      final request = GetRawBondTransactionRequest();
      final response = await client.getRawBondTransaction(request);
      state = AsyncValue.data(response);
    } on Exception catch (e, st) {
      debugPrint(e.toString());
      state = AsyncValue.error(e, st);
    }
  }
  
}
