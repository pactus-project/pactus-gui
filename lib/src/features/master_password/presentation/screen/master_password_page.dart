import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/router/route_name.dart';

class MasterPasswordPage extends StatelessWidget {
  const MasterPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Master Password Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.goNamed(AppRoute.validatorConfig.name);
          },
          child: Text('Navigate to ${AppRoute.validatorConfig.name}'),
        ),
      ),
    );
  }
}
