import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pactus_grpc/exports/blockchain.dart'
    show GetValidatorRequest;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pactus_gui/src/core/enums/app_enums.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/domain/entities/get_validator_entity.dart'
    show GetValidatorEntity;
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/domain/use_cases/get_validator_use_case.dart'
    show GetValidatorUseCase;

part 'get_validator_bloc.freezed.dart';
part 'get_validator_event.dart';
part 'get_validator_state.dart';

class GetValidatorBloc extends Bloc<GetValidatorEvent, GetValidatorState> {
  GetValidatorBloc(this._getValidatorUseCase)
    : super(const GetValidatorState.initial()) {
    on<FetchGetValidator>(_onFetchGetValidator);
    on<FetchGetValidatorStream>(_onFetchGetValidatorStream);
  }
  final GetValidatorUseCase _getValidatorUseCase;

  Future<void> _onFetchGetValidator(
    FetchGetValidator event,
    Emitter<GetValidatorState> emit,
  ) async {
    emit(const GetValidatorState.loading());
    final result = await _getValidatorUseCase(params: event.params);

    result.fold(
      (errorState) => emit(GetValidatorState.error(errorState.message)),
      (successState) => emit(GetValidatorState.loaded(successState)),
    );
  }

  Future<void> _onFetchGetValidatorStream(
    FetchGetValidatorStream event,
    Emitter<GetValidatorState> emit,
  ) async {
    num runCounter = 0;
    emit(const GetValidatorState.loading());

    while (true) {
      // Loop while _isFetching is true.
      final result = await _getValidatorUseCase(params: event.params);

      result.fold(
        (errorState) => emit(GetValidatorState.error(errorState.message)),
        (successState) => emit(GetValidatorState.loaded(successState)),
      );
      runCounter++;

      await Future<void>.delayed(
        runCounter == 1
            ? DelayTime.fiveSeconds.duration
            : DelayTime.tenSeconds.duration,
      ); // 10-second delay
    }
  }
}
