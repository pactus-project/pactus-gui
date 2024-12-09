import 'package:go_router/go_router.dart';
import 'package:gui/src/features/confirmation_seed/presentation/screen/confirmation_seed_page.dart';
import 'package:gui/src/features/dashboard/presentation/screen/dashboard_page.dart';
import 'package:gui/src/features/finish/presentation/screen/finish_page.dart';
import 'package:gui/src/features/initialize_mode/presentation/screen/initialize_mode_page.dart';
import 'package:gui/src/features/initializing/presentation/screen/initializing_page.dart';
import 'package:gui/src/features/master_password/presentation/screen/master_password_page.dart';
import 'package:gui/src/features/password/presentation/screen/password_page.dart';
import 'package:gui/src/features/restoration_seed/presentation/screen/restoration_seed_page.dart';
import 'package:gui/src/features/splash/presentation/screen/splash_screen.dart';
import 'package:gui/src/features/validator_config/presentation/screen/validator_config_page.dart';
import 'package:gui/src/features/welcome/presentation/screen/welcome_page.dart';
import 'route_name.dart';

final GoRouter routerConfig = GoRouter(
  initialLocation: AppRoute.splash.path,
  routes: [
    GoRoute(
      path: AppRoute.splash.path,
      name: AppRoute.splash.name,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoute.welcome.path,
      name: AppRoute.welcome.name,
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: AppRoute.initializeMode.path,
      name: AppRoute.initializeMode.name,
      builder: (context, state) => const InitializeModePage(),
    ),
    GoRoute(
      path: AppRoute.restorationSeed.path,
      name: AppRoute.restorationSeed.name,
      builder: (context, state) => const RestorationSeedPage(),
    ),
    GoRoute(
      path: AppRoute.confirmationSeed.path,
      name: AppRoute.confirmationSeed.name,
      builder: (context, state) => const ConfirmationSeedPage(),
    ),
    GoRoute(
      path: AppRoute.masterPassword.path,
      name: AppRoute.masterPassword.name,
      builder: (context, state) => const MasterPasswordPage(),
    ),
    GoRoute(
      path: AppRoute.validatorConfig.path,
      name: AppRoute.validatorConfig.name,
      builder: (context, state) => const ValidatorConfigPage(),
    ),
    GoRoute(
      path: AppRoute.initializing.path,
      name: AppRoute.initializing.name,
      builder: (context, state) => const InitializingPage(),
    ),
    GoRoute(
      path: AppRoute.finish.path,
      name: AppRoute.finish.name,
      builder: (context, state) => const FinishPage(),
    ),
    GoRoute(
      path: AppRoute.password.path,
      name: AppRoute.password.name,
      builder: (context, state) => const PasswordPage(),
    ),
    GoRoute(
      path: AppRoute.dashboard.path,
      name: AppRoute.dashboard.name,
      builder: (context, state) => const DashboardPage(),
    ),
  ],
);
