import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui_widgetbook/core.dart';
import 'package:pactus_gui_widgetbook/widgets.dart';

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
