import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/common/widgets/custom_radio_button.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';

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
