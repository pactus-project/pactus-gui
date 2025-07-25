import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui/src/core/enums/app_enums.dart';
import 'package:pactus_gui/src/core/extensions/context_extensions.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class DialogActionWidget extends StatelessWidget {
  const DialogActionWidget({
    super.key,
    required this.title,
    required this.callToAction,
    required this.dialogType,
  });
  final String title;
  final DialogType dialogType;
  final VoidCallback callToAction;
  @override
  Widget build(BuildContext context) {
    final buttonColor = context.getDialogTypesColor(dialogType);
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 100),
      child: OutlinedButton(
        onPressed: callToAction,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            // If the button is pressed, return green, otherwise blue
            if (states.isHovered) {
              return buttonColor.toAccentColor().lighter;
            }
            return buttonColor;
          }),
        ),
        child: Text(
          context.tr(title),
          style: TextStyle(
            color: AppTheme.of(
              context,
            ).extension<OnAccentPallet>()!.onAccentColor,
          ),
        ),
      ),
    );
  }
}
