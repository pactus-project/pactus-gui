import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/cubits/step_validation_cubit.dart';
import 'package:gui/src/core/common/sections/navigation_footer_section.dart';
import 'package:gui/src/core/common/widgets/screen_header_widget.dart';
import 'package:gui/src/core/common/widgets/standard_page_layout.dart';
import 'package:gui/src/core/utils/daemon_manager/node_config_data.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/data/models/fluent_navigation_state_model.dart';
import 'package:gui/src/features/confirmation_seed/data/models/seed_item_data.dart';
import 'package:gui/src/features/confirmation_seed/presentation/bloc/confirmation_seed_cubit.dart';
import 'package:gui/src/features/confirmation_seed/presentation/sections/confirmation_seed_words_grid_section.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';

class ConfirmationSeedScreen extends StatelessWidget {
  const ConfirmationSeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ConfirmationSeedCubit(
        NodeConfigData.instance.restorationSeed!.words,
      ),
      child: BlocBuilder<NavigationPaneCubit, NavigationState>(
        builder: (context, selectedIndex) {
          return StandardPageLayout(
            content: BlocBuilder<ConfirmationSeedCubit, ConfirmationSeedState>(
              builder: (
                BuildContext context,
                ConfirmationSeedState confirmationSeedState,
              ) {
                if (confirmationSeedState.words.isEmpty) {
                  return const Center(child: ProgressRing());
                }
                context.read<StepValidationCubit>().setStepValid(
                      stepIndex: selectedIndex.selectedIndex,
                      isValid: confirmationSeedState.areAllWordsConfirmed,
                    );

                return Padding(
                  padding: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ScreenHeaderWidget(
                        title: LocaleKeys.confirmation_seed_title,
                        description: LocaleKeys.confirmation_seed_description,
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minHeight: 200,
                          maxHeight: 500,
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final crossAxisCount = (constraints.maxWidth / 150)
                                .floor()
                                .clamp(2, 6);
                            return ConfirmationSeedWordsGridSection(
                              crossAxisCount: crossAxisCount,
                              confirmationSeedState: confirmationSeedState,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            footer: BlocBuilder<ConfirmationSeedCubit, ConfirmationSeedState>(
              builder: (context, confirmationSeedState) {
                return NavigationFooterSection(
                  selectedIndex: selectedIndex.selectedIndex,
                  onBackPressed: () {
                    context
                        .read<NavigationPaneCubit>()
                        .setSelectedIndex(selectedIndex.selectedIndex - 1);
                  },
                  onNextPressed: confirmationSeedState.areAllWordsConfirmed
                      ? () {
                          context.read<NavigationPaneCubit>().setSelectedIndex(
                                selectedIndex.selectedIndex + 1,
                              );
                        }
                      : null,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
