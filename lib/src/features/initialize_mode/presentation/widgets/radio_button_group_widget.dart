import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:pactus_gui/src/core/common/widgets/custom_radio_button.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui/src/features/main/radio_button_cubit/presentation/radio_button_cubit.dart'
    show RadioButtonCubit;
import 'package:pactus_gui_widgetbook/app_styles.dart';

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
    final textStyle = TextStyle(
      color: AppTheme.of(context).extension<DarkPallet>()!.dark800,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        CustomRadioButton(
          value: 0,
          groupValue: selectedValue,
          textStyle: textStyle,
          onChanged: onChanged,
          label: LocaleKeys.create_local_node_from_scratch,
        ),
        CustomRadioButton(
          textStyle: textStyle,
          value: 1,
          groupValue: selectedValue,
          onChanged: onChanged,
          label: LocaleKeys.restore_local_node_from_seed_pharse,
        ),
        Row(
          children: [
            CustomRadioButton(
              value: 2,
              groupValue: selectedValue,
              textStyle: textStyle,
              onChanged: onChanged,
              label: LocaleKeys.connect_to_remote_node,
            ),
            SizedBox(width: 16),
            BlocBuilder<RadioButtonCubit, int>(
              builder: (context, selectedValue) {
                return selectedValue == 2
                    ? Text(
                        context.tr(LocaleKeys.coming_soon),
                        style: AppTheme.of(context).typography.body?.copyWith(
                          color: AppTheme.of(context).accentColor,
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    /*RemoteNodeSection(key: _remoteNodeSectionKey,)*/
                    : SizedBox();
              },
            ),
          ],
        ),
      ],
    );
  }
}
