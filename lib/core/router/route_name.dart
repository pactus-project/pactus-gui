enum AppRoute {
  splash,
  home;

  String get path => switch (this) {
        AppRoute.splash => '/',
        AppRoute.home => '/home',
      };

  String get name => switch (this) {
        AppRoute.splash => 'splash',
        AppRoute.home => 'home',
      };
}
