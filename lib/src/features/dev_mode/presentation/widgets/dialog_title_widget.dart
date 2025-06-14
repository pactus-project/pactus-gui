import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui/src/core/enums/app_enums.dart';
import 'package:pactus_gui/src/core/extensions/context_extensions.dart';

class DialogTitleWidget extends StatelessWidget {
  const DialogTitleWidget({
    super.key,
    required this.title,
    required this.dialogType,
  });
  final String title;
  final DialogType dialogType;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Center(
          child: Text(
            title,
            style: TextStyle(color: context.getDialogTypesColor(dialogType)),
          ),
        ),
        Divider(style: DividerThemeData(thickness: 2)),
      ],
    );
  }
}
