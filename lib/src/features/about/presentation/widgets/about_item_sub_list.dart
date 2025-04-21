import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
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
      spacing: 6,
      children: [
        Text(
          context.tr(faqTitle),
          style: InterTextStyles.smallRegular.copyWith(
            color: AppTheme.of(context).extension<DarkPallet>()!.dark900,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: faqSubTitle.length,
              itemBuilder: (context, index) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Container(
                      height: 3,
                      width: 3,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            AppTheme.of(context).extension<DarkPallet>()!.dark900,
                      ),
                    ),
                  ),
                  Gap(7),
                  Expanded(
                    child: Text(
                      context.tr(
                        faqSubTitle[index],
                      ),
                      style: InterTextStyles.smallRegular.copyWith(
                        color:
                            AppTheme.of(context).extension<DarkPallet>()!.dark500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
