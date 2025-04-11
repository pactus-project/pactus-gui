import 'package:gui/src/core/constants/cli_constants.dart';

enum AppEnvironment {
  mainnet(argument: CliConstants.mainNetArgument, name: 'MainNet'),
  testnet(argument: CliConstants.testNetArgument, name: 'TestNet'),
  localnet(argument: CliConstants.localNetArgument, name: 'LocalNet');

  const AppEnvironment({required this.argument, required this.name});

  final String argument;
  final String name;
}
