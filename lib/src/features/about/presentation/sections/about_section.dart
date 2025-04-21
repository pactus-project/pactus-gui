import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/constants/app_constants.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/about/presentation/widgets/about_item.dart';
import 'package:gui/src/features/about/presentation/widgets/about_item_sub_list.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart'
    show AppTheme, DarkPallet, InterTextStyles;

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 49, bottom: 57, right: 77, left: 53),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 14,
          children: [
            AboutItem(
              faqTitle: LocaleKeys.about_pactus_gui,
              faqSubTitle: LocaleKeys.answer_about_pactus_gui,
            ),
            Text(
              context.tr(
                LocaleKeys.key_features_and_functionalities,
              ),
              style: InterTextStyles.smallRegular.copyWith(
                color: AppTheme.of(context).extension<DarkPallet>()!.dark600,
              ),
            ),
            AboutItemSubList(
              faqTitle: '${AppConstants.aboutItemNumberList.first} ${context.tr(LocaleKeys.node_management)}',
              faqSubTitle: [
                LocaleKeys.answer_first_node_management,
                LocaleKeys.answer_second_node_management,
              ],
            ),
            AboutItemSubList(
              faqTitle: '${AppConstants.aboutItemNumberList[1]} ${context.tr(LocaleKeys.transaction_management)}',
              faqSubTitle: [
                LocaleKeys.answer_transaction_management,
              ],
            ),
            AboutItemSubList(
              faqTitle: '${AppConstants.aboutItemNumberList[2]} ${context.tr(LocaleKeys.security_and_privacy)}',
              faqSubTitle: [
                LocaleKeys.answer_security_and_privacy,
              ],
            ),
            AboutItemSubList(
              faqTitle: '${AppConstants.aboutItemNumberList[3]} ${context.tr(LocaleKeys.decentralization_and_accessibility)}',
              faqSubTitle: [
                LocaleKeys.answer_decentralization_and_accessibility,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
