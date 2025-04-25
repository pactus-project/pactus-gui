import 'package:pactus_gui/src/core/enums/app_environment.dart';
import 'package:pactus_gui/src/data/models/app_config/app_config.dart';

class TestnetConfig implements AppConfig {
  TestnetConfig();

  @override
  final AppEnvironment environment = AppEnvironment.testnet;
}
