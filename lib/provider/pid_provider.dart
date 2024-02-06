import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final pidProvider = StateProvider<int?>((ref) => null);
final processProvider = StateProvider<Process?>((ref) => null);