import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_cubit.dart';
import 'package:gui/src/features/confirmation_seed/presentation/screen/confirmation_seed_page.dart';
import 'package:gui/src/features/dashboard/presentation/screen/dashboard_page.dart';
import 'package:gui/src/features/finish/presentation/screen/finish_page.dart';
import 'package:gui/src/features/initialize_mode/presentation/screen/initialize_mode_page.dart';
import 'package:gui/src/features/initializing/presentation/screen/initializing_page.dart';
import 'package:gui/src/features/master_password/presentation/screen/master_password_page.dart';
import 'package:gui/src/features/password/presentation/screen/password_page.dart';
import 'package:gui/src/features/restoration_seed/presentation/screen/restoration_seed_page.dart';
import 'package:gui/src/features/validator_config/presentation/screen/validator_config_page.dart';
import 'package:gui/src/features/welcome/presentation/screen/welcome_screen.dart';
import 'route_name.dart';

final List<GoRoute> registrationRoutes = [
  GoRoute(
    path: AppRoute.welcome.fullPath,
    name: AppRoute.welcome.name,
    builder: (context, state) => const WelcomeScreen(),
    routes: [
      GoRoute(
        path: AppRoute.initializeMode.path,
        name: AppRoute.initializeMode.name,
        builder: (context, state) => const InitializeModePage(),
        routes: [
          GoRoute(
            path: AppRoute.restorationSeed.path,
            name: AppRoute.restorationSeed.name,
            builder: (context, state) => const RestorationSeedPage(),
            routes: [
              GoRoute(
                path: AppRoute.confirmationSeed.path,
                name: AppRoute.confirmationSeed.name,
                builder: (context, state) => const ConfirmationSeedPage(),
                routes: [
                  GoRoute(
                    path: AppRoute.masterPassword.path,
                    name: AppRoute.masterPassword.name,
                    builder: (context, state) => const MasterPasswordPage(),
                    routes: [
                      GoRoute(
                        path: AppRoute.validatorConfig.path,
                        name: AppRoute.validatorConfig.name,
                        builder: (context, state) =>
                            const ValidatorConfigPage(),
                        routes: [
                          GoRoute(
                            path: AppRoute.initializing.path,
                            name: AppRoute.initializing.name,
                            builder: (context, state) =>
                                const InitializingPage(),
                            routes: [
                              GoRoute(
                                path: AppRoute.finish.path,
                                name: AppRoute.finish.name,
                                builder: (context, state) => MultiBlocProvider(
                                  providers: [
                                    BlocProvider<DaemonCubit>(
                                      create: (_) => DaemonCubit(),
                                    ),
                                  ],
                                  child: const FinishPage(),
                                ),
                                routes: [
                                  GoRoute(
                                    path: AppRoute.password.path,
                                    name: AppRoute.password.name,
                                    builder: (context, state) => PasswordPage(
                                      fromRegistrationRoute: state
                                          .matchedLocation
                                          .contains(AppRoute.finish.name),
                                    ),
                                    routes: [
                                      GoRoute(
                                        path: AppRoute.dashboard.path,
                                        name: AppRoute.dashboard.name,
                                        builder: (context, state) =>
                                            const DashboardPage(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
