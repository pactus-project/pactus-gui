part of 'get_transfer_bloc.dart';

@freezed
class GetTransferState with _$GetTransferState {
  const factory GetTransferState.initial() = _Initial;
  const factory GetTransferState.loading() = _Loading;
  const factory GetTransferState.loaded(TransferTransactionEntity data) =
      _Loaded;
  const factory GetTransferState.error(String message) = _Error;
}
