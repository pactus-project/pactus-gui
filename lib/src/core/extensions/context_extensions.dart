import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/enums/app_enums.dart';
import 'package:pactus_gui_widgetbook/app_core.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';
import 'package:gui/src/core/enums/app_enums.dart';
import 'package:pactus_gui_widgetbook/app_core.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';
// TODO(esmaeil): this part need correction in widgetbook repo
// ignore_for_file: implementation_imports
import 'package:pactus_gui_widgetbook/src/core/enum/pane_text_mode_enum.dart';

/// An extension on [BuildContext] to determine the pane text color
/// based on the enabled state of the text style.
extension ExtensionOnBoolean on BuildContext {
  /// [detectPaneTextColor] Documentation
  /// Returns the corresponding pane text color based on [isEnabledTextStyle].
  ///
  /// - If `true`, returns the color for [PaneTextMode.enabled].
  /// - If `false`, returns the color for [PaneTextMode.disabled].
  ///
  /// Example:
  /// ```dart
  /// Color textColor = context.detectPaneTextColor(isEnabledTextStyle: true);
  /// ```
  Color detectPaneTextColor({required bool isEnabledTextStyle}) {
    return isEnabledTextStyle
        ? fromPaneTextMode(PaneTextMode.enabled)
        : fromPaneTextMode(PaneTextMode.disabled);
  }

  /// [isDarkTheme] Documentation
  /// **[isDarkTheme]** used for detect theme modes and if Theme is dark mode ,
  /// return true and else return false.
  ///
  /// Example:
  /// ```dart
  /// Text(context.isDarkTheme?'dark mode':'light mode');
  /// ```
  bool isDarkTheme() {
    return FluentTheme.of(this).brightness == Brightness.dark;
  }
}

extension DialogTypeOnContext on BuildContext {
  Color getDialogTypesColor(DialogType type) {
    return switch (type) {
      DialogType.error => AppTheme.of(this).extension<RedPallet>()!.red600!,
      DialogType.info => AppTheme.of(this).extension<BluePallet>()!.blue600!,
      DialogType.succeed =>
        AppTheme.of(this).extension<GreenPallet>()!.green600!,
      DialogType.warning =>
        AppTheme.of(this).extension<OrangePallet>()!.orange600!,
      DialogType.normal => AppTheme.of(this).accentColor,
    };
  }
}
