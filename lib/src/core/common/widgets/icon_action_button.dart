import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pactus_gui/src/core/common/widgets/custom_tooltip.dart'
    show CustomTooltip;
import 'package:pactus_gui/src/core/utils/methods/print_debug.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class IconActionButton extends StatelessWidget {
  const IconActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = 48,
    this.tooltipTitle,
    this.tooltipDescription,
    this.color,
    this.hoverColor,
    this.borderRadius = 4,
    this.tintColor,
  });

  final String icon;
  final AsyncCallback onPressed;
  final double size;
  final String? tooltipTitle;
  final String? tooltipDescription;
  final Color? color;
  final Color? hoverColor;
  final double borderRadius;
  final Color? tintColor;

  @override
  Widget build(BuildContext context) {
    final defaultColor = AppTheme.of(
      context,
    ).extension<DarkPallet>()!.contrast!.toAccentColor();

    final theme = AppTheme.of(context);
    final hoverColor =
        theme.extension<DarkPallet>()?.dark300 ?? Colors.transparent;

    return CustomTooltip(
      tooltipTitle: tooltipTitle,
      tooltipDescription: tooltipDescription,
      child: SizedBox(
        width: size,
        height: size,
        child: HoverButton(
          onPressed: () async {
            try {
              await onPressed();
            } on Exception catch (e) {
              printDebug('Button action failed: $e');
            }
          },
          builder: (context, states) {
            final isHovering = states.isHovered;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              decoration: BoxDecoration(
                color: isHovering ? hoverColor : Colors.transparent,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: SvgPicture.asset(
                  icon,
                  width: size,
                  height: size,
                  colorFilter: ColorFilter.mode(
                    tintColor ?? defaultColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
