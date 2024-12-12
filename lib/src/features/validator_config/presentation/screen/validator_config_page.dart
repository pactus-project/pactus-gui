import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/router/route_name.dart';

class ValidatorConfigPage extends StatelessWidget {
  const ValidatorConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validator Config Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.goNamed(AppRoute.initializing.name);
          },
          child: Text('Navigate to ${AppRoute.initializing.name}'),
        ),
      ),
    );
  }
}
