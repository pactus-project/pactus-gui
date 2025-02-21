import 'package:fluent_ui/fluent_ui.dart';
import 'package:gap/gap.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';
/// ## [GenerationSeedTitleSection] Class Documentation
///
/// The `GenerationSeedTitleSection` class is a stateless widget that displays
/// the title and description for the seed generation screen.
///
/// ### UI Components:
///
/// - **Title (`Text`)**:
///   - Displays the localized seed generation title.
///   - Uses `InterTextStyles.bodyBold` with `AppColors.primaryDark`.
///
/// - **Description (`Text`)**:
///   - Displays the localized seed generation description.
///   - Uses `InterTextStyles.smallRegular` with `AppColors.primaryGray`.
///
/// - **Spacing (`Gap`)**:
///   - Adds spacing of 8 pixels between the title and description.
///   - Adds spacing of 24 pixels after the description.
///
/// ### Notes:
///
/// - Uses `context.tr(LocaleKeys...)` for localization.
/// - Ensures proper text styling and spacing for readability.

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
