import 'package:go_router/go_router.dart';
import 'package:pactus_gui/src/core/common/navigation_pans/create_local_node_pane.dart';
import 'package:pactus_gui/src/core/common/navigation_pans/remote_node_pane.dart';
import 'package:pactus_gui/src/core/common/navigation_pans/restoring_node_pane.dart';
import 'package:pactus_gui/src/features/initialize_mode/presentation/screen/initialize_mode_screen.dart';
import 'package:pactus_gui/src/features/welcome/presentation/screen/welcome_screen.dart';

import 'route_name.dart';

final List<GoRoute> registrationRoutes = [
  GoRoute(
    path: AppRoute.welcome.fullPath,
    name: AppRoute.welcome.name,
    builder: (context, state) => const WelcomeScreen(),
    routes: [
      GoRoute(
        path: AppRoute.initializeMode.fullPath,
        name: AppRoute.initializeMode.name,
        builder: (context, state) => const InitializeModeScreen(),
        routes: [
          GoRoute(
            path: AppRoute.initializingLocalNodePane.path,
            name: AppRoute.initializingLocalNodePane.name,
            builder: (context, state) => const CreateLocalNodePane(),
          ),
          GoRoute(
            path: AppRoute.restoringNodePane.path,
            name: AppRoute.restoringNodePane.name,
            builder: (context, state) => const RestoringNodePane(),
          ),
          GoRoute(
            path: AppRoute.connectingRemoteNodePane.path,
            name: AppRoute.connectingRemoteNodePane.name,
            builder: (context, state) => const RemoteNodePane(),
          ),
        ],
      ),
    ],
  ),
];
