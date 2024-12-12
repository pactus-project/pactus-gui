import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/router/route_name.dart';

class RestorationSeedPage extends StatelessWidget {
  const RestorationSeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restoration Seed Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.goNamed(AppRoute.confirmationSeed.name);
          },
          child: Text('Navigate to ${AppRoute.confirmationSeed.name}'),
        ),
      ),
    );
  }
}
