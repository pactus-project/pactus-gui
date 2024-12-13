import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/router/route_name.dart';

class InitializeModePage extends StatelessWidget {
  const InitializeModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Initialize Mode'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.goNamed(AppRoute.restorationSeed.name);
          },
          child: Text('Navigate to ${AppRoute.restorationSeed.name}'),
        ),
      ),
    );
  }
}
