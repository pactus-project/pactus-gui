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
    this.showPrevious = true,
    this.showNext = true,
    this.showSkipButton = false,
    this.onSkipPressed,
  });
  final int selectedIndex;
  final VoidCallback? onNextPressed;
  final VoidCallback? onBackPressed;
  final bool showPrevious;
  final bool showNext;
  final bool showSkipButton;
  final VoidCallback? onSkipPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 89,
      color: AppTheme.of(context).extension<LightPallet>()!.light900,
      padding: const EdgeInsets.symmetric(horizontal: 46),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Always reserve space for Back button
          if (selectedIndex > 0 && onBackPressed != null)
            CustomOutlinedButton(
              text: 'Back',
              onPressed: onBackPressed,
              borderColor: AppColors.primaryGray,
            )
          else
            CustomFilledButton(
              text: 'Back',
              onPressed: null,
            ),

          // Modified Next button section with optional Skip
          Row(
            children: [
              if (showSkipButton) ...[
                CustomOutlinedButton(
                  text: 'Skip',
                  onPressed: onSkipPressed,
                  borderColor: Colors.transparent,
                  textColor: Color(0xFF0066B4),
                ),
                const SizedBox(width: 10),
              ],
              CustomFilledButton(
                text: 'Next',
                onPressed: selectedIndex < 6 ? onNextPressed : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
