import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/widgets/custom_filled_button.dart';
import 'package:gui/src/core/common/widgets/custom_outlined_button.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class NavigationFooterSection extends StatelessWidget {
  const NavigationFooterSection({
    super.key,
    required this.selectedIndex,
    required this.onNextPressed,
    required this.onBackPressed,
  });
  final int selectedIndex;
  final VoidCallback onNextPressed;
  final VoidCallback onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 89,
      color: AppTheme.of(context).extension<LightPallet>()!.light900,
      padding: const EdgeInsets.only(right: 46, left: 46),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (selectedIndex > 0)
            CustomOutlinedButton(
              text: 'back',
              onPressed: onBackPressed,
              borderColor: AppColors.primaryGray,
            ),
          if (selectedIndex < 6)
            CustomFilledButton(
              text: 'Next',
              onPressed: onNextPressed,
            ),
        ],
      ),
    );
  }
}
