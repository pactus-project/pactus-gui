import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/router/route_name.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_manager_bloc.dart';
import 'package:gui/src/features/dev_mode/data/repositories/environment_repository.dart';
import 'package:gui/src/features/dev_mode/presentation/bloc/directory_check_bloc.dart';
import 'package:gui/src/features/dev_mode/presentation/bloc/environment_selection_cubit.dart';
import 'package:gui/src/features/dev_mode/presentation/screens/dev_mode_screen.dart';
import 'package:gui/src/features/splash/presentation/screen/splash_screen.dart';
import 'basic_routes.dart';
import 'registration_routes.dart';

final GoRouter routerConfig = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: AppRoute.devMode.fullPath,
      name: AppRoute.devMode.name,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          RepositoryProvider<EnvironmentRepository>(
            create: (_) => EnvironmentRepository(),
          ),
          BlocProvider<DirectoryCheckBloc>(
            create: (_) => DirectoryCheckBloc(),
          ),
          BlocProvider<EnvironmentSelectionCubit>(
            create: (_) => EnvironmentSelectionCubit(),
          ),
          BlocProvider<DaemonManagerBloc>(
            create: (_) => DaemonManagerBloc(),
          ),
        ],
        child: DeveloperModeScreen(),
      ),
    ),
    ...basicRoutes,
    ...registrationRoutes,
  ],
);
