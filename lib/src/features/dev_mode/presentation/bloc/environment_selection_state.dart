import 'package:gui/src/core/enums/app_environment.dart';

class EnvironmentSelectionState {
  EnvironmentSelectionState({
    this.selectedEnvironment,
    this.isLoading = false,
    this.password,
    this.seeds,
  });
  final AppEnvironment? selectedEnvironment;
  final bool isLoading;
  final String? password;
  final String? seeds;

  EnvironmentSelectionState copyWith({
    AppEnvironment? selectedEnvironment,
    String? password,
    String? seeds,
    bool? isLoading,
  }) {
    return EnvironmentSelectionState(
      selectedEnvironment: selectedEnvironment ?? this.selectedEnvironment,
      isLoading: isLoading ?? this.isLoading,
      password: password ?? this.password,
      seeds: seeds ?? this.seeds,
    );
  }
}
