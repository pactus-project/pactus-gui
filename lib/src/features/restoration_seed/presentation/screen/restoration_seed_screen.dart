import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/cubits/step_validation_cubit.dart';
import 'package:gui/src/core/common/sections/navigation_footer_section.dart';
import 'package:gui/src/core/common/widgets/custom_expandable_widget.dart';
import 'package:gui/src/core/common/widgets/screen_header_widget.dart';
import 'package:gui/src/core/common/widgets/standard_page_layout.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/generation_seed/core/constants/enums/seed_type_enum.dart';
import 'package:gui/src/features/generation_seed/presentation/cubits/seed_type_cubit.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:gui/src/features/restoration_seed/presentation/cubits/restoration_seed_cubit.dart';
import 'package:gui/src/features/restoration_seed/presentation/sections/restoration_seed_words_grid_section.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DropdownCubit<SeedTypeEnum>(SeedTypeEnum.twelve),
        ),
        BlocProvider(create: (context) => SeedTextCubit(SeedTypeEnum.twelve)),
      ],
      child: BlocBuilder<NavigationPaneCubit, int>(
        builder: (context, selectedIndex) {
          return StandardPageLayout(
            content: LayoutBuilder(
              builder: (context, constraints) {
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
                            const ScreenHeaderWidget(
                              title: LocaleKeys.restoration_seed_title,
                              description:
                                  LocaleKeys.restoration_seed_description,
                            ),
                            BlocBuilder<DropdownCubit<SeedTypeEnum>,
                                SeedTypeEnum>(
                              builder: (context, state) {
                                return BlocBuilder<SeedTextCubit, List<String>>(
                                  builder: (context, words) {
                                    context
                                        .read<StepValidationCubit>()
                                        .setStepValid(
                                          stepIndex: context
                                              .read<NavigationPaneCubit>()
                                              .state,
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
                      ),
                    ),
                    Positioned(
                      top: 47,
                      right: 47,
                      child: BlocBuilder<DropdownCubit<SeedTypeEnum>,
                          SeedTypeEnum>(
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
                  selectedIndex: selectedIndex,
                  onNextPressed: context
                          .read<SeedTextCubit>()
                          .areAllWordsEntered()
                      ? () {
                          context.read<NavigationPaneCubit>().setSelectedIndex(
                                selectedIndex + 1,
                              );
                        }
                      : null,
                  onBackPressed: () {
                    context.read<NavigationPaneCubit>().setSelectedIndex(
                          selectedIndex - 1,
                        );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
