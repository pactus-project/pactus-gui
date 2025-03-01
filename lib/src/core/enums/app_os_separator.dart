import 'dart:io';

enum AppOS {
  windows('''\\'''),
  macos('/'),
  linux('/');

  const AppOS(this.separator);

  final String separator;

  /// Detects the current OS and returns the corresponding enum value
  static AppOS get current {
    if (Platform.isWindows) {
      return AppOS.windows;
    }
    if (Platform.isMacOS) {
      return AppOS.macos;
    }
    if (Platform.isLinux) {
      return AppOS.linux;
    }
    throw UnsupportedError('Unsupported platform');
  }
}
