import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_state.dart';
import 'package:path/path.dart' show dirname, join;

/// [DaemonCubit] Documentation:
/// `DaemonCubit` manages the execution of the Pactus daemon process.
/// It extends `Cubit<DaemonState>` and provides methods to run the daemon
/// while handling its execution state.
///
/// ## Features:
/// - Runs the Pactus daemon using a given command and arguments.
/// - Emits different states (`DaemonLoading`, `DaemonSuccess`, `DaemonError`)
///   based on the execution outcome.
/// - Supports multiple operating systems (Linux, macOS).
/// - Handles standard output and errors from the process.
///
/// ## Usage:
/// ```dart
/// final daemonCubit = DaemonCubit();
/// daemonCubit.runPactusDaemon(command: 'pactusd', arguments: ['--start']);
/// ```
///
/// ## Notes:
/// - Working directory is set based on the operating system.
/// - Creates necessary directories if they don't exist.
/// - Handles exceptions and errors gracefully.
class DaemonCubit extends Cubit<DaemonState> {
  DaemonCubit() : super(DaemonInitial());

  /// Gets the appropriate native resources directory
  /// based on the operating system
  String _getNativeResourcesPath(String scriptDir) {
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

  /// Creates the native resources directory if it doesn't exist
  void _ensureDirectoryExists(String path) {
    final directory = Directory(path);
    if (!directory.existsSync()) {
      try {
        directory.createSync(recursive: true);
      } on FileSystemException catch (e) {
        emit(DaemonError('Failed to create directory: ${e.message}'));
      } on Exception catch (e) {
        emit(DaemonError('Error creating directory: $e'));
      }
    }
  }

  /// Ensures the daemon executable has proper permissions
  void _ensureExecutablePermissions(String executablePath) {
    // Skip permission setting on Windows since it's not required
    if (Platform.isWindows) {
      return;
    }
    if (!Platform.isMacOS) {
      return;
    }

    try {
      if (!File(executablePath).existsSync()) {
        throw FileSystemException('Executable not found at: $executablePath');
      }

      Process.runSync('chmod', ['+x', executablePath]);
    } catch (e) {
      throw FileSystemException(
        'Failed to set executable permissions: $e',
        executablePath,
      );
    }
  }

  /// Runs the Pactus daemon process.
  ///
  /// - [command]: The command to execute (e.g., "pactusd").
  /// - [arguments]: A list of arguments to pass to the command.
  ///
  /// Emits:
  /// - `DaemonLoading` before execution starts.
  /// - `DaemonSuccess` if the process runs successfully.
  /// - `DaemonError` if an error occurs.
  Future<void> runPactusDaemon({
    required String command,
    required List<String> arguments,
  }) async {
    emit(DaemonLoading());

    try {
      final scriptDir = dirname(Platform.script.toFilePath());
      final targetPath = _getNativeResourcesPath(scriptDir);

      _ensureDirectoryExists(targetPath);

      final executablePath =
          join(targetPath, Platform.isWindows ? '$command.exe' : command);
      _ensureExecutablePermissions(executablePath);

      // Prepare environment variables based on platform
      final environment = <String, String>{};
      if (Platform.isMacOS) {
        environment['PATH'] = Platform.environment['PATH'] ?? '';
        environment['HOME'] = Platform.environment['HOME'] ?? '';
      } else if (Platform.isWindows) {
        environment['PATH'] = Platform.environment['PATH'] ?? '';
        environment['USERPROFILE'] = Platform.environment['USERPROFILE'] ?? '';
        environment['APPDATA'] = Platform.environment['APPDATA'] ?? '';
      }

      final result = await Process.run(
        executablePath,
        arguments,
        workingDirectory: targetPath,
        environment: environment.isEmpty ? null : environment,
      );

      if (result.exitCode == 0) {
        emit(DaemonSuccess('${result.stdout}'));
      } else {
        emit(DaemonError('${result.stderr}'));
      }
    } on FileSystemException catch (e) {
      emit(DaemonError('File system error: ${e.message}'));
    } on ProcessException catch (e) {
      emit(DaemonError('Process error: ${e.message}'));
    } on Exception catch (e) {
      emit(DaemonError('Exception occurred: $e'));
    }
  }
}
