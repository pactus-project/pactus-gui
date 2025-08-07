part of 'get_validator_bloc.dart';

@freezed
class GetValidatorEvent with _$GetValidatorEvent {
  const factory GetValidatorEvent.fetch({required GetValidatorRequest params}) =
      FetchGetValidator;
  const factory GetValidatorEvent.fetchStream({
    required GetValidatorRequest params,
  }) = FetchGetValidatorStream;
}
