import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:pactus_gui/src/core/enums/app_enums.dart' show TransactionType;

class TransactionTypeCubit extends Cubit<TransactionType> {
  TransactionTypeCubit() : super(TransactionType.transfer);

  void selectWithdraw() => emit(TransactionType.withdraw);

  void selectBond() => emit(TransactionType.bond);

  void selectUnbond() => emit(TransactionType.unbond);

  void selectTransfer() => emit(TransactionType.transfer);

  // New method to select by TransactionType
  void selectType(TransactionType type) => emit(type);
}
