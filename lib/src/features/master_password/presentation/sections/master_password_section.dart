import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:gui/src/core/common/widgets/custom_input_widget.dart';
import 'package:gui/src/core/common/widgets/seed_screen_title_section.dart';
import 'package:gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';

class MasterPasswordSection extends StatelessWidget {

  const MasterPasswordSection({super.key,
    required this.passwordController,
    required this.confirmPasswordController,
  });
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 47,
          end: 47,
          top: 47,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SeedScreenTitleSection(
              title: LocaleKeys.master_password,
              description: LocaleKeys.master_password_description,
            ),
            Center(
              child: SizedBox(
                width: 406,
                height: 363,
                child: SvgPicture.asset(
                  Assets.images.masterPasswordLight,
                  width: 406,
                  height: 363,
                ),
              ),
            ),
            const Gap(24),
            Center(
              child: Column(
                children: [
                  CustomInputWidget(
                    width: 280,
                    controller: passwordController,
                    placeholder: context.tr(LocaleKeys.enter_your_password),
                    obscureText: true,
                  ),
                  const Gap(24),
                  CustomInputWidget(
                    width: 280,
                    controller: confirmPasswordController,
                    placeholder: context.tr(LocaleKeys.confirm_password),
                    confirmationController: passwordController,
                    obscureText: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}