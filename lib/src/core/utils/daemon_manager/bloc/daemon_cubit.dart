import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' show dirname, join;
import 'daemon_state.dart';

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

  /// Prepares environment variables based on platform
  Map<String, String> _prepareEnvironment() {
    final environment = <String, String>{};

    if (Platform.isMacOS) {
      environment['PATH'] = Platform.environment['PATH'] ?? '';
      environment['HOME'] = Platform.environment['HOME'] ?? '';
    } else if (Platform.isWindows) {
      environment['PATH'] = Platform.environment['PATH'] ?? '';
      environment['USERPROFILE'] = Platform.environment['USERPROFILE'] ?? '';
      environment['APPDATA'] = Platform.environment['APPDATA'] ?? '';
    }

    return environment;
  }

  /// Handles process execution result
  void _handleProcessResult(ProcessResult result) {
    if (result.exitCode == 0) {
      emit(DaemonSuccess('${result.stdout}'));
    } else {
      emit(DaemonError('${result.stderr}'));
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
      final sourcePath = _getNativeResourcesPath(scriptDir);

      final executablePath = join(
        sourcePath,
        Platform.isWindows ? '$command.exe' : command,
      );

      _ensureExecutablePermissions(executablePath);
      final environment = _prepareEnvironment();

      final result = await Process.run(
        executablePath,
        arguments,
        workingDirectory: sourcePath,
        environment: environment.isEmpty ? null : environment,
      );

      _handleProcessResult(result);
    } on FileSystemException catch (e) {
      emit(DaemonError('File system error: ${e.message}'));
    } on ProcessException catch (e) {
      emit(DaemonError('Process error: ${e.message}'));
    } on Exception catch (e) {
      emit(DaemonError('Exception occurred: $e'));
    }
  }
}
