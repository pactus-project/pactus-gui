part of 'directory_check_bloc.dart';

abstract class DirectoryCheckEvent {}

class CheckDirectoryEvent extends DirectoryCheckEvent {
  CheckDirectoryEvent({
    required this.latestPartOfPath,
    required this.networkType,
  });
  final String latestPartOfPath;
  final AppEnvironment networkType;
}

class ResetBlocEvent extends DirectoryCheckEvent {
  ResetBlocEvent();
}
