import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

enum Os {
  web,
  android,
  ios,
  macOS,
  linux,
  windows,
  fuchsia,
}

class Platform {
  const Platform._();

  static bool get isWeb => os == Os.web;

  /// Platform is Android.
  static bool get isAndroid => os == Os.android;

  /// Platform is IOS.
  static bool get isIOS => os == Os.ios;

  /// Platform is Fuchsia.
  static bool get isFuchsia => os == Os.fuchsia;

  /// Platform is Linux.
  static bool get isLinux => os == Os.linux;

  /// Platform is MacOS.
  static bool get isMacOS => os == Os.macOS;

  /// Platform is Windows.
  static bool get isWindows => os == Os.windows;

  /// Platform is Android or IOS.
  static bool get isMobile => isAndroid || isIOS;

  /// Platform is Android or IOS or Fuchsia.
  static bool get isFullMobile => isMobile || isFuchsia;

  /// Platform is Linux or Windows or MacOS.
  static bool get isDesktop => isLinux || isWindows || isMacOS;

  /// Getting the os name.
  static Os get os {
    if (kIsWeb) {
      return Os.web;
    }
    return switch (defaultTargetPlatform) {
      TargetPlatform.android => Os.android,
      TargetPlatform.iOS => Os.ios,
      TargetPlatform.macOS => Os.macOS,
      TargetPlatform.windows => Os.windows,
      TargetPlatform.fuchsia => Os.fuchsia,
      TargetPlatform.linux => Os.linux
    };
  }
}
