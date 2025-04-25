import 'package:bloc/bloc.dart';
import 'package:pactus_gui/src/core/enums/app_environment.dart';
import 'package:pactus_gui/src/features/dev_mode/data/repositories/environment_repository.dart';

part 'directory_check_event.dart';
part 'directory_check_state.dart';

class DirectoryCheckBloc
    extends Bloc<DirectoryCheckEvent, DirectoryCheckState> {
  DirectoryCheckBloc() : super(DirectoryCheckState.initial()) {
    on<ResetBlocEvent>(_handleReset);
    on<CheckDirectoryEvent>(_handleCheckDirectory);
  }

  void _handleReset(ResetBlocEvent event, Emitter<DirectoryCheckState> emit) {
    emit(DirectoryCheckState.initial());
  }

  Future<void> _handleCheckDirectory(
    CheckDirectoryEvent event,
    Emitter<DirectoryCheckState> emit,
  ) async {
    // Start loading
    emit(
      _updateStateForNetwork(
        event.networkType,
        (status) => status.copyWith(isLoading: true),
      ),
    );

    try {
      final isReady = await EnvironmentRepository().isDirectoryReadyForNode(
        latestPartOfPath: event.latestPartOfPath,
      );

      emit(
        _updateStateForNetwork(
          event.networkType,
          (status) => status.copyWith(
            isLoading: false,
            isReady: isReady,
          ),
        ),
      );
    } on Exception catch (e) {
      emit(
        _updateStateForNetwork(
          event.networkType,
          (status) => status.copyWith(
            isLoading: false,
            error: e.toString(),
          ),
        ),
      );
    }
  }

  DirectoryCheckState _updateStateForNetwork(
    AppEnvironment networkType,
    NetworkCheckStatus Function(NetworkCheckStatus) updater,
  ) {
    final newStatuses = Map<AppEnvironment, NetworkCheckStatus>.from(
      state.networkStatuses,
    );
    newStatuses[networkType] = updater(newStatuses[networkType]!);
    return DirectoryCheckState(newStatuses);
  }
}
