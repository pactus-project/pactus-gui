part of 'daemon_manager_bloc.dart';

abstract class DaemonManagerEvent {
  const DaemonManagerEvent();
}

class RunDaemonCommand extends DaemonManagerEvent {
  const RunDaemonCommand({required this.cliCommand});
  final CliCommand cliCommand;
}

class RunStartNodeCommand extends DaemonManagerEvent {
  const RunStartNodeCommand({required this.cliCommand});
  final CliCommand cliCommand;
}
