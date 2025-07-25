import 'package:pactus_gui/src/data/models/generated/transaction.pb.dart';
import 'package:pactus_gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/domain/entities/transfer_transaction_entity.dart';
import '../models/transfer_transaction_model.dart';

class TransferTransactionMapper {
  TransferTransactionEntity toEntity(TransferTransactionModel model) {
    return TransferTransactionEntity(
      rawTransaction: model.rawTransaction,
      id: model.id,
    );
  }

  TransferTransactionModel fromResponse(GetRawTransactionResponse response) {
    return TransferTransactionModel(
      rawTransaction: response.rawTransaction,
      id: response.id,
    );
  }

  GetRawTransactionResponse toResponse(TransferTransactionModel model) {
    return GetRawTransactionResponse(
      rawTransaction: model.rawTransaction,
      id: model.id,
    );
  }
}
