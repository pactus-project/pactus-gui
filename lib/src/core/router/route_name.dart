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
  basicDashboard,
  initializingNavigationPane,
  dashboardNavigationPane;

  String get fullPath => '/$name';
  String get path => name;
}
