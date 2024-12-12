import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/router/route_name.dart';

class ConfirmationSeedPage extends StatelessWidget {
  const ConfirmationSeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation Seed Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.goNamed(AppRoute.masterPassword.name);
          },
          child: Text('Navigate to ${AppRoute.masterPassword.name}'),
        ),
      ),
    );
  }
}
