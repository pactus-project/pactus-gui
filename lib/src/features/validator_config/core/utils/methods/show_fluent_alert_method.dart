import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ## [showFluentAlert] Function Documentation
///
/// Displays an [InfoBar] alert in a Fluent UI application.
///
/// ### Parameters:
///
/// - **[context]** ([BuildContext], required):
///   - The context in which to display the alert.
///
/// ### Behavior:
///
/// - Calls [displayInfoBar] to show an error message.
/// - Displays a title **"Error"** with an error severity.
/// - Shows a message: **"Directory is not empty.
/// Need empty directory to continue."**
/// - Includes an "OK" button to close the alert.
///
void showFluentAlert(BuildContext context, String message) {
  displayInfoBar(
    context,
    builder: (context, close) {
      return InfoBar(
        title: Text(
          context.tr(LocaleKeys.error),
          style: TextStyle(
            color: AppTheme.of(context).extension<RedPallet>()!.red700,
          ),
        ),
        content: Text(
          message,
          style: TextStyle(
            color: AppTheme.of(context).extension<RedPallet>()!.red700,
          ),
        ),
        action: Button(
          onPressed: close,
          child: const Text('OK'),
        ),
        severity: InfoBarSeverity.error,
      );
    },
  );
}
