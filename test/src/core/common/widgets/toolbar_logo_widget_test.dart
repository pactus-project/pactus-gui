import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gui/src/core/common/widgets/toolbar_logo.dart';
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
    test('Light logo asset exists', () async {
      final assetPath = Assets.icons.icLogoLight;
      expect(await isAssetValid(assetPath), isTrue,
          reason: 'The light logo asset should exist in the project assets.',);
    });

    test('Dark logo asset exists', () async {
      final assetPath = Assets.icons.icLogoDark;
      expect(await isAssetValid(assetPath), isTrue,
          reason: 'The dark logo asset should exist in the project assets.',);
    });
  });

  group('Theme Switching Tests', () {
    testWidgets('Displays light logo in light theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: ToolbarLogo(),
          ),
        ),
      );

      // Find the SvgPicture widget
      final finder = find.byType(SvgPicture);
      expect(finder, findsOneWidget, reason: 'SvgPicture should be present.');

      // Verify the asset path indirectly
      final  svgWidget = tester.widget<SvgPicture>(finder);
      expect(
        svgWidget.toString().contains(Assets.icons.icLogoLight),
        isTrue,
        reason: 'The light logo asset should be used in a light theme',
      );
    });

    testWidgets('Displays dark logo in dark theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: const Scaffold(
            body: ToolbarLogo(),
          ),
        ),
      );

      // Find the SvgPicture widget
      final finder = find.byType(SvgPicture);
      expect(finder, findsOneWidget, reason: 'SvgPicture should be present.');

      // Verify the asset path indirectly
      final  svgWidget = tester.widget<SvgPicture>(finder);
      expect(
        svgWidget.toString().contains(Assets.icons.icLogoDark),
        isTrue,
        reason: 'The dark logo asset should be used in a dark theme',
      );
    });
  });
}
