part of 'get_node_info_bloc.dart';

@freezed
class GetNodeInfoState with _$GetNodeInfoState {
  const factory GetNodeInfoState.initial() = _Initial;
  const factory GetNodeInfoState.loading() = _Loading;
  const factory GetNodeInfoState.loaded(GetNodeInfoEntity data) = _Loaded;
  const factory GetNodeInfoState.error(String error) = _Error;
}
