import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/common/widgets/custom_radio_button.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';

/// ## [RadioButtonGroup] Class Documentation
///
/// The `RadioButtonGroup` widget is a custom group of radio buttons,
/// each representing a different mode for node configuration.
/// It allows the user to select one of three options.
///
/// ### Properties:
///
/// - **selectedValue**: The currently selected
/// value from the radio button group.
/// - **onChanged**: A callback function that is triggered when
/// the user selects a different radio button. It passes the selected value.
///
/// ### UI Components:
///
/// - Three `CustomRadioButton` widgets representing different node setup modes:
///   - Create local node from scratch
///   - Restore local node from seed phrase
///   - Connect to a remote node
///
/// ### Important Notes:
///
/// - The `CustomRadioButton` widget handles the rendering and
/// interaction for individual radio buttons.
/// - The radio buttons are arranged in a column with a small
/// spacing between them.

class RadioButtonGroup extends StatelessWidget {
  const RadioButtonGroup({
    required this.selectedValue,
    required this.onChanged,
    super.key,
  });
  final int selectedValue;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        CustomRadioButton(
          value: 0,
          groupValue: selectedValue,
          onChanged: onChanged,
          label: LocaleKeys.create_local_node_from_scrache,
        ),
        CustomRadioButton(
          value: 1,
          groupValue: selectedValue,
          onChanged: onChanged,
          label: LocaleKeys.restore_local_node_from_seed_pharse,
        ),
        CustomRadioButton(
          value: 2,
          groupValue: selectedValue,
          onChanged: onChanged,
          label: LocaleKeys.connect_to_remote_node,
        ),
      ],
    );
  }
}
