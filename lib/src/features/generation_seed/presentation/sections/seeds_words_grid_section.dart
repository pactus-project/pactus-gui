import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui_widgetbook/core.dart';
import 'package:pactus_gui_widgetbook/widgets.dart';

/// ## [SeedWordsGridSection] Class Documentation
///
/// The `SeedWordsGridSection` class displays a grid of seed words, with each
/// word represented as a `ChipTextBox`. The grid layout adjusts based on the
/// available width, and the seed words are displayed in a non-scrollable grid.
///
/// ### Properties:
///
/// - **[seedWords]** (`List<String>`):
///   - A list of seed words to be displayed in the grid.
///
/// - **[crossAxisCount]** (`int`):
///   - The number of columns in the grid, determining how many seed words
///     fit per row.
///
/// ### Methods:
///
/// - **[build]**:
///   - Builds the grid layout, creating a `ChipTextBox` for each seed word
///     in the list. Each word is prefixed with its position in the list.
///
/// ### Notes:
///
/// - The widget uses a `GridView.builder` to efficiently build the grid.
/// - Each `ChipTextBox` is read-only and displays a seed word along with its
///   index number.

class SeedWordsGridSection extends StatelessWidget {
  const SeedWordsGridSection({
    required this.seedWords,
    required this.crossAxisCount,
    super.key,
  });
  final List<String> seedWords;
  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 3,
      ),
      itemCount: seedWords.length,
      itemBuilder: (context, index) {
        final item = seedWords[index];
        final wordID = index + 1;
        return ChipTextBox(
          isReadOnly: true,
          prefixText: '$wordID.',
          placeholder: item,
          chipTextMode: ChipTextMode.normal,
          onChanged: (String value) {},
        );
      },
    );
  }
}
