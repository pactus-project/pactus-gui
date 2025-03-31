import 'package:gui/src/core/enums/app_environment.dart';
import 'package:gui/src/data/models/app_config/app_config.dart';

class MainnetConfig implements AppConfig {
  MainnetConfig();

  @override
  final AppEnvironment environment = AppEnvironment.mainnet;
}
