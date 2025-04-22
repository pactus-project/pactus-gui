import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class AddressesCardContentItem extends StatelessWidget {
  const AddressesCardContentItem({
    super.key,
    required this.contact,
    required this.width,
    this.textAlign = TextAlign.start,
  });

  final String contact;
  final double width;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        contact,
        style: AppTheme.of(context).typography.caption!.copyWith(
              color: AppTheme.of(context).extension<DarkPallet>()!.dark800,
            ),
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
      ),
    );
  }
}
