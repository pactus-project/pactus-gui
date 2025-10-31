import 'package:fluent_ui/fluent_ui.dart'
    show
        BuildContext,
        Row,
        Spacer,
        StatelessWidget,
        Text,
        TextOverflow,
        TextStyle,
        Widget;
import 'package:pactus_gui/src/core/common/widgets/mandatory_star_widget.dart'
    show MandatoryStarWidget;
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart'
    show AppTheme, DarkPallet;

class FormRowItem extends StatelessWidget {
  const FormRowItem({
    super.key,
    required this.title,
    required this.inputWidget,
    this.isMandatory = false,
  });

  final String title;
  final bool isMandatory;
  final Widget inputWidget;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          context.tr(title),
          style: TextStyle(
            color: AppTheme.of(context).extension<DarkPallet>()!.contrast,
          ),
          maxLines: 2,
          overflow: TextOverflow.fade,
        ),
        if (isMandatory) const MandatoryStarWidget(),
        Spacer(),
        inputWidget,
      ],
    );
  }
}
