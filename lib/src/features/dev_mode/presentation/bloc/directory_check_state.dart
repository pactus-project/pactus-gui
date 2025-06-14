part of 'directory_check_bloc.dart';

class DirectoryCheckState {
  const DirectoryCheckState(this.networkStatuses);

  factory DirectoryCheckState.initial() {
    return DirectoryCheckState({
      AppEnvironment.mainnet: NetworkCheckStatus.initial(),
      AppEnvironment.testnet: NetworkCheckStatus.initial(),
      AppEnvironment.localnet: NetworkCheckStatus.initial(),
    });
  }
  final Map<AppEnvironment, NetworkCheckStatus> networkStatuses;
}

class NetworkCheckStatus {
  const NetworkCheckStatus({this.isLoading = false, this.isReady, this.error});

  const NetworkCheckStatus.initial()
    : isLoading = false,
      isReady = null,
      error = null;
  final bool isLoading;
  final bool? isReady;
  final String? error;

  NetworkCheckStatus copyWith({bool? isLoading, bool? isReady, String? error}) {
    return NetworkCheckStatus(
      isLoading: isLoading ?? this.isLoading,
      isReady: isReady ?? this.isReady,
      error: error ?? this.error,
    );
  }
}

/*
abstract class DirectoryCheckState {
  const DirectoryCheckState({this.networkType});
  final AppEnvironment? networkType;
}

class DirectoryCheckInitial extends DirectoryCheckState {}

class DirectoryCheckLoading extends DirectoryCheckState {
  DirectoryCheckLoading(AppEnvironment networkType)
      : super(networkType: networkType);
}

class DirectoryCheckLoaded extends DirectoryCheckState {
  DirectoryCheckLoaded({
    required super.networkType,
    required this.isReady,
  });
  final bool isReady;
}

class DirectoryCheckError extends DirectoryCheckState {
  DirectoryCheckError({
    required super.networkType,
    required this.error,
  });
  final String error;
}
*/
