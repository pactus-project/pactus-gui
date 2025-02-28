import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/features/generation_seed/core/constants/enums/seed_type_enum.dart';
import 'package:gui/src/features/restoration_seed/presentation/cubits/restoration_seed_cubit.dart';
import 'package:pactus_gui_widgetbook/core.dart';
import 'package:pactus_gui_widgetbook/widgets.dart';

/// ## [RestorationSeedWordsGridSection] Class Documentation
///
/// The `RestorationSeedWordsGridSection` class represents a section of
/// the UI displaying a grid of seed words.
/// Each item in the grid is a `ChipTextBox` that allows users to input
/// or modify seed words.
/// The grid adapts to the provided `crossAxisCount` and the number of
/// seed words determined by the `SeedTypeEnum`.
///
/// ### Properties:
///
/// - **[crossAxisCount]** (int):
///   - The number of columns in the grid. It is dynamically calculated
///   based on the screen width.
///
/// - **[state]** (SeedTypeEnum):
///   - Defines the seed type, which determines the number of seed words
///   (`qty`) to display.
///
/// ### Methods:
///
/// - **[build(BuildContext context)]**:
///   - Builds the UI for the grid, using `GridView.builder` to create a
///   grid with dynamic columns and seed words.
///   - For each grid item, a `ChipTextBox` is used to display an editable
///   text box for entering seed words.
///   - Each `ChipTextBox` updates the seed word via the `SeedTextCubit`
///   when modified by the user.

class RestorationSeedWordsGridSection extends StatelessWidget {
  const RestorationSeedWordsGridSection({
    super.key,
    required this.crossAxisCount,
    required this.state,
  });
  final int crossAxisCount;
  final SeedTypeEnum state;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 141/30,
      ),
      itemCount: state.qty,
      itemBuilder: (context, index) {
        return ChipTextBox(
          prefixText: '${index + 1}.',
          chipTextMode: ChipTextMode.normal,
          onChanged: (value) {
            context.read<SeedTextCubit>().updateWord(index, value);
          },
        );
      },
    );
  }
}
