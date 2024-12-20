import 'package:flutter_bloc/flutter_bloc.dart';

class MasterPasswordHandlerCubit extends Cubit<bool> {
  MasterPasswordHandlerCubit() : super(true);

  void toggleVisibility() => emit(!state);
}
