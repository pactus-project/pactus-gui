import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

/// Documentation for the [Os] Enum
/// Enum representing the supported operating systems and platforms.
///
/// Used to identify the current runtime platform in a Flutter application.
enum Os {
  web,
  android,
  ios,
  macOS,
  linux,
  windows,
  fuchsia,
}

/// Documentation for the [Platform] class
/// Utility class for detecting the current platform or operating system.
///
/// Provides static properties to determine whether the application is running -
/// on web, mobile, or desktop platforms.
///
class Platform {
  const Platform._();

  static bool get isWeb => os == Os.web;

  static bool get isAndroid => os == Os.android;

  static bool get isIOS => os == Os.ios;

  static bool get isFuchsia => os == Os.fuchsia;

  static bool get isLinux => os == Os.linux;

  static bool get isMacOS => os == Os.macOS;

  static bool get isWindows => os == Os.windows;

  static bool get isMobile => isAndroid || isIOS;

  static bool get isFullMobile => isMobile || isFuchsia;

  static bool get isDesktop => isLinux || isWindows || isMacOS;

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
