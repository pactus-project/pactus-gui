enum AppRoute {
  splash,
  welcome,
  initializeMode,
  restorationSeed,
  confirmationSeed,
  masterPassword,
  validatorConfig,
  initializing,
  finish,
  password,
  dashboard,
  basicPassword,
  basicDashboard;

  String get routePath => '/$name';
  String get routeName => name;
}
