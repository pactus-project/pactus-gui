import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/sections/navigation_footer_section.dart';
import 'package:gui/src/core/common/widgets/standard_page_layout.dart';
import 'package:gui/src/core/utils/daemon_manager/node_config_data.dart';
import 'package:gui/src/features/confirmation_seed/data/models/seed_item_data.dart';
import 'package:gui/src/features/confirmation_seed/presentation/bloc/confirmation_seed_cubit.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:pactus_gui_widgetbook/core.dart';
import 'package:pactus_gui_widgetbook/widgets.dart';

class ConfirmationSeedPage extends StatelessWidget {
  const ConfirmationSeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ConfirmationSeedCubit(
        NodeConfigData.instance.restorationSeed!.words,
      ),
      child: BlocBuilder<NavigationPaneCubit, int>(
        builder: (context, selectedIndex) {
          return StandardPageLayout(
            content: BlocBuilder<ConfirmationSeedCubit, ConfirmationSeedState>(
              builder: (context, state) {
                if (state.words.isEmpty) {
                  return const Center(child: ProgressRing());
                }
                return Padding(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minHeight: 200,
                          maxHeight: 500,
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final crossAxisCount = (constraints.maxWidth / 160)
                                .floor()
                                .clamp(2, 6);

                            return GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                mainAxisExtent: 48,
                              ),
                              itemCount: state.words.length,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                final item = state.words[index];
                                final wordID = index + 1;
                                final chipTextMode = state
                                    .validationResults[index]
                                    .detectChipTextModeOnBoolean();

                                return item.isNeedConfirmation
                                    ? ChipTextBox(
                                        prefixText: '$wordID.',
                                        chipTextMode: chipTextMode,
                                        onChanged: (value) {
                                          context
                                              .read<ConfirmationSeedCubit>()
                                              .updateValidation(index, value);
                                        },
                                      )
                                    : ChipTextBox(
                                        prefixText: '$wordID.',
                                        isReadOnly: true,
                                        chipTextMode: ChipTextMode.normal,
                                        placeholder: item.word,
                                        onChanged: (value) {
                                          context
                                              .read<ConfirmationSeedCubit>()
                                              .updateValidation(index, value);
                                        },
                                      );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            footer: NavigationFooterSection(
              selectedIndex: selectedIndex,
              onBackPressed: () {
                context
                    .read<NavigationPaneCubit>()
                    .setSelectedIndex(selectedIndex - 1);
              },
              onNextPressed: () {
                context
                    .read<NavigationPaneCubit>()
                    .setSelectedIndex(selectedIndex + 1);
              },
            ),
          );
        },
      ),
    );
  }
}
