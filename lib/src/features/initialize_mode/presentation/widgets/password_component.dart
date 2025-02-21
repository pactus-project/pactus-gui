import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/widgets/custom_password_widget.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ## [PasswordComponent] Class Documentation
///
/// The `PasswordComponent` provides a UI section for entering a password.
///
/// ### UI Components:
///
/// - **Password Label:**
///   - Displays the localized password text . `context.tr(LocaleKeys.password)`
///   - Styled with `InterTextStyles.captionMedium` and `AppColors.primaryGray`.
///
/// - **Password Input Field:**
///   - Uses `CustomInputWidget` for password input functionality.
///   - Placeholder text is set to `'12345678'`.
///   - Width is customized to `280`.
///   - Triggers `onChanged` callback on text change, logging the value for
///   debugging purposes.
///
class PasswordComponent extends StatelessWidget {
  const PasswordComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 51,
      children: [
        Text(
          context.tr(LocaleKeys.password),
          style: InterTextStyles.captionMedium.copyWith(
            color: AppColors.primaryGray,
          ),
        ),
        CustomPasswordWidget(
          placeholder: context.tr(LocaleKeys.enter_your_password),
          width: 280,
          onChanged: (value) {
            debugPrint('Text changed: $value');
          },
        ),
      ],
    );
  }
}
