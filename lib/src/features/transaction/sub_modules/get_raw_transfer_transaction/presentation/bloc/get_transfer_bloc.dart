import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/data/params/transfer_transaction_params.dart';
import 'package:gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/domain/entities/transfer_transaction_entity.dart';
import 'package:gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/domain/use_cases/get_transfer_transaction_use_case.dart';

part 'get_transfer_bloc.freezed.dart';
part 'get_transfer_event.dart';
part 'get_transfer_state.dart';

class GetTransferBloc extends Bloc<GetTransferEvent, GetTransferState> {
  GetTransferBloc(this._getTransferUseCase)
      : super(const GetTransferState.initial()) {
    on<GetTransferEvent>((event, emit) async {
      await event.when(
        getResponse: (params) async {
          emit(const GetTransferState.loading());

          final result = await _getTransferUseCase(params: params);

          result.fold(
            (errorState) => emit(
              GetTransferState.error(
                errorState.remoteData?.msg ?? '',
              ),
            ),
            (successState) => emit(
              GetTransferState.loaded(
                successState.remoteData!,
              ),
            ),
          );
        },
        resetBloc: () async => emit(const GetTransferState.initial()),
      );
    });
  }

  final GetTransferTransactionUseCase _getTransferUseCase;
}
