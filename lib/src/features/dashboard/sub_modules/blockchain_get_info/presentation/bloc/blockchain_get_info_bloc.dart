import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pactus_gui/src/core/enums/app_enums.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/blockchain_get_info/domain/entities/blockchain_info_entity.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/blockchain_get_info/domain/use_cases/get_blockchain_info_use_case.dart';

part 'blockchain_get_info_bloc.freezed.dart';
part 'blockchain_get_info_event.dart';
part 'blockchain_get_info_state.dart';

class BlockchainGetInfoBloc
    extends Bloc<BlockchainGetInfoEvent, BlockchainGetInfoState> {
  BlockchainGetInfoBloc(this._getBlockchainInfoUseCase)
    : super(const BlockchainGetInfoState.initial()) {
    on<FetchBlockchainInfo>(_onFetchBlockchainInfo);
    on<FetchBlockchainInfoStream>(_onFetchBlockchainInfoStream);
  }
  final GetBlockchainInfoUseCase _getBlockchainInfoUseCase;

  Future<void> _onFetchBlockchainInfo(
    FetchBlockchainInfo event,
    Emitter<BlockchainGetInfoState> emit,
  ) async {
    emit(const BlockchainGetInfoState.loading());
    final result = await _getBlockchainInfoUseCase();

    result.fold(
      (errorState) =>
          emit(BlockchainGetInfoState.error(errorState.remoteData?.msg ?? '')),
      (successState) =>
          emit(BlockchainGetInfoState.loaded(successState.remoteData!)),
    );
  }

  Future<void> _onFetchBlockchainInfoStream(
    FetchBlockchainInfoStream event,
    Emitter<BlockchainGetInfoState> emit,
  ) async {
    num runCounter = 0;
    emit(const BlockchainGetInfoState.loading());

    while (true) {
      // Loop while _isFetching is true.
      final result = await _getBlockchainInfoUseCase();

      result.fold(
        (errorState) => emit(
          BlockchainGetInfoState.error(errorState.remoteData?.msg ?? ''),
        ),
        (successState) =>
            emit(BlockchainGetInfoState.loaded(successState.remoteData!)),
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
