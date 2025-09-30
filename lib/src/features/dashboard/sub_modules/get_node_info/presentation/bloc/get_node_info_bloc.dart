import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pactus_grpc/exports/network.dart'
    show GetNodeInfoRequest;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pactus_gui/src/core/enums/app_enums.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/domain/entities/get_node_info_entity.dart'
    show GetNodeInfoEntity;
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/domain/use_cases/get_node_info_use_case.dart'
    show GetNodeInfoUseCase;

part 'get_node_info_bloc.freezed.dart';
part 'get_node_info_event.dart';
part 'get_node_info_state.dart';

class GetNodeInfoBloc extends Bloc<GetNodeInfoEvent, GetNodeInfoState> {
  GetNodeInfoBloc(this._getNodeInfoUseCase)
    : super(const GetNodeInfoState.initial()) {
    on<FetchGetNodeInfo>(_onFetchGetNodeInfo);
    on<FetchGetNodeInfoStream>(_onFetchGetNodeInfoStream);
  }
  final GetNodeInfoUseCase _getNodeInfoUseCase;

  Future<void> _onFetchGetNodeInfo(
    FetchGetNodeInfo event,
    Emitter<GetNodeInfoState> emit,
  ) async {
    emit(const GetNodeInfoState.loading());
    final result = await _getNodeInfoUseCase(params: event.params);

    result.fold(
      (errorState) => emit(GetNodeInfoState.error(errorState.message)),
      (successState) => emit(GetNodeInfoState.loaded(successState)),
    );
  }

  Future<void> _onFetchGetNodeInfoStream(
    FetchGetNodeInfoStream event,
    Emitter<GetNodeInfoState> emit,
  ) async {
    num runCounter = 0;
    emit(const GetNodeInfoState.loading());

    while (true) {
      // Loop while _isFetching is true.
      final result = await _getNodeInfoUseCase(params: event.params);

      result.fold(
        (errorState) => emit(GetNodeInfoState.error(errorState.message)),
        (successState) => emit(GetNodeInfoState.loaded(successState)),
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
