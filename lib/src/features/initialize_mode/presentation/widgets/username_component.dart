import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/widgets/custom_input_widget.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ## [UserNameComponent] Class Documentation
///
/// The `UserNameComponent` provides a UI section for entering a username.
///
/// ### UI Components:
///
/// - **Username Label:**
///   - Displays the localized username text.like `context.tr(LocaleKeys.usr)`.
///   - Styled with `InterTextStyles.captionMedium` and `AppColors.primaryGray`.
///
/// - **Username Input Field:**
///   - Uses `CustomInputWidget` for input functionality.
///   - Placeholder text is set to `'pactus'`.
///   - Width is customized to `280`.
///   - Triggers `onChanged` callback on text change, logging the value for
///   debugging purposes.
///
///
class UserNameComponent extends StatefulWidget {
  const UserNameComponent({
    super.key,
  });

  @override
  UserNameComponentState createState() => UserNameComponentState();
}

class UserNameComponentState extends State<UserNameComponent> {
  String _usernameValue = 'pactus';
  bool isValid = false;

  bool validate() {
    final isValid = _usernameValue.isNotEmpty;
    setState(() => this.isValid = isValid);
    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 49,
      children: [
        Text(
          context.tr(LocaleKeys.username),
          style: InterTextStyles.captionMedium.copyWith(
            color: AppColors.primaryGray,
          ),
        ),
        CustomInputWidget(
          placeholder: 'pactus',
          width: 280,
          onChanged: (value) {
            _usernameValue = value;
          },
        ),
      ],
    );
  }
}
