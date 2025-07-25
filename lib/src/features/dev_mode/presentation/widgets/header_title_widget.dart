import 'package:fluent_ui/fluent_ui.dart';

class HeaderTitleWidget extends StatelessWidget {
  const HeaderTitleWidget({super.key, required this.textStyle});

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Setting Pactus GUI Network',
        style: textStyle.copyWith(fontSize: 32, height: 1),
      ),
    );
  }
}
