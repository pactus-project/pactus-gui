import 'package:fluent_ui/fluent_ui.dart';
import 'package:gap/gap.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ## [ScreenHeaderWidget] Class Documentation
///
/// The `SeedScreenTitleSection` class represents a section of the UI
/// displaying a title and a description.
/// It is used to provide context and information to the user, typically
/// at the top of a screen or section.
///
/// ### Properties:
///
/// - **[title]** (String):
///   - The title text to be displayed in bold, typically a heading
///   for the section.
///
/// - **[description]** (String):
///   - The description text to be displayed in smaller, regular font,
///   providing additional context for the title.
///
/// ### Methods:
///
/// - **[build(BuildContext context)]**:
///   - Builds the UI for the section, displaying the title and description
///   in a column layout.
///   - The `Text` widgets display the localized version of the title and
///   description using the `context.tr()` method.
///   - A `Gap` is used to provide spacing between the title and description,
///   as well as after the description.
///
/// ### Notes:
///
/// - The title is styled using a bold body style, while the description uses a
/// smaller regular style.
/// - Colors for the text are set using the `AppColors` class, with
/// `primaryDark` for the title and `primaryGray` for the description.

class ScreenHeaderWidget extends StatelessWidget {
  const ScreenHeaderWidget({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr(title),
          style: InterTextStyles.bodyStrong.copyWith(
            color: AppTheme.of(context).extension<DarkPallet>()!.contrast,
          ),
        ),
        const Gap(8),
        Text(
          context.tr(description),
          style: InterTextStyles.body.copyWith(
            color: AppTheme.of(context).extension<DarkPallet>()!.dark700,
          ),
        ),
        const Gap(24),
      ],
    );
  }
}
