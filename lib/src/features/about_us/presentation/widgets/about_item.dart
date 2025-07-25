import 'package:flutter/material.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart'
    show AppTheme, DarkPallet, InterTextStyles;

class AboutItem extends StatelessWidget {
  const AboutItem({
    super.key,
    required this.faqTitle,
    required this.faqSubTitle,
  });
  final String faqTitle;
  final String faqSubTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        Text(
          context.tr(faqTitle),
          style: InterTextStyles.body.copyWith(
            color: AppTheme.of(context).extension<DarkPallet>()!.dark900,
          ),
        ),
        Text(
          context.tr(faqSubTitle),
          style: InterTextStyles.body.copyWith(
            color: AppTheme.of(context).extension<DarkPallet>()!.dark600,
          ),
        ),
      ],
    );
  }
}
