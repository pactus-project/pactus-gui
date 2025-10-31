import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

class WithdrawFormValidation extends Cubit<_WithdrawFormState> {
  WithdrawFormValidation() : super(_WithdrawFormState());

  // INDIVIDUAL SETTERS - Update single field
  void setValidator(String validator) {
    emit(state.copyWith(validator: validator));
  }

  void setRecipient(String recipient) {
    emit(state.copyWith(recipient: recipient));
  }

  void setMemo(String memo) {
    emit(state.copyWith(memo: memo));
  }

  void setStake(String stake) {
    emit(state.copyWith(stake: stake));
  }

  void setFee(String fee) {
    emit(state.copyWith(fee: fee));
  }

  // BATCH SETTER - Update multiple fields at once
  void updateForm({
    String? validator,
    String? recipient,
    String? memo,
    String? stake,
    String? fee,
  }) {
    emit(
      state.copyWith(
        validator: validator,
        recipient: recipient,
        memo: memo,
        stake: stake,
        fee: fee,
      ),
    );
  }

  // RESET methods
  void resetForm() {
    emit(_WithdrawFormState());
  }

  // VALIDATION methods
  bool get isFormValid {
    return state.validator != null &&
        state.validator!.isNotEmpty &&
        state.recipient != null &&
        state.recipient!.isNotEmpty &&
        state.stake != null &&
        state.stake!.isNotEmpty;
  }

  bool get isValidatorValid =>
      state.validator != null && state.validator!.isNotEmpty;
  bool get isRecipientValid =>
      state.recipient != null && state.recipient!.isNotEmpty;
  bool get isStakeValid => state.stake != null && state.stake!.isNotEmpty;
  bool get isFeeValid => state.fee != null && state.fee!.isNotEmpty;

  // Get form data as Map (useful for APIs)
  Map<String, dynamic> toJson() {
    return {
      'validator': state.validator,
      'recipient': state.recipient,
      'memo': state.memo,
      'stake': state.stake,
      'fee': state.fee,
    };
  }
}

class _WithdrawFormState {
  _WithdrawFormState({
    this.validator,
    this.recipient,
    this.memo,
    this.stake,
    this.fee,
  });

  final String? validator;
  final String? recipient;
  final String? memo;
  final String? stake;
  final String? fee;

  // Manual copyWith implementation
  _WithdrawFormState copyWith({
    String? validator,
    String? recipient,
    String? memo,
    String? stake,
    String? fee,
  }) {
    return _WithdrawFormState(
      validator: validator ?? this.validator,
      recipient: recipient ?? this.recipient,
      memo: memo ?? this.memo,
      stake: stake ?? this.stake,
      fee: fee ?? this.fee,
    );
  }

  // Convert to Map for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'validator': validator,
      'recipient': recipient,
      'memo': memo,
      'stake': stake,
      'fee': fee,
    };
  }
}
