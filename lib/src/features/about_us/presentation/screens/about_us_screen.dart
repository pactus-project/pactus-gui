import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/features/about_us/presentation/widgets/about_item.dart';
import 'package:pactus_gui/src/features/about_us/presentation/widgets/about_item_sub_list.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart'
    show AppTheme, DarkPallet, InterTextStyles;

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({
    super.key,
  });

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
              faqTitle: '1. '
                  '${context.tr(LocaleKeys.node_management)}',
              faqSubTitle: [
                LocaleKeys.answer_first_node_management,
                LocaleKeys.answer_second_node_management,
              ],
            ),
            AboutItemSubList(
              faqTitle: '2. '
                  '${context.tr(LocaleKeys.transaction_management)}',
              faqSubTitle: [
                LocaleKeys.answer_transaction_management,
              ],
            ),
            AboutItemSubList(
              faqTitle: '3. '
                  '${context.tr(LocaleKeys.security_and_privacy)}',
              faqSubTitle: [
                LocaleKeys.answer_security_and_privacy,
              ],
            ),
            AboutItemSubList(
              faqTitle: '4. '
                  '${context.tr(LocaleKeys.decentralization_and_accessibility)}'
                  '',
              faqSubTitle: [
                LocaleKeys.answer_decentralization_and_accessibility,
              ],
            ),
            AboutItemSubList(
              faqTitle: '5. '
                  '${context.tr(LocaleKeys.user_experience_enhancements)}'
                  '',
              faqSubTitle: [
                LocaleKeys.answer_decentralization_and_accessibility,
              ],
            ),
            AboutItemSubList(
              faqTitle: '6. '
                  '${context.tr(LocaleKeys.realtime_blockchain_monitoring)}'
                  '',
              faqSubTitle: [
                LocaleKeys.answer_realtime_blockchain_monitoring,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
