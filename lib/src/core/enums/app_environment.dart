enum AppEnvironment {
  mainnet(argument: ''),
  testnet(argument: '--testnet'),
  localnet(argument: '--localnet');

  const AppEnvironment({required this.argument});

  final String argument;
}
