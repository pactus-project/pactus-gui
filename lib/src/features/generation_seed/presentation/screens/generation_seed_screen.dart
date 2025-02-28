import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/widgets/adaptive_filled_button.dart';
import 'package:gui/src/core/common/widgets/custom_expandable_widget.dart';
import 'package:gui/src/core/common/widgets/seed_screen_title_section.dart';
import 'package:gui/src/core/utils/daemon_manager/node_config_data.dart';
import 'package:gui/src/core/utils/daemon_manager/seed_generator.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/generation_seed/core/constants/enums/seed_type_enum.dart';
import 'package:gui/src/features/generation_seed/presentation/cubits/seed_type_cubit.dart';
import 'package:gui/src/features/generation_seed/presentation/sections/seed_notes_section.dart';
import 'package:gui/src/features/generation_seed/presentation/sections/seeds_words_grid_section.dart';
import 'package:gui/src/features/generation_seed/presentation/widgets/copy_to_clip_board_button.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';

/// ## [GenerationSeedScreen] Class Documentation
///
class GenerationSeedScreen extends StatelessWidget {
  const GenerationSeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DropdownCubit<SeedTypeEnum>(SeedTypeEnum.twelve),
      child: NavigationView(
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
                        const SeedScreenTitleSection(
                          title: LocaleKeys.generation_seed_title,
                          description: LocaleKeys.generation_seed_description,
                        ),
                        BlocBuilder<DropdownCubit<SeedTypeEnum>, SeedTypeEnum>(
                          builder: (context, state) {
                            if (state == SeedTypeEnum.twelve) {
                              final generatedSeed =
                                  SeedGenerator().generateSeed(12);
                              seedWords = generatedSeed?.words;
                              NodeConfigData.instance.restorationSeed =
                                  generatedSeed;
                              context
                                  .read<DropdownCubit<SeedTypeEnum>>()
                                  .selectItem(SeedTypeEnum.twelve);
                            } else if (state == SeedTypeEnum.twentyFour) {
                              final generatedSeed =
                                  SeedGenerator().generateSeed(24);
                              seedWords = generatedSeed?.words;
                              NodeConfigData.instance.restorationSeed =
                                  generatedSeed;
                              context
                                  .read<DropdownCubit<SeedTypeEnum>>()
                                  .selectItem(SeedTypeEnum.twentyFour);
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
                  child: BlocBuilder<DropdownCubit<SeedTypeEnum>, SeedTypeEnum>(
                    builder: (context, state) {
                      return CustomDropdownWidget<SeedTypeEnum>(
                        items: SeedTypeEnum.values,
                        itemLabel: (item) => context.tr(item.text),
                      );
                    },
                  ),

                  /* SeedTypeSelectorWidget(
                    menuExpanded: _menuExpanded,
                    onToggle: () {
                      setState(() {
                        _menuExpanded = !_menuExpanded;
                      });
                    },
                  ),*/
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 89,
                    // color:
                    // AppTheme.of(context).extension<LightPallet>()!.light900,
                    padding: const EdgeInsets.only(right: 46),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: AdaptiveFilledButton(
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
      ),
    );
  }
}
