import 'package:flutter_riverpod/flutter_riverpod.dart';

final nextButtonDisableProvider = StateProvider<bool>((ref) => false);

final radioButtonProvider = StateProvider<int>((ref) => 0);
