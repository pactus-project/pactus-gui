import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// to-do: this is temporary class cause this section need to be re-design
/// by UI team. after that we should refactor this section by Pouria
class SeedNotesSection extends StatelessWidget {
  const SeedNotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr(LocaleKeys.generation_seed_note1),
          style: InterTextStyles.captionMedium.copyWith(
            color: AppColors.primaryGray,
          ),
        ),
        Text(
          context.tr(LocaleKeys.generation_seed_note2),
          style: InterTextStyles.captionMedium.copyWith(
            color: AppColors.primaryGray,
          ),
        ),
        Text(
          context.tr(LocaleKeys.warning),
          style: InterTextStyles.captionMedium.copyWith(
            color: AppColors.primaryGray,
          ),
        ),
        Text(
          '- ${context.tr(LocaleKeys.generation_seed_warning1)}',
          style: InterTextStyles.captionMedium.copyWith(
            color: AppColors.primaryGray,
          ),
        ),
        Text(
          '- ${context.tr(LocaleKeys.generation_seed_warning2)}',
          style: InterTextStyles.captionMedium.copyWith(
            color: AppColors.primaryGray,
          ),
        ),
        Text(
          '- ${context.tr(LocaleKeys.generation_seed_warning3)}',
          style: InterTextStyles.captionMedium.copyWith(
            color: AppColors.primaryGray,
          ),
        ),
      ],
    );
  }
}
