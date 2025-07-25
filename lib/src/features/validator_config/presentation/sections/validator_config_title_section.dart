import 'package:fluent_ui/fluent_ui.dart';
import 'package:gap/gap.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
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
/// - The title text uses a bold style from `InterTextStyles.bodyStrong`
/// and a dark color from the `AppTheme`.
/// - The description text uses a regular style from
/// `InterTextStyles.body` and a gray color from
/// `AppTheme.of(context).extension<GrayPallet>()!.contrast`

class ValidatorConfigTitleSection extends StatelessWidget {
  const ValidatorConfigTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr(LocaleKeys.validator_config),
          style: InterTextStyles.bodyStrong.copyWith(
            color: AppTheme.of(context).extension<DarkPallet>()!.dark900,
          ),
        ),
        const Gap(8),
        Text(
          context.tr(LocaleKeys.validator_config_description),
          style: InterTextStyles.body.copyWith(
            color: AppTheme.of(context).extension<GrayPallet>()!.contrast,
          ),
        ),
      ],
    );
  }
}
