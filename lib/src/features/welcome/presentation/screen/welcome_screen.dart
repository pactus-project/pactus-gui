import 'package:fluent_ui/fluent_ui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/widgets/custom_filled_button.dart';
import 'package:gui/src/core/router/route_name.dart';
import 'package:gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ### [WelcomeScreen] Widget Documentation
///
/// The `WelcomeScreen` is a stateless widget that serves as the introductory
/// screen of the application.
/// It presents a welcoming message, a description, an image, and a button to
/// proceed further.
///
/// ---
///
/// ### Key Features
///
/// 1. **NavigationView Layout:**
///    - The screen is wrapped inside a `NavigationView`, ensuring a consistent
///    UI structure.
///
/// 2. **Responsive Design:**
///    - Uses a `SingleChildScrollView` to ensure content is scrollable if
///    needed.
///    - Elements are spaced using `Gap` widgets to maintain a structured
///    layout.
///
/// 3. **Localized Text Support:**
///    - The title and description are translated using
///    `context.tr(LocaleKeys.key)`, ensuring multilingual support.
///
/// 4. **Custom Button:**
///    - A `CustomFilledButton` is used for navigation.
///    - Clicking the button redirects the user to the next screen
///    (`AppRoute.initializeMode.name`).
///
/// ---
///
/// ### Expected Behavior
/// - Displays an image, welcome text, description, and a button.
/// - Ensures text and button are localized for different languages.
/// - Clicking the button navigates the user to the next screen.
/// - Uses a scrollable layout to accommodate different screen sizes.

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
              softWrap: true,
              textAlign: TextAlign.center,
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
