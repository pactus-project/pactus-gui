import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:pactus_gui/src/core/utils/node_lock_manager/directory_manager.dart';

part 'unlocker_state.dart';

class UnlockNodeCubit extends Cubit<UnlockerState> {
  UnlockNodeCubit() : super(UnlockerInitial());

  Future<void> unlock() async {
    emit(UnlockerLoading());

    try {
      await Future.wait([
        _killPactusDaemon(),
        _removeLock(),
      ]);

      emit(UnlockerSuccess());
    } on Exception catch (e) {
      emit(UnlockerFailed(e.toString()));
    }
  }

  Future<void> _killPactusDaemon() async {
    await DirectoryManager().killDaemonProcess(DaemonFileEnum.pactusDaemon);
  }

  Future<void> _removeLock() async {
    await DirectoryManager().removeLockFile();
  }
}
