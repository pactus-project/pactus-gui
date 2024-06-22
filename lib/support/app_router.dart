import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pactus/screens/dashboard_wrapper.dart';
import 'package:pactus/screens/init_screen.dart';
import 'package:pactus/screens/unlock_screen.dart';
import 'package:pactus/screens/welcome_screen.dart';

CustomTransitionPage fadeRouteTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) =>
    CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        name: WelcomeScreen.route,
        pageBuilder: (context, state) => fadeRouteTransition<void>(
          context: context,
          state: state,
          child: const WelcomeScreen(),
        ),
        routes: [
          GoRoute(
            path: 'init',
            name: InitialScreen.route,
            pageBuilder: (context, state) => fadeRouteTransition<void>(
              context: context,
              state: state,
              child: const InitialScreen(),
            ),
          ),
          GoRoute(
            path: 'dashboard',
            name: DashboardScreenWrapper.route,
            pageBuilder: (context, state) => fadeRouteTransition<void>(
              context: context,
              state: state,
              child: const DashboardScreenWrapper(),
            ),
          ),
          GoRoute(
            path: 'unlock',
            name: UnlockScreen.route,
            pageBuilder: (context, state) => fadeRouteTransition<void>(
              context: context,
              state: state,
              child: const UnlockScreen(),
            ),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Text(state.error!.message),
  );
});
