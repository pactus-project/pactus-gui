import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/features/confirmation_seed/data/models/seed_item_data.dart';
import 'package:pactus_gui/src/features/confirmation_seed/presentation/bloc/confirmation_seed_cubit.dart';
import 'package:pactus_gui_widgetbook/app_core.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart'
    show AppTheme, LightPallet;
import 'package:pactus_gui_widgetbook/app_widgets.dart';

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
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: ShapeDecoration(
        color: AppTheme.of(context).extension<LightPallet>()!.light900,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final crossAxisSpacing = 12.0;
          final childAspectRatio =
              (maxWidth - ((crossAxisCount - 1) * crossAxisSpacing)) /
              crossAxisCount /
              30;

          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: crossAxisSpacing,
              mainAxisSpacing: 12,
              childAspectRatio: childAspectRatio,
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
                        context.read<ConfirmationSeedCubit>().updateValidation(
                          index,
                          value,
                        );
                      },
                    )
                  : ChipTextBox(
                      prefixText: '$wordID.',
                      isReadOnly: true,
                      chipTextMode: ChipTextMode.normal,
                      placeholder: item.word,
                      onChanged: (value) {
                        context.read<ConfirmationSeedCubit>().updateValidation(
                          index,
                          value,
                        );
                      },
                    );
            },
          );
        },
      ),
    );
  }
}
