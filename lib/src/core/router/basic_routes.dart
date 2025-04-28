import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pactus_gui/src/core/di/locator.dart';
import 'package:pactus_gui/src/features/dashboard/presentation/screen/dashboard_screen.dart';
import 'package:pactus_gui/src/features/dashboard/sub_modules/blockchain_get_info/presentation/bloc/blockchain_get_info_bloc.dart';
import 'package:pactus_gui/src/features/password/presentation/screen/unlock_password_screen.dart';
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
    builder: (context, state) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BlockchainGetInfoBloc(
              getIt(),
            )..add(
                const BlockchainGetInfoEvent.fetchStream(),
              ),
          ),
        ],
        child: DashboardScreen(),
      );
    },
  ),
];
