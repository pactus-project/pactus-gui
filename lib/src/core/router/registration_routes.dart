import 'package:go_router/go_router.dart';
import 'package:gui/src/features/confirmation_seed/presentation/screen/confirmation_seed_page.dart';
import 'package:gui/src/features/dashboard/presentation/screen/dashboard_page.dart';
import 'package:gui/src/features/finish/presentation/screen/finish_page.dart';
import 'package:gui/src/features/initialize_mode/presentation/screen/initialize_mode_page.dart';
import 'package:gui/src/features/initializing/presentation/screen/initializing_page.dart';
import 'package:gui/src/features/master_password/presentation/screen/master_password_page.dart';
import 'package:gui/src/features/password/presentation/screen/password_page.dart';
import 'package:gui/src/features/restoration_seed/presentation/screen/restoration_seed_page.dart';
import 'package:gui/src/features/validator_config/presentation/screen/validator_config_page.dart';
import 'package:gui/src/features/welcome/presentation/screen/welcome_page.dart';
import 'route_name.dart';

final List<GoRoute> registrationRoutes = [
  GoRoute(
    path: AppRoute.welcome.routePath,
    name: AppRoute.welcome.name,
    builder: (context, state) => const WelcomePage(),
  ),
  GoRoute(
    path: AppRoute.initializeMode.routePath,
    name: AppRoute.initializeMode.name,
    builder: (context, state) => const InitializeModePage(),
  ),
  GoRoute(
    path: AppRoute.restorationSeed.routePath,
    name: AppRoute.restorationSeed.name,
    builder: (context, state) => const RestorationSeedPage(),
  ),
  GoRoute(
    path: AppRoute.confirmationSeed.routePath,
    name: AppRoute.confirmationSeed.name,
    builder: (context, state) => const ConfirmationSeedPage(),
  ),
  GoRoute(
    path: AppRoute.masterPassword.routePath,
    name: AppRoute.masterPassword.name,
    builder: (context, state) => const MasterPasswordPage(),
  ),
  GoRoute(
    path: AppRoute.validatorConfig.routePath,
    name: AppRoute.validatorConfig.name,
    builder: (context, state) => const ValidatorConfigPage(),
  ),
  GoRoute(
    path: AppRoute.initializing.routePath,
    name: AppRoute.initializing.name,
    builder: (context, state) => const InitializingPage(),
  ),
  GoRoute(
    path: AppRoute.finish.routePath,
    name: AppRoute.finish.name,
    builder: (context, state) => const FinishPage(),
  ),
  GoRoute(
    path: AppRoute.password.routePath,
    name: AppRoute.password.name,
    builder: (context, state) => const PasswordPage(),
  ),
  GoRoute(
    path: AppRoute.dashboard.routePath,
    name: AppRoute.dashboard.name,
    builder: (context, state) => const DashboardPage(),
  ),
];
