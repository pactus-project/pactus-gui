import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/router/route_name.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

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
            MaterialButton(
              onPressed: () {
                context.goNamed(AppRoute.basicDashboard.name);
              },
              child: Text(
                'Navigate to ${AppRoute.basicDashboard.name}',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
