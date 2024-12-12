import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/router/route_name.dart';

class FinishPage extends StatelessWidget {
  const FinishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finish Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.goNamed(AppRoute.password.name);
          },
          child: Text('Navigate to ${AppRoute.password.name}'),
        ),
      ),
    );
  }
}
