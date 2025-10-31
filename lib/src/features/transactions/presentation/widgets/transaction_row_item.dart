import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class TransactionRowItem extends StatelessWidget {
  const TransactionRowItem({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: Text(
            context.tr(title),
            style: TextStyle(
              color: AppTheme.of(context).extension<TransactionsPallet>()!.text,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              value,
              style: TextStyle(
                color: AppTheme.of(
                  context,
                ).extension<TransactionsPallet>()!.text,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
