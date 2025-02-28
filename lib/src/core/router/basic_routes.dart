import 'package:go_router/go_router.dart';
import 'package:gui/src/features/dashboard/presentation/screen/dashboard_page.dart';
import 'package:gui/src/features/password/presentation/screen/unlock_password_screen.dart';
import 'route_name.dart';

final List<GoRoute> basicRoutes = [
  GoRoute(
    path: AppRoute.basicPassword.fullPath,
    name: AppRoute.basicPassword.name,
    builder: (context, state) => UnlockPasswordScreen(
      fromRegistrationRoute:
          state.matchedLocation.contains(AppRoute.finish.name),
    ),
    routes: [
      GoRoute(
        path: AppRoute.basicDashboard.path,
        name: AppRoute.basicDashboard.name,
        builder: (context, state) => const DashboardPage(),
      ),
    ],
  ),
];
