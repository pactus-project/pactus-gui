part of 'unlock_node_cubit.dart';

abstract class UnlockerState {}

class UnlockerInitial extends UnlockerState {}

class UnlockerLoading extends UnlockerState {}

class UnlockerSuccess extends UnlockerState {}

class UnlockerFailed extends UnlockerState {
  UnlockerFailed(this.error);
  final String error;
}
