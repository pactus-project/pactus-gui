import 'package:go_router/go_router.dart';
import 'package:gui/src/features/splash/presentation/screen/splash_screen.dart';
import 'basic_routes.dart';
import 'registration_routes.dart';

final GoRouter routerConfig = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(),
    ),
    ...basicRoutes,
    ...registrationRoutes,
  ],
);
