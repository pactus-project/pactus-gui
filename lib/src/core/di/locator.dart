import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:pactus_gui/src/data/models/node_details.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/blockchain_get_info/data/repositories/blockchain_repository_impl.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/blockchain_get_info/data/services/blockchain_service.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/blockchain_get_info/domain/repositories/blockchain_repository.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/blockchain_get_info/domain/use_cases/get_blockchain_info_use_case.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/data/repositories/get_node_info_repository_impl.dart'
    show GetNodeInfoRepositoryImpl;
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/data/services/get_node_info_service.dart'
    show GetNodeInfoService;
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/domain/repositories/get_node_info_repository.dart'
    show GetNodeInfoRepository;
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_node_info/domain/use_cases/get_node_info_use_case.dart'
    show GetNodeInfoUseCase;
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/data/repositories/get_validator_repository_impl.dart'
    show GetValidatorRepositoryImpl;
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/data/services/get_validator_service.dart'
    show GetValidatorService;
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/domain/repositories/get_validator_repository.dart'
    show GetValidatorRepository;
import 'package:pactus_gui/src/features/dashboard/sub_modules/get_validator/domain/use_cases/get_validator_use_case.dart'
    show GetValidatorUseCase;

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
    ..registerSingleton<GetNodeInfoService>(GetNodeInfoService())
    ..registerSingleton<GetValidatorService>(GetValidatorService())
    ..registerSingleton<BlockchainService>(BlockchainService())
    // Register `Repositories`
    ..registerSingleton<GetNodeInfoRepository>(
      GetNodeInfoRepositoryImpl(getIt()),
    )
    ..registerSingleton<BlockchainRepository>(BlockchainRepositoryImpl(getIt()))
    ..registerSingleton<GetValidatorRepository>(
      GetValidatorRepositoryImpl(getIt()),
    )
    // Register `UseCases`
    ..registerSingleton<GetNodeInfoUseCase>(GetNodeInfoUseCase(getIt()))
    ..registerSingleton<GetValidatorUseCase>(GetValidatorUseCase(getIt()))
    ..registerSingleton<GetBlockchainInfoUseCase>(
      GetBlockchainInfoUseCase(getIt()),
    );
}
