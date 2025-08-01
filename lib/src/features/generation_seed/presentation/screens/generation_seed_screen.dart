import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pactus_gui/src/core/common/cubits/step_validation_cubit.dart';
import 'package:pactus_gui/src/core/common/sections/navigation_footer_section.dart';
import 'package:pactus_gui/src/core/common/widgets/custom_expandable_widget.dart';
import 'package:pactus_gui/src/core/common/widgets/screen_header_widget.dart';
import 'package:pactus_gui/src/core/common/widgets/standard_page_layout.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/node_config_data.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/seed_generator.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/data/models/fluent_navigation_state_model.dart';
import 'package:pactus_gui/src/features/generation_seed/core/constants/enums/seed_type_enum.dart';
import 'package:pactus_gui/src/features/generation_seed/presentation/cubits/seed_type_cubit.dart';
import 'package:pactus_gui/src/features/generation_seed/presentation/sections/seed_notes_section.dart';
import 'package:pactus_gui/src/features/generation_seed/presentation/sections/seeds_words_grid_section.dart';
import 'package:pactus_gui/src/features/generation_seed/presentation/widgets/copy_to_clip_board_button.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';

/// ## [GenerationSeedScreen] Class Documentation
///
class GenerationSeedScreen extends StatelessWidget {
  const GenerationSeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DropdownCubit<SeedTypeEnum>(SeedTypeEnum.twelve),
      child: BlocBuilder<NavigationPaneCubit, NavigationState>(
        builder: (context, selectedIndex) {
          return StandardPageLayout(
            content: LayoutBuilder(
              builder: (context, constraints) {
                List<String>? seedWords = <String>[];
                final crossAxisCount = (constraints.maxWidth / 150)
                    .floor()
                    .clamp(2, 6);

                return Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ScreenHeaderWidget(
                          title: LocaleKeys.generation_seed_title,
                          description: LocaleKeys.generation_seed_description,
                        ),
                        const Gap(35),
                        BlocBuilder<DropdownCubit<SeedTypeEnum>, SeedTypeEnum>(
                          builder: (context, state) {
                            if (state == SeedTypeEnum.twelve) {
                              final generatedSeed = SeedGenerator()
                                  .generateSeed(12);
                              seedWords = generatedSeed?.words;
                              NodeConfigData.instance.restorationSeed =
                                  generatedSeed;
                              context
                                  .read<DropdownCubit<SeedTypeEnum>>()
                                  .selectItem(SeedTypeEnum.twelve);
                            } else if (state == SeedTypeEnum.twentyFour) {
                              final generatedSeed = SeedGenerator()
                                  .generateSeed(24);
                              seedWords = generatedSeed?.words;
                              NodeConfigData.instance.restorationSeed =
                                  generatedSeed;
                              context
                                  .read<DropdownCubit<SeedTypeEnum>>()
                                  .selectItem(SeedTypeEnum.twentyFour);
                            }

                            if (seedWords!.isEmpty) {
                              return Center(
                                child: Text(
                                  context.tr(LocaleKeys.noSeedGenerated),
                                ),
                              );
                            }
                            context.read<StepValidationCubit>().setStepValid(
                              stepIndex: selectedIndex.selectedIndex,
                              isValid: true,
                            );
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SeedWordsGridSection(
                                  seedWords: seedWords!,
                                  crossAxisCount: crossAxisCount,
                                ),
                                const Gap(20),
                                CopyToClipboardButton(
                                  copyClipboardFunction: () async {
                                    final seedWordsText = seedWords!.join(' ');
                                    await Clipboard.setData(
                                      ClipboardData(text: seedWordsText),
                                    );
                                  },
                                ),
                                const Gap(20),
                                const SeedNotesSection(),
                                const Gap(80),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child:
                          BlocBuilder<
                            DropdownCubit<SeedTypeEnum>,
                            SeedTypeEnum
                          >(
                            builder: (context, state) {
                              return CustomDropdownWidget<SeedTypeEnum>(
                                items: SeedTypeEnum.values,
                                itemLabel: (item) => context.tr(item.text),
                              );
                            },
                          ),
                    ),
                  ],
                );
              },
            ),
            footer: NavigationFooterSection(
              selectedIndex: selectedIndex.selectedIndex,
              onNextPressed: () {
                context.read<NavigationPaneCubit>().setSelectedIndex(
                  selectedIndex.selectedIndex + 1,
                );
              },
              onBackPressed: () {
                context.read<NavigationPaneCubit>().setSelectedIndex(
                  selectedIndex.selectedIndex - 1,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
