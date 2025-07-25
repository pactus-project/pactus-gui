import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/extensions/string_extensions.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/features/generation_seed/core/constants/enums/seed_type_enum.dart';
import 'package:pactus_gui/src/features/generation_seed/presentation/cubits/seed_type_cubit.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ## [SeedNotesSection] Class Documentation
///
/// The `SeedNotesSection` class is a stateless widget that displays notes
/// and warnings related to seed generation. This section is temporary and
/// will be re-designed in the future by the UI team.
///
/// ### UI Components:
///
/// - **Note Texts (`Text`)**:
///   - Displays various notes and warnings related to seed generation.
///   - Uses `InterTextStyles.caption` with
///   `AppTheme.of(context).extension<GrayPallet>()!.contrast` for
///     styling.
///
/// - **Warning Texts (`Text`)**:
///   - Displays warnings as list items, each starting with a dash (`-`).
///   - Each warning is styled similarly to the note texts.
///
/// ### Notes:
///
/// - The section is labeled as temporary and requires re-design.
/// - Uses `context.tr(LocaleKeys...)` for localization.
/// - Provides multiple `Text` widgets, each displaying a localized message.
/// - Consistent text styling with appropriate color for readability.

/// to-do: this is temporary class cause this section need to be re-design
/// by UI team. after that we should refactor this section by Pouria
class SeedNotesSection extends StatelessWidget {
  const SeedNotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<DropdownCubit<SeedTypeEnum>, SeedTypeEnum>(
          builder: (context, state) {
            return Text(
              context.tr(LocaleKeys.generation_seed_note1).replacePlaceholders([
                '${state.qty}',
              ]),
              style: InterTextStyles.body.copyWith(
                color: AppTheme.of(context).extension<GrayPallet>()!.contrast,
              ),
            );
          },
        ),
        Text(
          context.tr(LocaleKeys.generation_seed_note2),
          style: InterTextStyles.body.copyWith(
            color: AppTheme.of(context).extension<GrayPallet>()!.contrast,
          ),
        ),
        Text(
          context.tr(LocaleKeys.warning),
          style: InterTextStyles.body.copyWith(
            color: AppTheme.of(context).extension<GrayPallet>()!.contrast,
          ),
        ),
        Text(
          '- ${context.tr(LocaleKeys.generation_seed_warning1)}',
          style: InterTextStyles.body.copyWith(
            color: AppTheme.of(context).extension<GrayPallet>()!.contrast,
          ),
        ),
        Text(
          '- ${context.tr(LocaleKeys.generation_seed_warning2)}',
          style: InterTextStyles.body.copyWith(
            color: AppTheme.of(context).extension<GrayPallet>()!.contrast,
          ),
        ),
        Text(
          '- ${context.tr(LocaleKeys.generation_seed_warning3)}',
          style: InterTextStyles.body.copyWith(
            color: AppTheme.of(context).extension<GrayPallet>()!.contrast,
          ),
        ),
      ],
    );
  }
}
