import 'package:fluent_ui/fluent_ui.dart';
import 'package:gap/gap.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class ValidatorConfigTitleSection extends StatelessWidget {
  const ValidatorConfigTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Validator config',
          style: InterTextStyles.bodyBold.copyWith(
            color: AppTheme.of(context)
                .extension<DarkPallet>()!
                .dark900,
          ),
        ),
        const Gap(8),
        Text(
          'Setting your path to decentralized consensus'
              ' with precision and scalability',
          style: InterTextStyles.smallRegular.copyWith(
            color: AppColors.primaryGray,
          ),
        ),
      ],
    );
  }
}
