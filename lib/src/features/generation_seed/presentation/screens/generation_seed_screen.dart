import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/widgets/custom_expandable_widget.dart';
import 'package:gui/src/core/common/widgets/custom_read_only_text_box.dart';
import 'package:gui/src/core/utils/daemon_manager/node_config_data.dart';
import 'package:gui/src/core/utils/daemon_manager/seed_generator.dart';
import 'package:gui/src/features/generation_seed/presentation/cubits/seed_type_cubit.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class GenerationSeedScreen extends StatefulWidget {
  const GenerationSeedScreen({super.key});

  @override
  State<GenerationSeedScreen> createState() => _GenerationSeedScreenState();
}

class _GenerationSeedScreenState extends State<GenerationSeedScreen> {
  @override
  Widget build(BuildContext context) {
    return NavigationView(
      content: SingleChildScrollView(
        child: BlocBuilder<NavigationPaneCubit, int>(
          builder: (context, selectedIndex) {
            return Column(
              spacing: 16,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Generation Seed',
                        style: InterTextStyles.bodyBold.copyWith(
                          color: AppColors.primaryDark,
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomExpandableWidget(
                        header: 'Select Seed Type',
                        body: Column(
                          children: [
                            Button(
                              child: const Text('12 words'),
                              onPressed: () {
                                context
                                    .read<SeedTypeCubit>()
                                    .selectSeed(12);
                              },
                            ),
                            Button(
                              child: const Text('24 words'),
                              onPressed: () {
                                context
                                    .read<SeedTypeCubit>()
                                    .selectSeed(24);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(8),
                Text(
                  'Generation seed, your key to digital resilience and recovery',
                  style: InterTextStyles.smallRegular.copyWith(
                    color: AppColors.primaryGray,
                  ),
                ),
                const Gap(24),
                Container(
                  color: Colors.white,
                  padding: EdgeInsetsDirectional.all(32),
                  child: BlocBuilder<SeedTypeCubit, SeedType>(
                    builder: (context, state) {
                      List<String>? seedWords = <String>[];
                      if (state == SeedType.twelve) {
                        seedWords = SeedGenerator().generateSeed(12)?.words;
                      } else if (state == SeedType.twentyFour) {
                        seedWords = SeedGenerator().generateSeed(24)?.words;
                      }
                      if (seedWords!.isEmpty) {
                        return const Center(
                          child: Text('No seed words generated.'),);
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: seedWords.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 50,
                            height: 30,
                            child: CustomReadOnlyTextBox(
                              text: seedWords![index], index: index,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (selectedIndex > 0)
                      Button(
                        child: const Text('Previous'),
                        onPressed: () {
                          context
                              .read<NavigationPaneCubit>()
                              .setSelectedIndex(selectedIndex - 1);
                        },
                      ),
                    const SizedBox(width: 20),
                    if (selectedIndex < 6)
                      Button(
                        child: const Text('Next'),
                        onPressed: () {
                          NodeConfigData.instance.restorationSeed =
                          '${SeedGenerator()
                              .generateSeed(12)
                              ?.sentence}';
                          context
                              .read<NavigationPaneCubit>()
                              .setSelectedIndex(selectedIndex + 1);
                        },
                      ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
