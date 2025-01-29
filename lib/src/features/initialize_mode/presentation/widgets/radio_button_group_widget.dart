import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/common/widgets/custom_radio_button.dart';

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
          label: 'Create local node from scratch',
        ),
        CustomRadioButton(
          value: 1,
          groupValue: selectedValue,
          onChanged: onChanged,
          label: 'Restore local node from seed phrase',
        ),
        CustomRadioButton(
          value: 2,
          groupValue: selectedValue,
          onChanged: onChanged,
          label: 'Connect to remote node',
        ),
      ],
    );
  }
}