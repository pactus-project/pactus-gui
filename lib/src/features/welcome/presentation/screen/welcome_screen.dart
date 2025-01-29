import 'package:fluent_ui/fluent_ui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/widgets/custom_filled_button.dart';
import 'package:gui/src/core/router/route_name.dart';
import 'package:gui/src/core/utils/assets/assets.gen.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';
///to-do #68: add components for this screen after designing process complete
/// by Pouria
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(70),
            Image.asset(
              Assets.images.welcomePic.path,
              width: double.infinity,
              height: 459,
            ),
            const Gap(40),
            Text(
              context.tr(LocaleKeys.welcome_title),
              style: InterTextStyles.bodyBold.copyWith(
                color: AppColors.primaryDark,
              ),
            ),
            const Gap(16),
            Text(
              context.tr(LocaleKeys.welcome_description),
              style: InterTextStyles.smallRegular.copyWith(
                color: AppColors.primaryDark,
              ),
              softWrap: true,textAlign: TextAlign.center,
            ),
            const Gap(16),
            CustomFilledButton(
              text: LocaleKeys.start_button_text,
              onPressed: () {
                context.goNamed(AppRoute.initializeMode.name);
              },
              style: ButtonStyle(
                padding: WidgetStateProperty.all<EdgeInsetsDirectional?>(
                  EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 4),
                ),
                backgroundColor: WidgetStateProperty.all(Color(0xFF0066B4)),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const Gap(50),
          ],
        ),
      ),
    );
  }
}
