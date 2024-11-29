import 'package:go_router/go_router.dart';
import 'package:gui/src/features/home/presentation/screen/home_screen.dart';
import 'package:gui/src/features/splash/presentation/screen/splash_screen.dart';
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
      path: AppRoute.home.path,
      name: AppRoute.home.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
