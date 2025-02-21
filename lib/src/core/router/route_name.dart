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
  initializingLocalNodePane,
  restoringNodePane,
  connectingRemoteNodePane,
  dashboardNavigationPane, initializingNavigationPane;

  String get fullPath => '/$name';
  String get path => name;
}
