import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/enums/app_environment.dart';
import 'package:gui/src/features/dev_mode/presentation/bloc/environment_selection_state.dart';

class EnvironmentSelectionCubit extends Cubit<EnvironmentSelectionState> {
  EnvironmentSelectionCubit() : super(EnvironmentSelectionState());

  void selectEnvironment(AppEnvironment? env) {
    emit(state.copyWith(selectedEnvironment: env));
  }

  void setPassword(String? password) {
    emit(state.copyWith(password: password));
  }

  void setSeeds(String? seeds) {
    emit(state.copyWith(seeds: seeds));
  }


  void clear () {
    emit(EnvironmentSelectionState());
  }
}
