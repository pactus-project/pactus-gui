import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/faq/presentation/widgets/faq_item.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:49,bottom: 57,right: 77,left: 53 ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 14,
          children: [
          FaqItem(faqTitle: LocaleKeys.faq, faqSubTitle: LocaleKeys.answer_faq),
          FaqItem(faqTitle: LocaleKeys.what_does_pactus_mean, faqSubTitle: LocaleKeys.answer_what_does_pactus_mean),
          FaqItem(faqTitle: LocaleKeys.is_pactus_a_copy_of_any_other_blockchain, faqSubTitle: LocaleKeys.answer_is_pactus_a_copy_of_any_other_blockchain),
          FaqItem(faqTitle: LocaleKeys.did_pactus_have_an_ico, faqSubTitle: LocaleKeys.answer_did_pactus_have_an_ico),
          FaqItem(faqTitle: LocaleKeys.where_can_i_buy_pactus_coins, faqSubTitle: LocaleKeys.answer_where_can_i_buy_pactus_coins),
          FaqItem(faqTitle: LocaleKeys.how_is_pactus_different_from_bitcoin, faqSubTitle: LocaleKeys.answer_how_is_pactus_different_from_bitcoin),
          FaqItem(faqTitle: LocaleKeys.how_is_pactus_different_from_ethereum, faqSubTitle: LocaleKeys.answer_how_is_pactus_different_from_bitcoin),
        ],),
      ),
    );
  }
}
