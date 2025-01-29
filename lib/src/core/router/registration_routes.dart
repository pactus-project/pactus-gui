import 'package:go_router/go_router.dart';
import 'package:gui/src/core/common/navigation_pans/initializing_navigation_pane.dart';
import 'package:gui/src/features/welcome/presentation/screen/welcome_page.dart';
import 'route_name.dart';

final List<GoRoute> registrationRoutes = [
  GoRoute(
    path: AppRoute.welcome.fullPath,
    name: AppRoute.welcome.name,
    builder: (context, state) => const WelcomePage(),
    routes: [
      GoRoute(
        path: AppRoute.initializingNavigationPane.path,
        name: AppRoute.initializingNavigationPane.name,
        builder: (context, state) => const InitializingNavigationPane(),
      ),
    ],
  ),
];
