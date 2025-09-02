part of 'get_validator_bloc.dart';

@freezed
class GetValidatorState with _$GetValidatorState {
  const factory GetValidatorState.initial() = _Initial;
  const factory GetValidatorState.loading() = _Loading;
  const factory GetValidatorState.loaded(GetValidatorEntity data) = _Loaded;
  const factory GetValidatorState.error(String error) = _Error;
}
