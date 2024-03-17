import 'package:flutter_riverpod/flutter_riverpod.dart';

final validatorProvider = StateProvider<int>((ref) => 7);
final dataPathProvider = StateProvider<String?>((ref) => null);
