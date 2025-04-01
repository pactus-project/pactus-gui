import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gui/src/core/common/widgets/custom_input_widget.dart';
import 'package:gui/src/core/common/widgets/screen_header_widget.dart';
import 'package:gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';

/// ## [MasterPasswordSection] Class Documentation
///
/// The `MasterPasswordSection` class represents a UI section for
/// setting a master password.
/// It includes input fields for password entry and confirmation,
/// along with a title and an illustration.
///
/// ### Properties:
///
/// - **[passwordController]** (TextEditingController):
///   - Controls the input field for the master password.
///
/// - **[confirmPasswordController]** (TextEditingController):
///   - Controls the input field for confirming the master password.
///
/// ### Methods:
///
/// - **[build(BuildContext context)]**:
///   - Builds the UI of the section, which includes:
///     - A `SeedScreenTitleSection` displaying the title and description.
///     - A centered SVG illustration for visual representation.
///     - Two `CustomInputWidget` fields for entering and confirming
///     the master password.
///

class MasterPasswordSection extends StatelessWidget {
  const MasterPasswordSection({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
  });
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: const ScreenHeaderWidget(
            title: LocaleKeys.master_password,
            description: LocaleKeys.master_password_description,
          ),
        ),
        SizedBox(
          height: 250,
          child: SvgPicture.asset(
            Assets.images.masterPasswordLight,
          ),
        ),
        Column(
          spacing: 24,
          children: [
            CustomInputWidget(
              width: 280,
              controller: passwordController,
              placeholder: context.tr(LocaleKeys.enter_your_password),
              obscureText: true,
            ),
            CustomInputWidget(
              width: 280,
              controller: confirmPasswordController,
              placeholder: context.tr(LocaleKeys.confirm_password),
              confirmationController: passwordController,
              obscureText: true,
            ),
          ],
        ),
      ],
    );
  }
}
