import 'package:flutter_test/flutter_test.dart';
import 'package:gui/src/core/router/route_name.dart';

void main() {
  group('AppRouter Tests', () {
    setUp(() {
      // Reset any necessary test state
    });

    test('Route names should match enum values', () {
      expect(AppRoute.splash.name, 'splash');
    });

    test('Route names should match enum values', () {
      expect(AppRoute.welcome.name, 'welcome');
    });

    test('Route names should match enum values', () {
      expect(AppRoute.initializeMode.name, 'initializeMode');
    });

    test('Route names should match enum values', () {
      expect(AppRoute.restorationSeed.name, 'restorationSeed');
    });

    test('Route names should match enum values', () {
      expect(AppRoute.basicPassword.name, 'basicPassword');
    });

    test('Route names should match enum values', () {
      expect(AppRoute.dashboard.name, 'dashboard');
    });
  });
}
