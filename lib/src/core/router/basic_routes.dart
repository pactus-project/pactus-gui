import 'package:go_router/go_router.dart';
import 'package:gui/src/features/dashboard/presentation/screen/dashboard_screen.dart';
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
  ),
  // Dashboard as a standalone route
  GoRoute(
    path: AppRoute.dashboard.fullPath,
    name: AppRoute.dashboard.name,
    builder: (context, state) => const DashboardScreen(),
  ),
];
