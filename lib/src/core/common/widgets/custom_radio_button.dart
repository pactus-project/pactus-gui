import 'package:fluent_ui/fluent_ui.dart';
import 'package:gap/gap.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ## [CustomRadioButton] Class Documentation
///
/// The `CustomRadioButton` is a stylized radio button widget
/// that allows users to select a single option from a group.
///
/// ### Properties:
///
/// - **[value]** (`T`)
///   - The value represented by this radio button.
///
/// - **[groupValue]** (`T`)
///   - The currently selected value in the group.
///   - If `value == groupValue`, this radio button is selected.
///
/// - **[onChanged]** (`ValueChanged<T>`)
///   - Callback triggered when the radio button is selected.
///
/// - **[label]** (`String`)
///   - The text label displayed next to the radio button.
///
/// - **[textStyle]** (`TextStyle?`)
///   - Custom style for the label text.
///
/// ### Constructor:
///
/// - `CustomRadioButton({required this.value, required this.groupValue,
/// required this.onChanged, required this.label, this.textStyle})`
///   - Creates a radio button with a customizable label and selection state.
///
/// ### Important Notes:
///
/// - Uses a `GestureDetector` to handle tap interactions.
/// - When selected, the button displays an inner filled circle.
/// - The label text is localizable using `context.tr(label)`.

class CustomRadioButton<T> extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
    this.textStyle,
  });

  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final String label;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: FluentTheme.of(context).accentColor,
                width: 2,
              ),
              color: Colors.white,
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: FluentTheme.of(context).accentColor,
                      ),
                    ),
                  )
                : null,
          ),
          const Gap(16),
          Text(
            context.tr(label),
            style: textStyle ??
                InterTextStyles.smallRegular.copyWith(
                  color: AppColors.primaryGray,
                ),
          ),
        ],
      ),
    );
  }
}
