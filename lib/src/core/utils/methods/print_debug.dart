import 'package:flutter/foundation.dart';

void printDebug(String? text) {
  if (!kReleaseMode) {
    if (kDebugMode) {
      print(text);
    }
  }
}
