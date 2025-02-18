import 'package:flutter_bloc/flutter_bloc.dart';

class ValidatorQtyCubit extends Cubit<String> {
  ValidatorQtyCubit() : super('select');

  void setQty(String qty) {
    emit(qty);
  }
}
