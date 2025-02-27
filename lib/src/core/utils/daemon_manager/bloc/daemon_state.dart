abstract class DaemonState {}

class DaemonInitial extends DaemonState {}

class DaemonLoading extends DaemonState {}

class DaemonSuccess extends DaemonState {
  DaemonSuccess(this.output);
  final String output;
}

class DaemonError extends DaemonState {
  DaemonError(this.error);
  final String error;
}
