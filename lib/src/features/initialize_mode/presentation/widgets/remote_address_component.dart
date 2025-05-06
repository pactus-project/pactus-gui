import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui/src/core/common/widgets/custom_input_widget.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ## [RemoteAddressComponent] Class Documentation
///
/// The `RemoteAddressComponent` provides a UI section for entering a
/// remote address.
///
/// ### UI Components:
///
/// - **Remote Address Label:**
///   - Displays the localized remote address text.`context.tr(LocaleKeys.add)`
///   - Styled with `InterTextStyles.caption` and
///   `AppTheme.of(context).extension<GrayPallet>()!.contrast`.
///
/// - **Remote Address Input Field:**
///   - Uses `CustomInputWidget` for input functionality.
///   - Placeholder text is set to `'pactus.example.com:1234'`.
///   - Width is customized to `280`.
///   - Triggers `onChanged` callback on text change, logging the value for
///   debugging purposes.
///
class RemoteAddressComponent extends StatefulWidget {
  const RemoteAddressComponent({super.key});

  @override
  RemoteAddressComponentState createState() => RemoteAddressComponentState();
}

class RemoteAddressComponentState extends State<RemoteAddressComponent> {
  String _remoteAddressValue = 'pactus.example.com:1234';
  bool isValid = false;

  bool validate() {
    final isValid = _remoteAddressValue.isNotEmpty;
    setState(() => this.isValid = isValid);
    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 13,
      children: [
        Text(
          context.tr(LocaleKeys.remote_address),
          style: InterTextStyles.caption.copyWith(
            color: AppTheme.of(context).extension<GrayPallet>()!.contrast,
          ),
        ),
        CustomInputWidget(
          placeholder: 'pactus.example.com:1234',
          width: 280,
          onChanged: (value) {
            _remoteAddressValue = value;
          },
        ),
      ],
    );
  }
}
