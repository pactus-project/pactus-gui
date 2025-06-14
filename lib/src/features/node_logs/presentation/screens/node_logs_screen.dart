import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class NodeLogsScreen extends StatelessWidget {
  const NodeLogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.of(context).extension<BlueGrayPallet>()!.blueGray100,
      width: double.infinity,
      child: Center(
        child: Text(
          '${context.tr(LocaleKeys.coming_soon)}'
          '...',
          style: TextStyle(
            color: AppTheme.of(context).extension<DarkPallet>()!.dark900,
          ),
        ),
      ),
    );
  }
}
