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
  dashboard;

  String get path => switch (this) {
        AppRoute.splash => '/',
        AppRoute.dashboard => '/dashboard',
        AppRoute.password => '/password',
        AppRoute.welcome => '/welcome',
        AppRoute.initializeMode => '/initialize-mode',
        AppRoute.restorationSeed => '/restoration-seed',
        AppRoute.confirmationSeed => '/confirmation-seed',
        AppRoute.masterPassword => '/master-password',
        AppRoute.validatorConfig => '/validator-config',
        AppRoute.initializing => '/initializing',
        AppRoute.finish => '/finish',
      };

  String get name => switch (this) {
        AppRoute.splash => 'splash',
        AppRoute.dashboard => 'dashboard',
        AppRoute.password => 'password',
        AppRoute.welcome => 'welcome',
        AppRoute.initializeMode => 'initializeMode',
        AppRoute.restorationSeed => 'restorationSeed',
        AppRoute.confirmationSeed => 'confirmationSeed',
        AppRoute.masterPassword => 'masterPassword',
        AppRoute.validatorConfig => 'validatorConfig',
        AppRoute.initializing => 'initializing',
        AppRoute.finish => 'finish',
      };
}
