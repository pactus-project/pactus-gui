import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_data_state.freezed.dart';

@freezed
class RemoteDataState<T> with _$RemoteDataState<T> {
  factory RemoteDataState.success({
    T? remoteData,
    String? error,
  }) = RemoteDataSuccess<T>;

  factory RemoteDataState.failed({
    T? remoteData,
    String? error,
  }) = RemoteDataFailed<T>;
}
