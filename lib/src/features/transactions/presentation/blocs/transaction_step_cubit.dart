import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:pactus_gui/src/core/enums/app_enums.dart' show TransactionStep;

class TransactionStepCubit extends Cubit<TransactionStep> {
  TransactionStepCubit() : super(TransactionStep.transactionForm);

  void goToForm() => emit(TransactionStep.transactionForm);

  void goToConfirmation() => emit(TransactionStep.confirmation);

  void goToResult() => emit(TransactionStep.result);

  void next() {
    switch (state) {
      case TransactionStep.transactionForm:
        emit(TransactionStep.confirmation);
      case TransactionStep.confirmation:
        emit(TransactionStep.result);
      case TransactionStep.result:
        // Stay on result or go back to form
        emit(TransactionStep.transactionForm);
    }
  }

  void previous() {
    switch (state) {
      case TransactionStep.result:
        emit(TransactionStep.confirmation);
      case TransactionStep.confirmation:
        emit(TransactionStep.transactionForm);
      case TransactionStep.transactionForm:
        // Stay on form
        break;
    }
  }
}
