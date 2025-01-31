import 'package:fluent_ui/fluent_ui.dart';
import 'package:gap/gap.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/widgets/custom_expandable_widget.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/initialize_mode/presentation/widgets/custom_input_row.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';
/// ## [RemoteNodeSection] Class Documentation
///
/// The `RemoteNodeSection` provides a UI section for
/// configuring remote node settings.
///
/// ### Properties:
///
/// - **Text Controllers:**
///   - `_remoteAddressController`: Manages input for the remote node address.
///   - `_usernameController`: Manages input for the username.
///   - `_passwordController`: Manages input for the password.
///
/// ### UI Components:
///
/// - **Remote Address Input:**
///   - Uses `CustomInputRow` to capture the remote node address.
///
/// - **Authentication Method Selection:**
///   - Displays `LocaleKeys.auth_method` label.
///   - Provides an expandable menu (`CustomExpandableWidget`)
///   for authentication options.
///
/// - **Username and Password Fields:**
///   - Uses `CustomInputRow` for entering credentials.
///   - Password input supports `obscureText` for security.
///
/// ### Important Notes:
///
/// - Uses `Fluent UI` components for styling consistency.
/// - `CustomExpandableWidget` provides expandable authentication
/// method selection.
/// - Spacing and layout are adjusted for proper alignment.

class RemoteNodeSection extends StatefulWidget {
  const RemoteNodeSection({super.key});

  @override
  State<RemoteNodeSection> createState() => _RemoteNodeSectionState();
}

class _RemoteNodeSectionState extends State<RemoteNodeSection> {
  final TextEditingController _remoteAddressController =
  TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomInputRow(
          label: LocaleKeys.remote_address,
          controller: _remoteAddressController,
          placeholder: 'pactus.example.com:1234', spacing: 13,
        ),
        const Gap(28),
        Row(
          spacing: 33,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
    LocaleKeys.auth_method,
              style: InterTextStyles.captionMedium.copyWith(
                color: AppColors.primaryGray,
              ),
            ),
            CustomExpandableWidget(
              header: LocaleKeys.basic_auth,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Item 1',
                    style: InterTextStyles.captionMedium.copyWith(
                      color: AppColors.primaryGray,
                    ),
                  ),
                  Text(
                    'Item 2',
                    style: InterTextStyles.captionMedium.copyWith(
                      color: AppColors.primaryGray,
                    ),
                  ),
                ],
              ),
              headerColor: AppTheme.of(context)
                  .extension<SurfacePallet>()!
                  .surface3!,
              expandedColor: AppTheme.of(context)
                  .extension<SurfacePallet>()!
                  .surface3!,
              padding: EdgeInsets.all(8),
              animationDuration: 400,
              width: 125,
              maxHeight: 200,
            ),
          ],
        ),
        const Gap(28),
        CustomInputRow(
          label: LocaleKeys.username,
          controller: _usernameController,
          placeholder: 'pactus', spacing: 49,
        ),
        const Gap(28),
        CustomInputRow(
          label: LocaleKeys.password,
          controller: _passwordController,
          placeholder: '12345678',
          obscureText: true, spacing: 51,
        ),
      ],
    );
  }
}
