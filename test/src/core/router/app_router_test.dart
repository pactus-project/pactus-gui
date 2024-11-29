import 'package:flutter_test/flutter_test.dart';
import 'package:gui/src/core/router/route_name.dart';

void main() {
  group('AppRouter Tests', () {
    setUp(() {
      // Reset any necessary test state
    });

    test('Route paths should match enum values', () {
      expect(AppRoute.splash.path, '/');
    });

    test('Route names should match enum values', () {
      expect(AppRoute.splash.name, 'splash');
    });
  });
}
