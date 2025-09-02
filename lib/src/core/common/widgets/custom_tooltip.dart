import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:pactus_gui_widgetbook/app_styles.dart';

class CustomTooltip extends StatelessWidget {
  const CustomTooltip({
    super.key,
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
