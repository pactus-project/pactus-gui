import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

class TransferFormValidation extends Cubit<_TransferFormState> {
  TransferFormValidation() : super(_TransferFormState());

  // INDIVIDUAL SETTERS - Update single field
  void setSender(String sender) {
    emit(state.copyWith(sender: sender));
  }

  void setRecipient(String recipient) {
    emit(state.copyWith(recipient: recipient));
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
    String? recipient,
    String? memo,
    String? amount,
    String? fee,
  }) {
    emit(
      state.copyWith(
        sender: sender,
        recipient: recipient,
        memo: memo,
        amount: amount,
        fee: fee,
      ),
    );
  }

  // RESET methods
  void resetForm() {
    emit(_TransferFormState());
  }

  // VALIDATION methods
  bool get isFormValid {
    return state.sender != null &&
        state.sender!.isNotEmpty &&
        state.recipient != null &&
        state.recipient!.isNotEmpty &&
        state.amount != null &&
        state.amount!.isNotEmpty;
  }

  bool get isSenderValid => state.sender != null && state.sender!.isNotEmpty;
  bool get isRecipientValid =>
      state.recipient != null && state.recipient!.isNotEmpty;
  bool get isAmountValid => state.amount != null && state.amount!.isNotEmpty;
  bool get isFeeValid => state.fee != null && state.fee!.isNotEmpty;

  // Get form data as Map (useful for APIs)
  Map<String, dynamic> toJson() {
    return {
      'sender': state.sender,
      'recipient': state.recipient,
      'memo': state.memo,
      'amount': state.amount,
      'fee': state.fee,
    };
  }
}

class _TransferFormState {
  _TransferFormState({
    this.sender,
    this.recipient,
    this.memo,
    this.amount,
    this.fee,
  });

  final String? sender;
  final String? recipient;
  final String? memo;
  final String? amount;
  final String? fee;

  // Manual copyWith implementation
  _TransferFormState copyWith({
    String? sender,
    String? recipient,
    String? memo,
    String? amount,
    String? fee,
  }) {
    return _TransferFormState(
      sender: sender ?? this.sender,
      recipient: recipient ?? this.recipient,
      memo: memo ?? this.memo,
      amount: amount ?? this.amount,
      fee: fee ?? this.fee,
    );
  }

  // Convert to Map for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'recipient': recipient,
      'memo': memo,
      'amount': amount,
      'fee': fee,
    };
  }
}
