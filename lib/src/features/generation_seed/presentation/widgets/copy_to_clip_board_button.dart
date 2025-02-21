import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/widgets/adaptive_text_button.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class CopyToClipboardButton extends StatelessWidget {
  const CopyToClipboardButton({
    required this.seedWords,
    super.key,
  });
  final List<String> seedWords;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: AdaptiveTextButton(
        textColor: AppColors.radioButtonActiveColor,
        icon: const Icon(
          FluentIcons.copy,
          size: 16,
          color: AppColors.radioButtonActiveColor,
        ),
        text: LocaleKeys.copy_to_clipboard,
        onPressed: () async {
          final seedWordsText = seedWords.join(' ');
          await Clipboard.setData(ClipboardData(text: seedWordsText));

          if (!context.mounted) {
            return;
          }

          await showDialog(
            context: context,
            builder: (context) => ContentDialog(
              title: Text(
                context.tr(LocaleKeys.clipboard_dialog_title),
                style: InterTextStyles.bodyBold.copyWith(color: AppColors.primaryDark),
              ),
              content: Text(
                context.tr(LocaleKeys.clipboard_dialog_content),
                style: InterTextStyles.captionMedium.copyWith(color: AppColors.primaryDark),
              ),
              actions: [
                AdaptiveTextButton(
                  text: context.tr(LocaleKeys.ok),
                  onPressed: () {
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          );
        },

        isFilled: false,
      ),
    );
  }
}
