import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/features/generation_seed/core/constants/enums/seed_type_enum.dart';
import 'package:gui/src/features/restoration_seed/presentation/cubits/restoration_seed_cubit.dart';
import 'package:pactus_gui_widgetbook/core.dart';
import 'package:pactus_gui_widgetbook/widgets.dart';

class RestorationSeedWordsGridSection extends StatelessWidget {
  const RestorationSeedWordsGridSection({super.key,
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
        childAspectRatio: 3,
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
