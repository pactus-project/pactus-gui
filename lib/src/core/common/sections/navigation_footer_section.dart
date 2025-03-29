import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/common/widgets/adaptive_text_button.dart';
import 'package:gui/src/core/router/route_name.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';
import 'package:pactus_gui_widgetbook/src/features/widgets/buttons/adaptive_primary_button/adaptive_primary_button.dart';
import 'package:pactus_gui_widgetbook/src/core/enum/request_state_enum.dart';
import 'package:pactus_gui_widgetbook/src/core/enum/padding_size_enum.dart';

class NavigationFooterSection extends StatelessWidget {
  const NavigationFooterSection({
    super.key,
    required this.selectedIndex,
    this.onNextPressed,
    this.onBackPressed,
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
            IntrinsicWidth(
              child: SizedBox(
                height: 32,
            child: AdaptivePrimaryButton.createTitleOnly(
                  requestState: RequestStateEnum.loaded,
                  onPressed: onBackPressed,
                  title: context.tr(LocaleKeys.back),
                  isOutlined: true,
                ),
          ),
        )
    // CustomOutlinedButton(
    //           text: context.tr(LocaleKeys.back),
    //           onPressed: onBackPressed,
    //           borderColor: AppColors.primaryGray,
    //         )
          else
            IntrinsicWidth(
              child: SizedBox(
                height: 32,
                child: AdaptivePrimaryButton.createTitleOnly(
                  requestState: RequestStateEnum.loaded,
                  onPressed: () {
                    context.goNamed(AppRoute.initializeMode.name);
                  },
                  title: context.tr(LocaleKeys.back),
                  isOutlined: true,
                ),
              ),
            ),
            // CustomOutlinedButton(
            //   text: context.tr(LocaleKeys.back),
            //   onPressed: () {
            //     context.goNamed(AppRoute.initializeMode.name);
            //   },
            //   borderColor: AppColors.primaryGray,
            // ),

          // Modified Next button section with optional Skip
          Row(
            children: [
              if (showSkipButton) ...[
                AdaptiveTextButton(
                  text: context.tr(LocaleKeys.skip),
                  onPressed: onSkipPressed!,
                  textColor: FluentTheme.of(context).accentColor,
                ),
                const SizedBox(width: 10),
              ],
              IntrinsicWidth(
                child: SizedBox(
                  height: 32,
                  child: AdaptivePrimaryButton.createTitleOnly(
                    requestState: RequestStateEnum.loaded,
                    onPressed: selectedIndex < 6 ? onNextPressed : null,
                    title: context.tr(LocaleKeys.next),
                    paddingSize: PaddingSizeEnum.large,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
