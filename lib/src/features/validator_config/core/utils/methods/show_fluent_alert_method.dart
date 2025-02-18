
import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';

void showFluentAlert(BuildContext context) {
  displayInfoBar(
    context,
    builder: (context, close) {
      return InfoBar(
        title: Text(
          'Error',
          style: TextStyle(color: AppColors.primaryDark),
        ),
        content: Text(
          'Directory is not empty. need empty directory to continue',
          style: TextStyle(color: AppColors.primaryDark),
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
