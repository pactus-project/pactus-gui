import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gui/src/core/common/widgets/theme_switcher.dart';
import 'package:gui/src/core/utils/assets/assets.gen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  /// Checks if the asset exists by attempting to load it.
  Future<bool> isAssetValid(String assetPath) async {
    try {
      // Attempt to load the asset from the root bundle
      final assetData = await rootBundle.load(assetPath);
      return assetData.lengthInBytes > 0;
    } on Exception catch (_) {
      return false;
    }
  }

  group('Asset Validation Tests', () {
    test('Light mode asset exists', () async {
      final assetPath = Assets.icons.icLightMode;
      expect(
        await isAssetValid(assetPath),
        isTrue,
        reason: 'The light mode asset should exist in the project assets.',
      );
    });

    test('Dark mode asset exists', () async {
      final assetPath = Assets.icons.icDarkMode;
      expect(
        await isAssetValid(assetPath),
        isTrue,
        reason: 'The dark mode asset should exist in the project assets.',
      );
    });
  });
  group('ThemeSwitcher Tests', () {
    testWidgets('should detect light theme in UI', (WidgetTester tester) async {
      // Create a light theme context
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const ThemeSwitcher(),
        ),
      );

      // Verify light theme-specific icon (e.g., dark mode icon) is visible
      final lightModeIcon = find.byType(SvgPicture).first;
      expect(lightModeIcon, findsOneWidget);

      // Verify the opacity for the sun icon is visible (light theme icon)
      final sunIconOpacity = tester.widget<AnimatedOpacity>(
        find.byType(AnimatedOpacity).last,
      );
      expect(sunIconOpacity.opacity, equals(1.0));
    });

    testWidgets('should detect dark theme in UI', (WidgetTester tester) async {
      // Create a dark theme context
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: const ThemeSwitcher(),
        ),
      );

      // Verify dark theme-specific icon (e.g., light mode icon) is visible
      final darkModeIcon = find.byType(SvgPicture).last;
      expect(darkModeIcon, findsOneWidget);

      // Verify the opacity for the moon icon is visible (dark theme icon)
      final moonIconOpacity = tester.widget<AnimatedOpacity>(
        find.byType(AnimatedOpacity).first,
      );
      expect(moonIconOpacity.opacity, equals(1.0));
    });
  });
}
