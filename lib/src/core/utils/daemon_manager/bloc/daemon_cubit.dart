import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_state.dart';
import 'package:path/path.dart' show dirname;

/// [DaemonCubit] Documentation:
/// `DaemonCubit` manages the execution of the Pactus daemon process.
/// It extends `Cubit<DaemonState>` and provides methods to run the daemon
/// while handling its execution state.
///
/// ## Features:
/// - Runs the Pactus daemon using a given command and arguments.
/// - Emits different states (`DaemonLoading`, `DaemonSuccess`, `DaemonError`)
///   based on the execution outcome.
/// - Handles standard output and errors from the process.
///
/// ## Usage:
/// ```dart
/// final daemonCubit = DaemonCubit();
/// daemonCubit.runPactusDaemon(command: 'pactusd', arguments: ['--start']);
/// ```
///
/// ## Notes:
/// - The working directory is set to a Linux-specific path.
/// - Needs adaptation for other operating systems.
/// - Handles exceptions and errors gracefully.
class DaemonCubit extends Cubit<DaemonState> {
  DaemonCubit() : super(DaemonInitial());

  /// [runPactusDaemon] Documentation:
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
    // required String workingDirectory,
    required String command,
    required List<String> arguments,
  }) async {
    emit(DaemonLoading());

    try {
      final scriptDir = dirname(Platform.script.toFilePath());
// TODO(Esmaeil): this part need handled for another os
      final targetPath = '$scriptDir/lib/src/core/native_resources/linux/';

      final result =
          await Process.run(command, arguments, workingDirectory: targetPath);
      if (result.exitCode == 0) {
        emit(DaemonSuccess('${result.stdout}'));
      } else {
        emit(DaemonError('${result.stderr}'));
      }
    } on Exception catch (e) {
      emit(DaemonError('Exception occurred: $e'));
    }
  }
}
