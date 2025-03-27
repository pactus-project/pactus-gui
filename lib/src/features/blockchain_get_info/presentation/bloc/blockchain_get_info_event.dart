part of 'blockchain_get_info_bloc.dart';

@freezed
class BlockchainGetInfoEvent with _$BlockchainGetInfoEvent {
  const factory BlockchainGetInfoEvent.fetch() = FetchBlockchainInfo;
  const factory BlockchainGetInfoEvent.fetchStream() =
      FetchBlockchainInfoStream;
}
