import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UnlockScreen extends ConsumerStatefulWidget {
  static const String route = '/unlock';
  const UnlockScreen({super.key});

  @override
  ConsumerState<UnlockScreen> createState() => _UnlockScreenState();
}

class _UnlockScreenState extends ConsumerState<UnlockScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
