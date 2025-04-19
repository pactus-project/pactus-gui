import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.of(context).extension<GreenPallet>()!.green700,
      width: double.infinity,
    );
  }
}
