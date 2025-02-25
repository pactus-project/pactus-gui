import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/widgets/adaptive_text_button.dart';
import 'package:gui/src/core/utils/daemon_manager/node_config_data.dart';
import 'package:gui/src/core/utils/daemon_manager/seed_generator.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/generation_seed/core/constants/enums/seed_type_enum.dart';
import 'package:gui/src/features/generation_seed/presentation/cubits/seed_type_cubit.dart';
import 'package:gui/src/features/generation_seed/presentation/sections/generation_seed_title_section.dart';
import 'package:gui/src/features/generation_seed/presentation/sections/seed_notes_section.dart';
import 'package:gui/src/features/generation_seed/presentation/sections/seeds_words_grid_section.dart';
import 'package:gui/src/features/generation_seed/presentation/widgets/copy_to_clip_board_button.dart';
import 'package:gui/src/features/generation_seed/presentation/widgets/seed_type_selector_widget.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';

/// ## [GenerationSeedScreen] Class Documentation
///
/// The `GenerationSeedScreen` class is a stateful widget responsible for
/// displaying and managing the seed generation process.
///
/// ### Properties:
///
/// - **'_menuExpanded'** (`bool`):
///   - Determines whether the seed type selector menu is expanded.
///
/// ### Behavior:
///
/// - Uses `BlocBuilder<SeedTypeCubit, SeedTypeEnum>` to generate seed words
///   based on the selected seed type (12 or 24 words).
/// - Displays the generated seed words in a `SeedWordsGridSection`.
/// - Provides an option to copy the seed words to the clipboard using
///   `CopyToClipboardButton`.
/// - Includes a `SeedNotesSection` to show important information about seed
///   usage.
/// - Allows the user to navigate forward using an `AdaptiveTextButton`, which:
///   - Saves the generated seed in `NodeConfigData.instance.restorationSeed`.
///   - Updates the navigation index in `NavigationPaneCubit`.
///
/// ### UI Components:
///
/// - **[GenerationSeedTitleSection]**:
///   - Displays the title for the seed generation screen.
///
/// - **[SeedWordsGridSection]**:
///   - Dynamically adjusts the grid layout based on screen width.
///
/// - **[CopyToClipboardButton]**:
///   - Provides a button to copy generated seed words.
///
/// - **[SeedNotesSection]**:
///   - Displays additional information or warnings about seed words.
///
/// - **[SeedTypeSelectorWidget]**:
///   - Allows users to select between a 12-word or 24-word seed.
///
/// - **[AdaptiveTextButton]** (Next Button):
///   - Moves the user to the next step in the navigation pane.
///
/// ### Notes:
///
/// - Ensures UI responsiveness by calculating `crossAxisCount` based on screen
///   width.
/// - Uses `context.mounted` checks to avoid context-related errors.
/// - The design may require updates once the UI team finalizes the layout.

class GenerationSeedScreen extends StatefulWidget {
  const GenerationSeedScreen({super.key});

  @override
  State<GenerationSeedScreen> createState() => _GenerationSeedScreenState();
}

class _GenerationSeedScreenState extends State<GenerationSeedScreen> {
  bool _menuExpanded = false;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      content: LayoutBuilder(
        builder: (context, constraints) {
          List<String>? seedWords = <String>[];
          final crossAxisCount =
              (constraints.maxWidth / 150).floor().clamp(2, 6);

          return Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 47,
                    end: 47,
                    top: 47,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const GenerationSeedTitleSection(),
                      BlocBuilder<SeedTypeCubit, SeedTypeEnum>(
                        builder: (context, state) {
                          if (state == SeedTypeEnum.twelve) {
                            final generatedSeed =
                                SeedGenerator().generateSeed(12);
                            seedWords = generatedSeed?.words;
                            NodeConfigData.instance.restorationSeed =
                                generatedSeed;
                          } else if (state == SeedTypeEnum.twentyFour) {
                            final generatedSeed =
                                SeedGenerator().generateSeed(24);
                            seedWords = generatedSeed?.words;
                            NodeConfigData.instance.restorationSeed =
                                generatedSeed;
                          }

                          // TODO(pouria): this text should replace by UI/UX team
                          if (seedWords!.isEmpty) {
                            return const Center(
                              child: Text('No seed words generated.'),
                            );
                          }
                          return SeedWordsGridSection(
                            seedWords: seedWords!,
                            crossAxisCount: crossAxisCount,
                          );
                        },
                      ),
                      CopyToClipboardButton(
                        copyClipboardFunction: () async {
                          final seedWordsText = seedWords!.join(' ');
                          await Clipboard.setData(
                            ClipboardData(text: seedWordsText),
                          );
                        },
                      ),
                      const Gap(32),
                      const SeedNotesSection(),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 47,
                right: 47,
                child: SeedTypeSelectorWidget(
                  menuExpanded: _menuExpanded,
                  onToggle: () {
                    setState(() {
                      _menuExpanded = !_menuExpanded;
                    });
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 89,
                  // color:
                  //   AppTheme.of(context).extension<LightPallet>()!.light900,
                  padding: const EdgeInsets.only(right: 46),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: AdaptiveTextButton(
                      text: LocaleKeys.next,
                      onPressed: () {
                        context.read<NavigationPaneCubit>().setSelectedIndex(
                              context.read<NavigationPaneCubit>().state + 1,
                            );
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.radioButtonActiveColor,
                        ),
                        padding: WidgetStatePropertyAll(
                          const EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
