import 'package:fluent_ui/fluent_ui.dart';
import 'package:gap/gap.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

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
              border: Border.all(color: AppColors.radioButtonActiveColor,
                  width: 2,),
              color: Colors.white,
            ),
            child: isSelected
                ? Center(
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.radioButtonActiveColor,
                ),
              ),
            )
                : null,
          ),
          const Gap(16),
          Text(
            context.tr(label),
            style: textStyle ?? InterTextStyles.smallRegular.copyWith(
          color: AppColors.primaryGray,
          ),
          ),
        ],
      ),
    );
  }
}
