import 'package:fluent_ui/fluent_ui.dart';

class CustomReadOnlyTextBox extends StatelessWidget {
  const CustomReadOnlyTextBox({super.key, required this.text, required this.index});
  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return TextBox(
      controller: TextEditingController(text: '${index + 1}. $text'),
      readOnly: true,
      placeholder: 'Seed',
      style: FluentTheme.of(context).typography.body!.copyWith(
        color: FluentTheme.of(context).typography.body!.color?.withOpacity(0.7),
      ),
      decoration: WidgetStateProperty.all(
        BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: FluentTheme.of(context).acrylicBackgroundColor,
          ),
        ),
      ),
    );
  }
}
