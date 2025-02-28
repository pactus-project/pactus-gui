import 'package:bloc/bloc.dart';

class StepValidationCubit extends Cubit<Map<int, bool>> {
  StepValidationCubit() : super({});

  void setStepValid({required int stepIndex, required bool isValid}) {
    emit({...state, stepIndex: isValid});
  }

  bool isStepValid(int stepIndex) {
    return state[stepIndex] ?? false;
  }
}
