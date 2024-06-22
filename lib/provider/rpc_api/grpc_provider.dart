import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';

// Provider for ClientChannel
final grpcChannelProvider = Provider<ClientChannel>((ref) {
  return ClientChannel(
    '127.0.0.1', // Change to the actual server IP if necessary.
    // '172.27.172.3', // Change to the actual server IP if necessary.
    port: 50051,
    options: const ChannelOptions(
        credentials:
            ChannelCredentials.insecure()), // Use secure for production.
  );
});


