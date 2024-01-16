import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pactus/main.dart';
import 'package:pactus/screen_pages/home_page.dart';


CustomTransitionPage fadeRouteTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
  );
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        name: HomePage.route,
        pageBuilder: (context, state) => fadeRouteTransition<void>(
          context: context,
          state: state,
          child: const HomePage(),
        ),
      ),
    ],
    errorBuilder: (context, state) => Text(state.error!.message),
  );
});
