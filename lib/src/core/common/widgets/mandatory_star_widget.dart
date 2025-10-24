import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart' show AppTheme, RedPallet;

class MandatoryStarWidget extends StatelessWidget {
  const MandatoryStarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      ' * ',
      style: TextStyle(
        color: AppTheme.of(context).extension<RedPallet>()!.red500,
      ),
    );
  }
}
