import 'package:gui/src/core/constants/cli_constants.dart';

enum AppEnvironment {
  mainnet(argument: CliConstants.dashDashMainNet, name: 'MainNet'),
  testnet(argument: CliConstants.dashDashTestNet, name: 'TestNet'),
  localnet(argument: CliConstants.dashDashLocalNet, name: 'LocalNet');

  const AppEnvironment({required this.argument, required this.name});

  final String argument;
  final String name;
}
