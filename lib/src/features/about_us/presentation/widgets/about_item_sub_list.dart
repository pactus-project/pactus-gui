import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart'
    show AppTheme, DarkPallet, InterTextStyles;

class AboutItemSubList extends StatelessWidget {
  const AboutItemSubList({
    super.key,
    required this.faqTitle,
    required this.faqSubTitle,
  });
  final String faqTitle;
  final List<String> faqSubTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr(faqTitle),
          style: InterTextStyles.smallRegular.copyWith(
            color: AppTheme.of(context).extension<DarkPallet>()!.dark900,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling
            itemCount: faqSubTitle.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 3,
                    width: 3,
                    margin: const EdgeInsets.only(top: 6), // Adjust alignment
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          AppTheme.of(context).extension<DarkPallet>()!.dark900,
                    ),
                  ),
                  const Gap(7),
                  Expanded(
                    child: Text(
                      context.tr(faqSubTitle[index]),
                      style: InterTextStyles.smallRegular.copyWith(
                        color: AppTheme.of(context)
                            .extension<DarkPallet>()!
                            .dark500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
