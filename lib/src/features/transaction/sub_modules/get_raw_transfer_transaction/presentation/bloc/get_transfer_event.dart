part of 'get_transfer_bloc.dart';

@freezed
class GetTransferEvent with _$GetTransferEvent {
  const factory GetTransferEvent.getResponse({
    required TransferTransactionParams params,
  }) = _GetResponse;

  const factory GetTransferEvent.resetBloc() = _ResetBloc;
}
