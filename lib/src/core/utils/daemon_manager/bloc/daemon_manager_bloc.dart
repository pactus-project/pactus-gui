import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/constants/cli_constants.dart';
import 'package:pactus_gui/src/core/constants/storage_keys.dart';
import 'package:pactus_gui/src/core/enums/app_os_separator.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/cli_command.dart';
import 'package:pactus_gui/src/core/utils/storage_utils.dart';
import 'package:path/path.dart' show dirname, join;

part 'daemon_manager_event.dart';
part 'daemon_manager_state.dart';

class DaemonManagerBloc extends Bloc<DaemonManagerEvent, DaemonManagerState> {
  DaemonManagerBloc() : super(DaemonManagerInitial()) {
    on<RunDaemonCommand>(_onRunDaemonCommand);
    on<RunStartNodeCommand>(_onRunStartNodeCommand);
    on<RunGetNodeValidatorAddressesCommand>(_onRunGetNodeValidatorAddresses);
  }

  static String _executableDir() {
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

  static String _executablePath(String command) {
    return join(
      _executableDir(),
      Platform.isWindows ? '$command.exe' : command,
    );
  }

  static void _ensureExecutablePermissions(String executablePath) {
    if (Platform.isWindows) {
      return;
    }

    final file = File(executablePath);
    if (!file.existsSync()) {
      throw FileSystemException('Executable not found at: $executablePath');
    }

    if (file.statSync().mode & 0x111 == 0) {
      Process.runSync('chmod', ['+x', executablePath]);
    }
  }

  Future<void> _onRunDaemonCommand(
    RunDaemonCommand event,
    Emitter<DaemonManagerState> emit,
  ) async {
    emit(DaemonManagerLoading());

    try {
      final executablePath = _executablePath(event.cliCommand.command);
      _ensureExecutablePermissions(executablePath);

      final process = await Process.start(
        executablePath,
        event.cliCommand.arguments,
        workingDirectory: _executableDir(),
      );

      _handlePasswordInput(event.cliCommand, process);

      final outputSubscription =
          process.stdout.transform(utf8.decoder).listen((data) {
        if (data.startsWith('[ERROR]') || data.startsWith('invalid password')) {
          emit(DaemonManagerError(data));
        } else {
          emit(DaemonManagerSuccess(data));
        }
      });

      // final errorSubscription =
      //     process.stderr.transform(utf8.decoder).listen((data) {
      //   if (!data.contains('new block committed')) {
      //     emit(DaemonManagerError(data));
      //   }
      // });

      await process.exitCode.then((code) {
        if (code != 0) {
          emit(DaemonManagerError('Process exited with code: $code'));
        }
      });

      await outputSubscription.cancel();
      // await errorSubscription.cancel();
    } on FileSystemException catch (e) {
      emit(DaemonManagerError('File system error: ${e.message}'));
    } on ProcessException catch (e) {
      emit(DaemonManagerError('Process error: ${e.message}'));
    } on Exception catch (e) {
      emit(DaemonManagerError('Unexpected error: $e'));
    }
  }

  Future<void> _onRunStartNodeCommand(
    RunStartNodeCommand event,
    Emitter<DaemonManagerState> emit,
  ) async {
    try {
      final executablePath = _executablePath(event.cliCommand.command);
      _ensureExecutablePermissions(executablePath);

      final process = await Process.start(
        executablePath,
        event.cliCommand.arguments,
        workingDirectory: _executableDir(),
      );

      // Handle process output if needed
      process.stderr.transform(utf8.decoder).listen((_) {});
    } on Exception catch (_) {
      // Silently handle errors for start node command
    }
  }

  void _handlePasswordInput(CliCommand cliCommand, Process process) {
    if (cliCommand.command == CliConstants.pactusDaemon &&
        cliCommand.arguments.first == CliConstants.init &&
        !cliCommand.arguments.contains(CliConstants.password)) {
      process.stdin.writeln();
      Future.delayed(const Duration(seconds: 2), () => process.stdin.writeln());
    }

    if (cliCommand.command == CliConstants.pactusWallet &&
        cliCommand.arguments[0] == CliConstants.password) {
      final pass = cliCommand.arguments[2];
      process.stdin.writeln(pass);
      Future.delayed(
        const Duration(seconds: 1),
        () => process.stdin.writeln(pass),
      );
      Future.delayed(
        const Duration(seconds: 2),
        () => process.stdin.writeln(pass),
      );
    }
  }

  Future<void> _onRunGetNodeValidatorAddresses(
    RunGetNodeValidatorAddressesCommand event,
    Emitter<DaemonManagerState> emit,
  ) async {
    try {
      emit(DaemonManagerLoading());

      final executablePath = _executablePath(CliConstants.pactusWallet);
      _ensureExecutablePermissions(executablePath);
      final sign = AppOS.current.separator;

      final walletPath = '$sign${CliConstants.wallets}'
          '$sign${CliConstants.defaultWallet}';
      final storageKey = StorageKeys.nodeDirectory;

      final nodeDirectory = '${StorageUtils.getData<String>(
        storageKey,
      )}';

      final process = await Process.start(
        executablePath,
        [
          'address',
          'all',
          '--path',
          nodeDirectory + walletPath,
        ],
        workingDirectory: _executableDir(),
      );

      final output = await process.stdout.transform(utf8.decoder).join();
      emit(DaemonManagerSuccess(output));

      // Handle process output if needed
      process.stderr.transform(utf8.decoder).listen((res) {
        // Silently handle errors for start node command
        emit(DaemonManagerError(res));
      });
    } on Exception catch (e) {
      // Silently handle errors for start node command
      emit(DaemonManagerError(e.toString()));
    }
  }
}
