
import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/widgets/custom_input_widget.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class CustomInputRow extends StatelessWidget {

  const CustomInputRow({
    required this.label,
    required this.controller,
    required this.placeholder,
    this.obscureText = false,
    super.key, required this.spacing,
  });
  final String label;
  final TextEditingController controller;
  final String placeholder;
  final bool obscureText;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: spacing,
      children: [
        Text(
          context.tr(label),
          style: InterTextStyles.captionMedium.copyWith(
            color: AppColors.primaryGray,
          ),
        ),
        CustomInputWidget(
          controller: controller,
          placeholder: placeholder,
          width: 280,
          onChanged: (value) {
            debugPrint('Text changed: $value');
          },
          onSubmitted: (value) {
            debugPrint('Text submitted: $value');
          },
          obscureText: obscureText,
        ),
      ],
    );
  }
}