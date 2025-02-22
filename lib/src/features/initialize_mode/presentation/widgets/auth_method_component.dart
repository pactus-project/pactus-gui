import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/widgets/custom_expandable_widget.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ## [AuthMethodComponent] Class Documentation
///
/// The `AuthMethodComponent` provides a UI section for selecting
/// an authentication method.
///
/// ### UI Components:
///
/// - **Authentication Method Label:**
///   - Displays the text from `LocaleKeys.auth_method`.
///   - Styled using `InterTextStyles.captionMedium`
///   with `AppColors.primaryGray`
///
/// - **Expandable Authentication Options:**
///   - Uses `CustomExpandableWidget` to provide a dropdown menu.
///   - Header displays `LocaleKeys.basic_auth`.
///   - Body contains authentication method options (e.g., `Item 1`, `Item 2`).
///   - Styled with `light900` color from `LightPallet`.
///
class AuthMethodComponent extends StatefulWidget {
  const AuthMethodComponent({super.key});

  @override
  State<AuthMethodComponent> createState() => _AuthMethodComponentState();
}

class _AuthMethodComponentState extends State<AuthMethodComponent> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Row(
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
          isExpanded: _isExpanded,
          onToggle: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
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
          headerColor: AppTheme.of(context).extension<LightPallet>()!.light900!,
          expandedColor:
              AppTheme.of(context).extension<LightPallet>()!.light900!,
          padding: const EdgeInsets.all(8),
          animationDuration: 400,
          width: 125,
          maxHeight: 200,
        ),
      ],
    );
  }
}
