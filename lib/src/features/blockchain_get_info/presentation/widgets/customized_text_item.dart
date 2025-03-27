import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class CustomizedTextItem extends StatelessWidget {
  const CustomizedTextItem({
    required this.title,
    super.key,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Text(
        title,
        style: TextStyle(color: AppTheme.of(context).accentColor),
      ),
    );
  }
}
