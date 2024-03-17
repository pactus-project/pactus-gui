import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pactus/provider/process_provider.dart';

class LogDashScreen extends ConsumerWidget {
  const LogDashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final process = ref.watch(processManagerProvider.notifier);

    return StreamBuilder(
      stream: process.output,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data ?? 'errr');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
