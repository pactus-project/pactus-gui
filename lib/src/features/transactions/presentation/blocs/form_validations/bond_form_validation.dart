import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

class BondFormValidation extends Cubit<_BondFormState> {
  BondFormValidation() : super(_BondFormState());

  // INDIVIDUAL SETTERS - Update single field
  void setSender(String sender) {
    emit(state.copyWith(sender: sender));
  }

  void setValidatorAddress(String validatorAddress) {
    emit(state.copyWith(validatorAddress: validatorAddress));
  }

  void setValidatorPublicKey(String validatorPublicKey) {
    emit(state.copyWith(validatorPublicKey: validatorPublicKey));
  }

  void setMemo(String memo) {
    emit(state.copyWith(memo: memo));
  }

  void setAmount(String amount) {
    emit(state.copyWith(amount: amount));
  }

  void setFee(String fee) {
    emit(state.copyWith(fee: fee));
  }

  // BATCH SETTER - Update multiple fields at once
  void updateForm({
    String? sender,
    String? validatorAddress,
    String? validatorPublicKey,
    String? memo,
    String? amount,
    String? fee,
  }) {
    emit(
      state.copyWith(
        sender: sender,
        validatorAddress: validatorAddress,
        validatorPublicKey: validatorPublicKey,
        memo: memo,
        amount: amount,
        fee: fee,
      ),
    );
  }

  // RESET methods
  void resetForm() {
    emit(_BondFormState());
  }

  // VALIDATION methods
  bool get isFormValid {
    return state.sender != null &&
        state.sender!.isNotEmpty &&
        state.validatorAddress != null &&
        state.validatorAddress!.isNotEmpty &&
        state.amount != null &&
        state.amount!.isNotEmpty;
  }

  bool get isSenderValid => state.sender != null && state.sender!.isNotEmpty;
  bool get isValidatorAddressValid =>
      state.validatorAddress != null && state.validatorAddress!.isNotEmpty;
  bool get isValidatorPublicKeyValid =>
      state.validatorPublicKey != null && state.validatorPublicKey!.isNotEmpty;
  bool get isAmountValid => state.amount != null && state.amount!.isNotEmpty;
  bool get isFeeValid => state.fee != null && state.fee!.isNotEmpty;

  // Get form data as Map (useful for APIs)
  Map<String, dynamic> toJson() {
    return {
      'sender': state.sender,
      'validatorAddress': state.validatorAddress,
      'validatorPublicKey': state.validatorPublicKey,
      'memo': state.memo,
      'amount': state.amount,
      'fee': state.fee,
    };
  }
}

class _BondFormState {
  _BondFormState({
    this.sender,
    this.validatorAddress,
    this.validatorPublicKey,
    this.memo,
    this.amount,
    this.fee,
  });

  final String? sender;
  final String? validatorAddress;
  final String? validatorPublicKey;
  final String? memo;
  final String? amount;
  final String? fee;

  // Manual copyWith implementation
  _BondFormState copyWith({
    String? sender,
    String? validatorAddress,
    String? validatorPublicKey,
    String? memo,
    String? amount,
    String? fee,
  }) {
    return _BondFormState(
      sender: sender ?? this.sender,
      validatorAddress: validatorAddress ?? this.validatorAddress,
      validatorPublicKey: validatorPublicKey ?? this.validatorPublicKey,
      memo: memo ?? this.memo,
      amount: amount ?? this.amount,
      fee: fee ?? this.fee,
    );
  }

  // Convert to Map for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'validatorAddress': validatorAddress,
      'validatorPublicKey': validatorPublicKey,
      'memo': memo,
      'amount': amount,
      'fee': fee,
    };
  }
}
