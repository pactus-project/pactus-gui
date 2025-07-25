import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:gui/src/data/models/node_details.dart';
import 'package:gui/src/features/blockchain_get_info/data/data_sources/blockchain_remote_data_source.dart';
import 'package:gui/src/features/blockchain_get_info/data/repositories/blockchain_repository_impl.dart';
import 'package:gui/src/features/blockchain_get_info/data/services/blockchain_service.dart';
import 'package:gui/src/features/blockchain_get_info/domain/repositories/blockchain_repository.dart';
import 'package:gui/src/features/blockchain_get_info/domain/use_cases/get_blockchain_info_use_case.dart';
import 'package:gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/data/data_sources/transfer_transaction_remote_data_source.dart';
import 'package:gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/data/services/transfer_transaction_service.dart';
import 'package:gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/data/repositories/transfer_transaction_repository_impl.dart';
import 'package:gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/domain/repositories/transfer_transaction_repository.dart';
import 'package:gui/src/features/transaction/sub_modules/get_raw_transfer_transaction/domain/use_cases/get_transfer_transaction_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupSharedPreferences({SharedPreferences? param}) async {
  SharedPreferences? prefs;
  if (param == null) {
    prefs = await SharedPreferences.getInstance();
  } else {
    prefs = param;
  }
  GetIt.instance.registerSingleton<SharedPreferences>(prefs);
}

Future<void> setupDependencies() async {
  // Register `ClientChannel` as factory
  getIt
    ..registerFactory<ClientChannel>(() {
      final nodeDetails = getIt<NodeDetails>();

      return ClientChannel(
        nodeDetails.ip,
        port: nodeDetails.port,
        options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
        ),
      );
    })

    // Register `services`
    ..registerSingleton<BlockchainService>(BlockchainService())
    ..registerSingleton<TransferTransactionService>(
      TransferTransactionService(),
    )

    // Register `DataSources`
    ..registerSingleton<BlockchainRemoteDataSource>(
      BlockchainRemoteDataSourceImpl(getIt()),
    )
    ..registerSingleton<TransferTransactionRemoteDataSource>(
      TransferTransactionRemoteDataSourceImpl(getIt()),
    )

    // Register `Repositories`
    ..registerSingleton<BlockchainRepository>(
      BlockchainRepositoryImpl(getIt()),
    )
    ..registerSingleton<TransferTransactionRepository>(
      TransferTransactionRepositoryImpl(getIt()),
    )

    // Register `UseCases`
    ..registerSingleton<GetBlockchainInfoUseCase>(
      GetBlockchainInfoUseCase(getIt()),
    )
    ..registerSingleton<GetTransferTransactionUseCase>(
      GetTransferTransactionUseCase(getIt()),
    );
}
