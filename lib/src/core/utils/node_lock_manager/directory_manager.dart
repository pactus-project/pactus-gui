import 'dart:io';

import 'package:pactus_gui/src/core/utils/methods/print_debug.dart';
import 'package:pactus_gui/src/core/utils/node_lock_manager/file_remover.dart';
import 'package:pactus_gui/src/core/utils/node_lock_manager/process_close_manager.dart';
import 'package:path/path.dart';

enum DaemonFileEnum {
  pactusDaemon('pactus-daemon'),
  pactusWallet('pactus-wallet'),
  pactusShell('pactus-shell');

  const DaemonFileEnum(this.fileName);

  final String fileName;
}

class DirectoryManager {
  Future<void> killDaemonProcess(DaemonFileEnum daemonFile) async {
    try {
      final executablePath = _executablePath(daemonFile.fileName);

      printDebug('Executable path: $executablePath');

      // Ensure executable permissions (skips on Windows)
      _ensureExecutablePermissions(executablePath);

      // close process
      await ProcessCloserManager.closeProcessesByPath(
        directoryPath: _executableDir(),
        executableName: _matchOsCommand(daemonFile.fileName),
      );
    } on FileSystemException catch (e) {
      printDebug('File system error: ${e.message}');
    } on ProcessException catch (e) {
      printDebug('Process execution error: ${e.message}');
    } on Exception catch (e) {
      printDebug('Unexpected error: $e');
    }
  }

  Future<void> removeLockFile() async {
    const fileName = '.pactus.lock';
    try {
      //  Remove File
      await FileRemover.deleteFile(
        directoryPath: _scriptDir(),
        fileName: fileName,
      );
    } on FileSystemException catch (e) {
      printDebug('File system error: ${e.message}');
    } on ProcessException catch (e) {
      printDebug('Process execution error: ${e.message}');
    } on Exception catch (e) {
      printDebug('Unexpected error: $e');
    }
  }

  String _scriptDir() {
    final scriptDir = dirname(Platform.script.toFilePath());
    return scriptDir;
  }

  String _executableDir() {
    final scriptDir = _scriptDir();
    final executableDir = _getNativeResourcesPath(scriptDir);
    return executableDir;
  }

  String _matchOsCommand(String command) {
    final result = Platform.isWindows ? '$command.exe' : command;
    return result;
  }

  String _executablePath(String command) {
    return join(
      _executableDir(),
      _matchOsCommand(command),
    );
  }

  /// Gets the appropriate native resources directory
  /// based on the operating system
  String _getNativeResourcesPath(String scriptDir) {
    final envPath = Platform.environment['PACTUS_NATIVE_RESOURCES'];

    if (envPath != null && envPath.isNotEmpty) {
      return envPath;
    }

    final scriptDir = dirname(Platform.script.toFilePath());
    final platform = Platform.operatingSystem;
    final nativeDir = join(scriptDir, 'lib', 'src', 'core', 'native_resources');
    switch (platform) {
      case 'linux':
        return join(nativeDir, 'linux');
      case 'macos':
        return join(nativeDir, 'macos');
      case 'windows':
        return join(nativeDir, 'windows');
      default:
        throw UnsupportedError('Unsupported operating system: $platform');
    }
  }

  /// Ensures the daemon executable has proper permissions
  void _ensureExecutablePermissions(String executablePath) {
    if (Platform.isWindows) {
      return;
    }

    try {
      final file = File(executablePath);
      if (!file.existsSync()) {
        throw FileSystemException('Executable not found at: $executablePath');
      }

      if (file.statSync().mode & 0x111 == 0) {
        Process.runSync('chmod', ['+x', executablePath]);
      }
    } on FileSystemException {
      rethrow;
    }
  }
}
