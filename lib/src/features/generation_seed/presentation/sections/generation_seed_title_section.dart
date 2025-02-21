import 'package:fluent_ui/fluent_ui.dart';
import 'package:gap/gap.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class GenerationSeedTitleSection extends StatelessWidget {
  const GenerationSeedTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr(LocaleKeys.generation_seed_title),
          style: InterTextStyles.bodyBold.copyWith(
            color: AppColors.primaryDark,
          ),
        ),
        const Gap(8),
        Text(
          context.tr(LocaleKeys.generation_seed_description),
          style: InterTextStyles.smallRegular.copyWith(
            color: AppColors.primaryGray,
          ),
        ),
        const Gap(24),
      ],
    );
  }
}
