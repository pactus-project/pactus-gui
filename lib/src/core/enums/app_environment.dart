enum AppEnvironment {
  mainnet(argument: '', name: 'MainNet'),
  testnet(argument: '--testnet', name: 'TestNet'),
  localnet(argument: '--localnet', name: 'LocalNet');

  const AppEnvironment({required this.argument, required this.name});

  final String argument;
  final String name;

}
