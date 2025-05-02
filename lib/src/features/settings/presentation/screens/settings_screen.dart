import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_app_info/flutter_app_info.dart';
import 'package:gap/gap.dart' show Gap;
import 'package:pactus_gui/src/core/common/widgets/accent_color_picker_widget.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui/src/features/main/language/presentation/widget/language_combo_box.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart'
    show AppTheme, DarkPallet, InterTextStyles;

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 53, left: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 13,
            children: [
              Text(
                context.tr(
                  LocaleKeys.accent_color,
                ),
                style: InterTextStyles.body.copyWith(
                  color: AppTheme.of(context).extension<DarkPallet>()!.dark900,
                ),
              ),
              const AccentColorPicker(),
            ],
          ),
          const Gap(24),
          Row(
            spacing: 16,
            children: [
              Text(
                context.tr(LocaleKeys.language),
                style: InterTextStyles.body.copyWith(
                  color: AppTheme.of(context).extension<DarkPallet>()!.dark900,
                ),
              ),
              ComboBoxLanguageSelector(),
            ],
          ),
          Gap(24),
          Text(
            '${context.tr(LocaleKeys.current_application_version)}'
            ' : '
            '${AppInfo.of(context).package.version}',
            style: FluentTheme.of(context).typography.body?.copyWith(
                  color: AppTheme.of(context).extension<DarkPallet>()!.dark900,
                ),
          ),
        ],
      ),
    );
  }
}
