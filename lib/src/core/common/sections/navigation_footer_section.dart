import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/router/route_name.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_core.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';
import 'package:pactus_gui_widgetbook/app_widgets.dart';

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
                child: AdaptiveSecondaryButton.createTitleOnly(
                  isDefaultOutlinedButton: true,
                  requestState: RequestStateEnum.loaded,
                  onPressed: onBackPressed,
                  title: context.tr(LocaleKeys.back),
                ),
              ),
            )
          else
            IntrinsicWidth(
              child: SizedBox(
                height: 32,
                child: AdaptiveSecondaryButton.createTitleOnly(
                  isDefaultOutlinedButton: true,
                  requestState: RequestStateEnum.loaded,
                  onPressed: () {
                    context.goNamed(AppRoute.initializeMode.name);
                  },
                  title: context.tr(LocaleKeys.back),
                ),
              ),
            ),

          // Modified Next button section with optional Skip
          Row(
            children: [
              if (showSkipButton) ...[
                IntrinsicWidth(
                  child: SizedBox(
                    height: 32,
                    child: AdaptiveTextButton.createTitleOnly(
                      requestState: RequestStateEnum.loaded,
                      title: context.tr(LocaleKeys.skip),
                      onPressed: onSkipPressed,
                    ),
                  ),
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
