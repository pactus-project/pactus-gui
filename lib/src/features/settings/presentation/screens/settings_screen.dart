import 'package:fluent_ui/fluent_ui.dart';
import 'package:gap/gap.dart' show Gap;
import 'package:gui/src/core/common/widgets/accent_color_picker_widget.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/main/language/presentation/widget/language_combo_box.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart'
    show AppTheme, DarkPallet, InterTextStyles;

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 53, left: 32),
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
                style: InterTextStyles.smallRegular.copyWith(
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
                style: InterTextStyles.smallRegular.copyWith(
                  color: AppTheme.of(context).extension<DarkPallet>()!.dark900,
                ),
              ),
              ComboBoxLanguageSelector(),
            ],
          ),
        ],
      ),
    );
  }
}
