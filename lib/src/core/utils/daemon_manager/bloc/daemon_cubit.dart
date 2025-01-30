import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_state.dart';
import 'package:path/path.dart' show dirname;

class DaemonCubit extends Cubit<DaemonState> {
  DaemonCubit() : super(DaemonInitial());

  Future<void> runPactusDaemon({
    // required String workingDirectory,
    required String command,
    required List<String> arguments,
  }) async {
    emit(DaemonLoading());

    try {
      // Get the directory of the script
      final scriptDir = dirname(Platform.script.toFilePath());

      final targetPath = '$scriptDir/lib/src/core/native_resources/linux/';

      // print('scriptDir: $targetPath');

      final result =
          await Process.run(command, arguments, workingDirectory: targetPath);
      if (result.exitCode == 0) {
        // دستور با موفقیت اجرا شد
        emit(DaemonSuccess('${result.stdout}'));
      } else {
        // دستور با خطا مواجه شد
        emit(DaemonError('${result.stderr}'));
      }
    } on Exception catch (e) {
      // برخورد با خطای استثنا
      emit(DaemonError('Exception occurred: $e'));
    }
  }
}
