import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pactus_gui/src/core/utils/gen/assets/assets.gen.dart';

/// # [ToolbarLogo] Documentation
/// A stateless widget that displays the app's toolbar logo.
/// Automatically adapts to the current theme (light or dark) and selects the
/// appropriate logo asset.
///
class ToolbarLogo extends StatelessWidget {
  const ToolbarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final isLightTheme = FluentTheme.of(context).brightness == Brightness.light;
    return SvgPicture.asset(
      width: 25,
      height: 25,
      isLightTheme ? Assets.icons.icLogoLight : Assets.icons.icLogoDark,
    );
  }
}
