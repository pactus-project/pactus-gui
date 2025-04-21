import 'package:bip39/bip39.dart' as bip39;
import 'package:bip39_mnemonic/bip39_mnemonic.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/common/cubits/step_validation_cubit.dart';
import 'package:gui/src/core/common/sections/navigation_footer_section.dart';
import 'package:gui/src/core/common/widgets/custom_expandable_widget.dart';
import 'package:gui/src/core/common/widgets/screen_header_widget.dart';
import 'package:gui/src/core/common/widgets/standard_page_layout.dart';
import 'package:gui/src/core/router/route_name.dart';
import 'package:gui/src/core/utils/daemon_manager/node_config_data.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/data/models/fluent_navigation_state_model.dart';
import 'package:gui/src/features/generation_seed/core/constants/enums/seed_type_enum.dart';
import 'package:gui/src/features/generation_seed/presentation/cubits/seed_type_cubit.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:gui/src/features/restoration_seed/presentation/cubits/restoration_seed_cubit.dart';
import 'package:gui/src/features/restoration_seed/presentation/sections/restoration_seed_words_grid_section.dart';
import 'package:gui/src/features/validator_config/core/utils/methods/show_fluent_alert_method.dart';

/// ## [RestorationSeedScreen] Class Documentation
///
/// The `RestorationSeedScreen` class represents a screen for restoring
/// a seed, with options for selecting the type of seed and displaying
/// a grid of restoration seed words.
///
/// This screen uses multiple BLoC providers to manage the state of seed
/// type selection and seed words list.
/// It also incorporates various widgets, such as dropdowns and buttons,
/// for user interaction.
///
/// ### Properties:
///
/// - **[DropdownCubit<SeedTypeEnum>]**:
///   - Manages the selected seed type, initialized with `SeedTypeEnum.twelve`.
///
/// - **[SeedTextCubit]**:
///   - Manages the list of seed words, initialized with `SeedTypeEnum.twelve`.
///
/// ### Methods:
///
/// - **[build(BuildContext context)]**:
///   - Builds the UI of the screen, which includes a layout with
///   a scrollable column containing a title,
///     description, and a grid of seed words, along with
///     a dropdown to select the seed type.
///

class RestorationSeedScreen extends StatelessWidget {
  const RestorationSeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPaneCubit, NavigationState>(
      builder: (context, selectedIndex) {
        return StandardPageLayout(
          content: LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount =
                  (constraints.maxWidth / 150).floor().clamp(2, 6);
              return Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ScreenHeaderWidget(
                        title: LocaleKeys.restoration_seed_title,
                        description: LocaleKeys.restoration_seed_description,
                      ),
                      BlocBuilder<DropdownCubit<SeedTypeEnum>, SeedTypeEnum>(
                        builder: (context, state) {
                          return BlocBuilder<SeedTextCubit, List<String>>(
                            builder: (context, words) {
                              context.read<StepValidationCubit>().setStepValid(
                                    stepIndex: context
                                        .read<NavigationPaneCubit>()
                                        .state
                                        .selectedIndex,
                                    isValid: context
                                        .read<SeedTextCubit>()
                                        .areAllWordsEntered(),
                                  );
                              return RestorationSeedWordsGridSection(
                                crossAxisCount: crossAxisCount,
                                state: state,
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child:
                        BlocBuilder<DropdownCubit<SeedTypeEnum>, SeedTypeEnum>(
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
          footer: BlocBuilder<SeedTextCubit, List<String>>(
            builder: (context, words) {
              return NavigationFooterSection(
                selectedIndex: selectedIndex.selectedIndex,
                onNextPressed:
                    context.read<SeedTextCubit>().areAllWordsEntered()
                        ? () {
                            final seeds = context.read<SeedTextCubit>().state;

                            final seedQty = context
                                .read<DropdownCubit<SeedTypeEnum>>()
                                .state
                                .qty;

                            final isValidSeedQuantity = seeds
                                    .where((item) => item.trim().isNotEmpty)
                                    .length ==
                                seedQty;

                            final isValidateMnemonic =
                                bip39.validateMnemonic(seeds.join(' '));

                            if (isValidSeedQuantity) {
                              if (isValidateMnemonic) {
                                NodeConfigData.instance.restorationSeed =
                                    Mnemonic.generate(
                                  Language.english,
                                  passphrase: seeds.join(' '),
                                );

                                context
                                    .read<NavigationPaneCubit>()
                                    .setSelectedIndex(
                                      context
                                              .read<NavigationPaneCubit>()
                                              .state
                                              .selectedIndex +
                                          1,
                                    );
                              } else {
                                showFluentAlert(
                                  context,
                                  'Invalid seeds.',
                                );
                              }
                            } else {
                              showFluentAlert(
                                context,
                                'All seeds must be filled in.',
                              );
                            }
                          }
                        : null,
                onBackPressed: () {
                  context.goNamed(AppRoute.initializeMode.name);
                },
              );
            },
          ),
        );
      },
    );
  }
}
