import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_core.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';
import 'package:pactus_gui_widgetbook/app_widgets.dart';

/// ## [CopyToClipboardButton] Class Documentation
///
/// A stateless widget that provides a button to trigger a clipboard copy.
/// When pressed, it executes `copyClipboardFunction` and shows a confirmation.
///
/// ### Properties:
///
/// - **`copyClipboardFunction`** (`required`):
///   - Type: `Future<void> Function()`
///   - Runs an async function that copies data to the clipboard.
///
/// - **`key`**:
///   - Type: `Key?`
///   - Optional key to identify this widget in the tree.
///
/// ### Behavior:
///
/// 1. Executes `copyClipboardFunction` asynchronously.
/// 2. Shows a confirmation dialog upon completion.
/// 3. If the widget is removed before completion, no dialog is shown.
///
/// ### UI Components:
///
/// - **`AdaptiveTextButton`**:
///   - Displays a button with:
///     - Icon (`FluentIcons.copy`).
///     - Localized text (`LocaleKeys.copy_to_clipboard`).
///     - Styled using `AppColors.radioButtonActiveColor`.
///
/// - **`ContentDialog`**:
///   - Confirms the clipboard copy operation.
///   - Contains:
///     - **Title** (`LocaleKeys.clipboard_dialog_title`).
///     - **Message** (`LocaleKeys.clipboard_dialog_content`).
///     - **"OK" Button** to close the dialog.
///   - Uses `context.tr(...)` for localization.
///
/// ### Notes:
///
/// - **Clipboard Operation**:
///   - The actual copy logic is handled by `copyClipboardFunction`,which should
///     use `Clipboard.setData(ClipboardData(text: ...))` or similar.
///
/// - **Context Safety**:
///   - Checks `context.mounted` before showing the dialog to avoid errors.
///
/// - **Localization**:
///   - All text is localized via `LocaleKeys` and `context.tr(...)`.
///
class CopyToClipboardButton extends StatelessWidget {
  const CopyToClipboardButton({
    required this.copyClipboardFunction,
    super.key,
  });

  final Future<void> Function() copyClipboardFunction;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: IntrinsicWidth(
        child: SizedBox(
          height: 24,
          child: AdaptiveTextButton.createIconAndTitle(
            requestState: RequestStateEnum.loaded,
            prefixIcon: FluentIcons.copy,
            title: context.tr(LocaleKeys.copy_to_clipboard),
            onPressed: () async {
              await copyClipboardFunction();

              if (!context.mounted) {
                return;
              }

              await showDialog(
                context: context,
                builder: (context) => ContentDialog(
                  title: Text(
                    context.tr(LocaleKeys.clipboard_dialog_title),
                    style: InterTextStyles.bodyStrong.copyWith(
                      color:
                          AppTheme.of(context).extension<DarkPallet>()!.dark900,
                    ),
                  ),
                  content: Text(
                    context.tr(LocaleKeys.clipboard_dialog_content),
                    style: InterTextStyles.caption.copyWith(
                      color:
                          AppTheme.of(context).extension<DarkPallet>()!.dark700,
                    ),
                  ),
                  actions: [
                    IntrinsicWidth(
                      child: SizedBox(
                        height: 32,
                        child: AdaptivePrimaryButton.createTitleOnly(
                          onPressed: () {
                            if (context.mounted) {
                              Navigator.pop(context);
                            }
                          },
                          requestState: RequestStateEnum.loaded,
                          title: context.tr(LocaleKeys.ok),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
