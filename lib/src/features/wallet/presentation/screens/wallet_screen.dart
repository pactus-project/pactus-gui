import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.of(context).extension<BlueGrayPallet>()!.blueGray100,
      width: double.infinity,
    );
  }
}
