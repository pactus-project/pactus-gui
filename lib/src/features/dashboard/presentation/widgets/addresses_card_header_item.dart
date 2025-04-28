import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class AddressesCardHeaderItem extends StatelessWidget {
  const AddressesCardHeaderItem({
    super.key,
    required this.label,
    required this.size,
  });
  final String label;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Text(
        context.tr(label),
        style: AppTheme.of(context).typography.bodyStrong!.copyWith(
              color: AppTheme.of(context).extension<DarkPallet>()!.dark800,
            ),
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
