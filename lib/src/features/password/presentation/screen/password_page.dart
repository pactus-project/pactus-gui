import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/common/widgets/theme_switcher.dart';
import 'package:gui/src/core/router/route_name.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key, required this.fromRegistrationRoute});
  final bool fromRegistrationRoute;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ThemeSwitcher(),
            fromRegistrationRoute
                ? MaterialButton(
                    onPressed: () {
                      context.goNamed(AppRoute.dashboard.name);
                    },
                    child: Text(
                      'Navigate to ${AppRoute.dashboard.name}',
                    ),
                  )
                : MaterialButton(
                    onPressed: () {
                      context.goNamed(AppRoute.basicDashboard.name);
                    },
                    child: Text(
                      'Navigate to ${AppRoute.basicDashboard.name}',
                    ),
                  ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
