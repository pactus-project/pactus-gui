import 'package:flutter/material.dart';
import 'package:gui/src/core/common/colors/app_colors.dart' show AppColors;
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart' show InterTextStyles;

class FaqItem extends StatelessWidget {
  const FaqItem({super.key, required this.faqTitle, required this.faqSubTitle});
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
          style: InterTextStyles.smallRegular.copyWith(
            color: AppColors.primaryDark,
          ),
        ),
        Text(
          context.tr(
            faqSubTitle,
          ),
          style: InterTextStyles.smallRegular.copyWith(
            color: AppColors.expandableSeedTypeColor,
          ),
        ),
      ],
    );
  }
}
