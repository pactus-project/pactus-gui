import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/constants/cli_constants.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/cli_command.dart';
import 'package:pactus_gui/src/core/utils/methods/print_debug.dart';
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

  /// Runs the Pactus daemon process.
  ///
  /// - [cliCommand]: An instance of `CliCommand` containing the command
  ///   and its arguments.
  ///
  /// Emits:
  /// - `DaemonLoading` before execution starts.
  /// - `DaemonSuccess` if the process runs successfully.
  /// - `DaemonError` if an error occurs.
  ///
  Future<void> runPactusDaemon({required CliCommand cliCommand}) async {
    emit(DaemonLoading());
    printDebug(
      'Starting daemon process with command:'
      ' ${cliCommand.command} ${cliCommand.arguments}',
    );

    try {
      final executablePath = _executablePath(cliCommand.command);

      printDebug('Executable path: $executablePath');

      // Ensure executable permissions (skips on Windows)
      _ensureExecutablePermissions(executablePath);

      // Start the process with platform-specific command
      final process = await Process.start(
        executablePath,
        cliCommand.arguments,
        workingDirectory: _executableDir(),
      );
      printDebug('process path: $process');

      // bypass password-less wallet cli and init node
      // if (cliCommand.command == './pactus-daemon' &&
      //     cliCommand.arguments.first == 'init' &&
      //     !cliCommand.arguments.contains(CliConstants.password)) {
      //   // Writing password interactively
      //   process.stdin.writeln();
      //
      //   Future.delayed(Duration(seconds: 2), () {
      //     // Writing password interactively
      //     process.stdin.writeln();
      //   });
      // }

      if (cliCommand.command == CliConstants.pactusWallet &&
          cliCommand.arguments[0] == CliConstants.password) {
        final pass = cliCommand.arguments[2];
        // Writing password interactively
        process.stdin.writeln(pass);

        await Future.delayed(Duration(seconds: 1), () {
          // Writing password interactively
          process.stdin.writeln(pass);
        });
        await Future.delayed(Duration(seconds: 1), () {
          // Writing password interactively
          process.stdin.writeln(pass);
        });
      }

      printDebug('Process started with PID: ${process.pid}');

      // Handle process output
      process.stdout.transform<String>(utf8.decoder).listen((data) {
        printDebug('Daemon stdout: $data');
        emit(DaemonSuccess(data));
      });

      process.stderr.transform<String>(utf8.decoder).listen((data) {
        if (kDebugMode) {
          printDebug('Daemon stderr: $data');
        }
        if (!data.contains('new block committed')) {
          emit(DaemonError(data));
        }
      });
      await process.exitCode.then((code) {
        printDebug('Process exited with code: $code');
        if (code != 0) {
          emit(DaemonError('Process exited with code: $code'));
        }
      });
    } on FileSystemException catch (e) {
      printDebug('File system error: ${e.message}');
      emit(DaemonError('File system error: ${e.message}'));
    } on ProcessException catch (e) {
      printDebug('Process execution error: ${e.message}');
      emit(DaemonError('Process error: ${e.message}'));
    } on Exception catch (e) {
      printDebug('Unexpected error: $e');
      emit(DaemonError('Exception occurred: $e'));
    }
  }

  Future<void> runStartNodeCommand({required CliCommand cliCommand}) async {
    emit(DaemonLoading());

    try {
      final executablePath = _executablePath(cliCommand.command);
      _ensureExecutablePermissions(executablePath);

      final process = await Process.start(
        executablePath,
        cliCommand.arguments,
        workingDirectory: _executableDir(),
      );

      process.stderr.transform<String>(utf8.decoder).listen((data) {
        if (kDebugMode) {
          printDebug('DATA--->:$data');
        }
        if (data.contains(CliConstants.grpcServerStarted)) {
          emit(DaemonSuccess(data));
        }
      });

      process.stdout.transform<String>(utf8.decoder).listen((data) {
        if (kDebugMode) {
          printDebug('DATA--->:$data');
        }

        if (data.toLowerCase().contains('another instance is running') ||
            data.toLowerCase().contains('could not start grpc server:')) {
          emit(DaemonError('The node is locked'));
        }
        if (data.contains('invalid password')) {
          emit(DaemonError(data));
        }
      });

      // await process.exitCode.then((code) {
      //   printDebug('Process exited with code: $code');
      //   if (code != 0) {
      //     emit(DaemonError('Process exited with code: $code'));
      //   }
      // });
      //
    } on Exception catch (_) {}
  }

  String _executableDir() {
    final scriptDir = dirname(Platform.script.toFilePath());
    final executableDir = _getNativeResourcesPath(scriptDir);
    return executableDir;
  }

  String _matchOsCommand(String command) {
    final result = Platform.isWindows ? '$command.exe' : command;
    return result;
  }

  String _executablePath(String command) {
    return join(_executableDir(), _matchOsCommand(command));
  }
}
