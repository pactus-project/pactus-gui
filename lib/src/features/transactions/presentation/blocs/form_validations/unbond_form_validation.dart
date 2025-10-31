import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

class UnBondFormValidation extends Cubit<_UnBondFormState> {
  UnBondFormValidation() : super(_UnBondFormState());

  // INDIVIDUAL SETTERS - Update single field
  void setValidator(String validator) {
    emit(state.copyWith(validator: validator));
  }

  void setMemo(String memo) {
    emit(state.copyWith(memo: memo));
  }

  // BATCH SETTER - Update multiple fields at once
  void updateForm({String? validator, String? memo}) {
    emit(state.copyWith(validator: validator, memo: memo));
  }

  // RESET methods
  void resetForm() {
    emit(_UnBondFormState());
  }

  // VALIDATION methods
  bool get isFormValid {
    return state.validator != null && state.validator!.isNotEmpty;
    // Memo is optional, so no validation needed
  }

  bool get isValidatorValid =>
      state.validator != null && state.validator!.isNotEmpty;

  // Get form data as Map (useful for APIs)
  Map<String, dynamic> toJson() {
    return {'validator': state.validator, 'memo': state.memo};
  }
}

class _UnBondFormState {
  _UnBondFormState({this.validator, this.memo});

  final String? validator;
  final String? memo;

  // Manual copyWith implementation
  _UnBondFormState copyWith({String? validator, String? memo}) {
    return _UnBondFormState(
      validator: validator ?? this.validator,
      memo: memo ?? this.memo,
    );
  }

  // Convert to Map for JSON serialization
  Map<String, dynamic> toJson() {
    return {'validator': validator, 'memo': memo};
  }
}
