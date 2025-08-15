part of 'get_node_info_bloc.dart';

@freezed
class GetNodeInfoEvent with _$GetNodeInfoEvent {
  const factory GetNodeInfoEvent.fetch({required GetNodeInfoRequest params}) =
      FetchGetNodeInfo;
  const factory GetNodeInfoEvent.fetchStream({
    required GetNodeInfoRequest params,
  }) = FetchGetNodeInfoStream;
}
