import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gui/src/core/utils/assets/assets.gen.dart';

class ToolbarLogo extends StatelessWidget {
  const ToolbarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final isLightTheme = Theme.of(context).brightness == Brightness.light;
    return SvgPicture.asset(
      width: 25,
      height: 25,
      isLightTheme ? Assets.icons.icLogoLight : Assets.icons.icLogoDark,
    );
  }
}
