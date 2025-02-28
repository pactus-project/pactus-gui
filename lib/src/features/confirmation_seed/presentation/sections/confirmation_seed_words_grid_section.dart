import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/features/confirmation_seed/data/models/seed_item_data.dart';
import 'package:gui/src/features/confirmation_seed/presentation/bloc/confirmation_seed_cubit.dart';
import 'package:pactus_gui_widgetbook/core.dart';
import 'package:pactus_gui_widgetbook/widgets.dart';

class ConfirmationSeedWordsGridSection extends StatelessWidget {
  const ConfirmationSeedWordsGridSection({
    super.key,
    required this.crossAxisCount,
    required this.confirmationSeedState,
  });
  final int crossAxisCount;
  final ConfirmationSeedState confirmationSeedState;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 48,
      ),
      itemCount: confirmationSeedState.words.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final item = confirmationSeedState.words[index];
        final wordID = index + 1;
        final chipTextMode = confirmationSeedState
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
  }
}
