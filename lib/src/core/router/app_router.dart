import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_cubit.dart';
import 'package:gui/src/features/splash/presentation/screen/splash_screen.dart';
import 'basic_routes.dart';
import 'registration_routes.dart';

final GoRouter routerConfig = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider<DaemonCubit>(
            create: (_) => DaemonCubit(),
          ),
        ],
        child: SplashScreen(),
      ),
    ),
    ...basicRoutes,
    ...registrationRoutes,
  ],
);
