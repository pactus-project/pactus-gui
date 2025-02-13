import 'dart:convert';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
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
  final Logger _logger = Logger();

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
    _logger.i('Starting daemon process with command: $command $arguments');

    try {
      final scriptDir = dirname(Platform.script.toFilePath());
      final executableDir = _getNativeResourcesPath(scriptDir);
      _logger.d('Native resources path: $executableDir');

      final executablePath = join(
        executableDir,
        Platform.isWindows ? '$command.exe' : command,
      );
      _logger.d('Executable path: $executablePath');

      // Ensure executable permissions (skips on Windows)
      _ensureExecutablePermissions(executablePath);

      // Start the process with platform-specific command
      _logger.d('Starting process...');
      // final process = await Process.start(
      //   Platform.isWindows ? 'cmd.exe' : executablePath,
      //   Platform.isWindows ? ['/c', executablePath, ...arguments] : arguments,
      //   workingDirectory: executableDir,
      // );

      final process = await Process.start(
        executablePath,
        arguments,
        workingDirectory: executableDir,
      );

      _logger.d('Process started with PID: ${process.pid}');

      // Handle process output
      process.stdout.transform<String>(utf8.decoder).listen((data) {
        _logger.i('Daemon stdout: $data');
        emit(DaemonSuccess(data));
      });

      process.stderr.transform<String>(utf8.decoder).listen((data) {
        _logger.i('Daemon stderr: $data');
        emit(DaemonError(data));
      });

      await process.exitCode.then((code) {
        _logger.i('Process exited with code: $code');
        if (code != 0) {
          emit(DaemonError('Process exited with code: $code'));
        }
      });
    } on FileSystemException catch (e) {
      _logger.e('File system error: ${e.message}');
      emit(DaemonError('File system error: ${e.message}'));
    } on ProcessException catch (e) {
      _logger.e('Process execution error: ${e.message}');
      emit(DaemonError('Process error: ${e.message}'));
    } on Exception catch (e) {
      _logger.e('Unexpected error: $e');
      emit(DaemonError('Exception occurred: $e'));
    }
  }
}
