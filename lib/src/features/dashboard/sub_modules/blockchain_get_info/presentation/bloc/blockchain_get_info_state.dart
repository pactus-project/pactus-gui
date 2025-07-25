part of 'blockchain_get_info_bloc.dart';

@freezed
class BlockchainGetInfoState with _$BlockchainGetInfoState {
  const factory BlockchainGetInfoState.initial() = _Initial;
  const factory BlockchainGetInfoState.loading() = _Loading;
  const factory BlockchainGetInfoState.loaded(BlockchainInfoEntity data) =
      _Loaded;
  const factory BlockchainGetInfoState.error(String error) = _Error;
}
