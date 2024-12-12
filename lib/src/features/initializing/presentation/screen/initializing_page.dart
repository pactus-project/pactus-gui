import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/router/route_name.dart';

class InitializingPage extends StatelessWidget {
  const InitializingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Initializing Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.goNamed(AppRoute.finish.name);
          },
          child: Text('Navigate to ${AppRoute.finish.name}'),
        ),
      ),
    );
  }
}
