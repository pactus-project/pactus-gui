import 'package:go_router/go_router.dart';
import 'package:gui/src/features/dashboard/presentation/screen/dashboard_page.dart';
import 'package:gui/src/features/password/presentation/screen/password_page.dart';
import 'route_name.dart';

final List<GoRoute> basicRoutes = [
  GoRoute(
    path: AppRoute.basicPassword.path,
    name: AppRoute.basicPassword.name,
    builder: (context, state) => const PasswordPage(),
    routes:[
      GoRoute(
        path: AppRoute.basicDashboard.path,
        name: AppRoute.basicDashboard.name,
        builder: (context, state) => const DashboardPage(),
      ),
    ]
  ),

];
