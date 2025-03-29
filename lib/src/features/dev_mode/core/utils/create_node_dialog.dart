import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/enums/app_enums.dart';
import 'package:gui/src/features/dev_mode/presentation/bloc/environment_selection_state.dart';
import 'package:gui/src/features/dev_mode/presentation/widgets/dialog_action_widget.dart';
import 'package:gui/src/features/dev_mode/presentation/widgets/dialog_content_widget.dart';
import 'package:gui/src/features/dev_mode/presentation/widgets/dialog_title_widget.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

void createNodeDialog(
  BuildContext context,
  EnvironmentSelectionState collectedFormData,
  VoidCallback? callMethod,
) {
  final textStyle = TextStyle(
    color: AppTheme.of(context).extension<DarkPallet>()!.dark900,
  );

  final selected =
      collectedFormData.selectedEnvironment?.name ?? 'No option selected';

  bool? isValidateForm = false;
  if (collectedFormData.selectedEnvironment != null &&
      collectedFormData.password != null &&
      collectedFormData.password!.isNotEmpty &&
      collectedFormData.seeds != null &&
      collectedFormData.seeds!.isNotEmpty) {
    isValidateForm = true;
  }

  if (isValidateForm) {
    showDialog(
      context: context,
      builder: (context) => ContentDialog(
        style: ContentDialogThemeData(
          titleStyle: textStyle,
          bodyStyle: textStyle,
        ),
        title: DialogTitleWidget(title: 'Result', dialogType: DialogType.info),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(selected),
            const SizedBox(height: 8),
            Text('Password: ${collectedFormData.password}'),
            const SizedBox(height: 8),
            if (collectedFormData.seeds!.isNotEmpty)
              Text('Generated Seed: ${collectedFormData.seeds}'),
          ],
        ),
        actions: [
          FilledButton(
            child: Text(
              'Create Node',
              style: TextStyle(
                color: AppTheme.of(context)
                    .extension<OnAccentPallet>()!
                    .onAccentColor,
              ),
            ),
            onPressed: () async {
              Navigator.pop(context);
              await Future.delayed(Duration(seconds: 1), () {
                callMethod!();
              });
            },
          ),
          FilledButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                // If the button is pressed, return green, otherwise blue
                if (states.isHovered) {
                  return AppTheme.of(context).extension<RedPallet>()!.red500;
                }
                return AppTheme.of(context).extension<RedPallet>()!.red600;
              }),
            ),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: AppTheme.of(context).extension<LightPallet>()!.light900,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (context) => ContentDialog(
        style: ContentDialogThemeData(
          titleStyle: textStyle,
          bodyStyle: textStyle,
        ),
        title: DialogTitleWidget(
          title: 'Incomplete Form',
          dialogType: DialogType.warning,
        ),
        content: DialogContentWidget(title: 'Please complete the form.'),
        actions: [
          DialogActionWidget(
            dialogType: DialogType.normal,
            title: 'Ok',
            callToAction: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
