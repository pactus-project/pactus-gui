part of 'daemon_manager_bloc.dart';

sealed class DaemonManagerState {
  const DaemonManagerState();
}

class DaemonManagerInitial extends DaemonManagerState {
  const DaemonManagerInitial();
}

class DaemonManagerLoading extends DaemonManagerState {
  const DaemonManagerLoading();
}

class DaemonManagerSuccess extends DaemonManagerState {
  const DaemonManagerSuccess(this.output);
  final String output;
}

class DaemonManagerError extends DaemonManagerState {
  DaemonManagerError(this.error) : timestamp = DateTime.now();

  final String error;

  final DateTime timestamp; // Add this line
}
