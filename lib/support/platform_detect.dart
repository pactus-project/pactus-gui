import 'package:flutter/foundation.dart';

class PlatformDetect {
  PlatformDetect._();
  static bool get isMacOS {
    if (kIsWeb) return false;
    return [
      TargetPlatform.macOS,
    ].contains(defaultTargetPlatform);
  }

  static bool get isWindows {
    if (kIsWeb) return false;
    return [
      TargetPlatform.windows,
    ].contains(defaultTargetPlatform);
  }

  static bool get isLinux {
    if (kIsWeb) return false;
    return [
      TargetPlatform.linux,
    ].contains(defaultTargetPlatform);
  }
}
