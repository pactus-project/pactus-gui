import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/widgets/custom_input_widget.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ## [CustomInputRow] Class Documentation
///
/// The `CustomInputRow` widget is a reusable row
/// layout for labeled text input fields.
///
/// ### Properties:
///
/// - **label**: The text displayed as the input field label.
/// - **controller**: Manages the text input state.
/// - **placeholder**: Placeholder text inside the input field.
/// - **obscureText**: Boolean to determine if the input should
/// be hidden (e.g., for passwords).
/// - **spacing**: Defines the space between the label and the input field.
///
/// ### UI Components:
///
/// - A `Text` widget displays the localized label.
/// - A `CustomInputWidget` provides the text input functionality.
///
/// ### Important Notes:
///
/// - Uses `Fluent UI` for consistent styling.
/// - Handles `onChanged` and `onSubmitted` events with debug logs.
/// - Designed for flexibility in spacing and input behavior.

class CustomInputRow extends StatelessWidget {
  const CustomInputRow({
    required this.label,
    required this.controller,
    required this.placeholder,
    this.obscureText = false,
    super.key,
    required this.spacing,
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
