import 'package:go_router/go_router.dart';
import 'package:gui/src/core/common/navigation_pans/initializing_navigation_pane.dart';
import 'package:gui/src/features/dashboard/presentation/screen/dashboard_page.dart';
import 'package:gui/src/features/password/presentation/screen/unblock_password_screen.dart';
import 'package:gui/src/features/welcome/presentation/screen/welcome_screen.dart';
import 'route_name.dart';

final List<GoRoute> registrationRoutes = [
  GoRoute(
    path: AppRoute.welcome.fullPath,
    name: AppRoute.welcome.name,
    builder: (context, state) => const WelcomeScreen(),
    routes: [
      GoRoute(
        path: AppRoute.initializingNavigationPane.path,
        name: AppRoute.initializingNavigationPane.name,
        builder: (context, state) => const InitializingNavigationPane(),
        routes: [
          GoRoute(
            path: AppRoute.password.path,
            name: AppRoute.password.name,
            builder: (context, state) => UnblockPasswordScreen(
              fromRegistrationRoute:
              state.matchedLocation.contains(AppRoute.finish.name),
            ),
            routes: [
              GoRoute(
                path: AppRoute.dashboard.path,
                name: AppRoute.dashboard.name,
                builder: (context, state) => const DashboardPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
