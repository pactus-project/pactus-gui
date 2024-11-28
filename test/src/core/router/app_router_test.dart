import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gui/core/router/app_router.dart';
import 'package:gui/core/router/route_name.dart';
import 'package:gui/src/features/home/presentation/screen/home_screen.dart';
import 'package:gui/src/features/splash/presentation/screen/splash_screen.dart';

void main() {
  group('AppRouter Tests', () {
    setUp(() {
      // Reset any necessary test state
    });

    test('Route paths should match enum values', () {
      expect(AppRoute.splash.path, '/');
      expect(AppRoute.home.path, '/home');
    });

    test('Route names should match enum values', () {
      expect(AppRoute.splash.name, 'splash');
      expect(AppRoute.home.name, 'home');
    });

    testWidgets('Can navigate to home screen', (tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: routerConfig,
        ),
      );

      // First frame
      await tester.pump();

      // Wait for splash screen delay
      await tester.pump(const Duration(seconds: 2));

      // Pump frames until navigation completes
      await tester.pumpAndSettle();

      expect(find.byType(HomeScreen), findsOneWidget);
      expect(find.byType(SplashScreen), findsNothing);
    });
  });
}
