import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui/src/core/common/colors/app_colors.dart';
import 'package:pactus_gui/src/core/common/widgets/custom_password_widget.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
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
class PasswordComponent extends StatefulWidget {
  const PasswordComponent({
    super.key,
  });

  @override
  PasswordComponentState createState() => PasswordComponentState();
}

class PasswordComponentState extends State<PasswordComponent> {
  String _passwordValue = '12345678';
  bool isValid = false;

  bool validate() {
    final isValid = _passwordValue.isNotEmpty;
    setState(() => this.isValid = isValid);
    return isValid;
  }

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
          placeholder: '********',
          width: 280,
          onChanged: (value) {
            _passwordValue = value;
          },
        ),
      ],
    );
  }
}
