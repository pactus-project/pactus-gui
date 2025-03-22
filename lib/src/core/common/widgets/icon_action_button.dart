import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
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
    final isDark = FluentTheme.of(context).brightness == Brightness.dark;
    final defaultColor =
        isDark ? AppColors.primaryLight : AppColors.primaryDark;

    return _CustomTooltip(
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
              debugPrint('Button action failed: $e');
            }
          },
          builder: (context, states) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Center(
                child: SvgPicture.asset(
                  icon,
                  width: size * 0.8,
                  height: size * 0.8,
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

class _CustomTooltip extends StatelessWidget {
  const _CustomTooltip({
    required this.child,
    this.tooltipTitle,
    this.tooltipDescription,
  });

  final Widget child;
  final String? tooltipTitle;
  final String? tooltipDescription;

  @override
  Widget build(BuildContext context) {
    // If no tooltip content, just return the child
    if (tooltipTitle == null && tooltipDescription == null) {
      return child;
    }

    return material.Tooltip(
      richMessage: material.TextSpan(
        children: [
          if (tooltipTitle != null)
            material.TextSpan(
              text: tooltipTitle,
              style: material.TextStyle(
                fontWeight: material.FontWeight.bold,
                fontSize: 10,
                color: AppTheme.of(context).extension<DarkPallet>()!.dark900,
              ),
            ),
          if (tooltipTitle != null && tooltipDescription != null)
            const material.TextSpan(text: '\n'),
          if (tooltipDescription != null)
            material.TextSpan(
              text: tooltipDescription,
              style: material.TextStyle(
                fontSize: 10,
                color: AppTheme.of(context).extension<DarkPallet>()!.dark500,
              ),
            ),
        ],
      ),
      padding: const EdgeInsets.all(8),
      preferBelow: true,
      decoration: material.BoxDecoration(
        color: AppTheme.of(context).extension<GrayPallet>()!.gray100,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          material.BoxShadow(
            color: AppTheme.of(context).extension<GrayPallet>()!.gray500!,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      textAlign: material.TextAlign.center,
      child: child,
    );
  }
}
