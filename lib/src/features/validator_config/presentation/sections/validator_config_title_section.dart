import 'package:fluent_ui/fluent_ui.dart';
import 'package:gap/gap.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ## [ValidatorConfigTitleSection] Class Documentation
///
/// The `ValidatorConfigTitleSection` class represents the title
/// section of the validator configuration screen.
/// It displays the title and a brief description about setting
/// up the validator configuration for decentralized consensus.
///
/// ### Usage:
///
/// This section provides:
/// - A bold title `Validator config` that signifies the purpose of the screen.
/// - A smaller descriptive text explaining the functionality
/// of the screen in the context of decentralized consensus setup.
///
/// ### Notes:
///
/// - The title text uses a bold style from `InterTextStyles.bodyBold`
/// and a dark color from the `AppTheme`.
/// - The description text uses a regular style from
/// `InterTextStyles.smallRegular` and a gray color from `AppColors.primaryGray`

class ValidatorConfigTitleSection extends StatelessWidget {
  const ValidatorConfigTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.tr(LocaleKeys.validator_config),
          style: InterTextStyles.bodyBold.copyWith(
            color: AppTheme.of(context).extension<DarkPallet>()!.dark900,
          ),
        ),
        const Gap(8),
        Text(
          context.tr(LocaleKeys.validator_config_description),
          style: InterTextStyles.smallRegular.copyWith(
            color: AppColors.primaryGray,
          ),
        ),
      ],
    );
  }
}
