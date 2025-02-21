import 'package:fluent_ui/fluent_ui.dart';
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
import 'package:pactus_gui_widgetbook/app_styles.dart';

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
                            seedWords = SeedGenerator().generateSeed(12)?.words;
                          } else if (state == SeedTypeEnum.twentyFour) {
                            seedWords = SeedGenerator().generateSeed(24)?.words;
                          }

                          /// to-do : this text is not in design & added by me
                          /// should replace with correct text after design
                          /// team fix it by Pouria
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
                      const CopyToClipboardButton(seedWords: []),
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
                  color:
                      AppTheme.of(context).extension<LightPallet>()!.light900,
                  padding: const EdgeInsets.only(right: 46),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: AdaptiveTextButton(
                      text: LocaleKeys.next,
                      onPressed: () {
                        NodeConfigData.instance.restorationSeed =
                            '${SeedGenerator().generateSeed(12)?.sentence}';
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
