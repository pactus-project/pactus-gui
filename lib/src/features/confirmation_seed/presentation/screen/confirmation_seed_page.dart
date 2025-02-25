import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/features/confirmation_seed/data/models/seed_item_data.dart';
import 'package:gui/src/features/confirmation_seed/presentation/bloc/confirmation_seed_cubit.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:pactus_gui_widgetbook/core.dart';
import 'package:pactus_gui_widgetbook/widgets.dart';

class ConfirmationSeedPage extends StatelessWidget {
  const ConfirmationSeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPaneCubit, int>(
      builder: (context, selectedIndex) {
        return NavigationView(
          content: Column(
            children: [
              Expanded(
                child:
                    BlocBuilder<ConfirmationSeedCubit, ConfirmationSeedState>(
                  builder: (context, state) {
                    if (state.words.isEmpty) {
                      return const Center(child: ProgressRing());
                    }

                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final crossAxisCount =
                              (constraints.maxWidth / 160).floor().clamp(2, 6);

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

                              if (!item.isNeedConfirmation) {
                                return ChipTextBox(
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
                              }

                              return ChipTextBox(
                                prefixText: '$wordID.',
                                chipTextMode: chipTextMode,
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
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child:
                    BlocBuilder<ConfirmationSeedCubit, ConfirmationSeedState>(
                  builder: (context, state) {
                    return Button(
                      child: Text(
                        'Check',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        final isValidated =
                            context.read<ConfirmationSeedCubit>().isAllValid();
                        final text = isValidated ? 'Valid' : 'Invalid';

                        displayInfoBar(
                          context,
                          builder: (context, close) {
                            return InfoBar(
                              title: Text(
                                text,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              severity: isValidated
                                  ? InfoBarSeverity.success
                                  : InfoBarSeverity.error,
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (selectedIndex > 0)
                    Button(
                      child: const Text('Previous'),
                      onPressed: () {
                        context
                            .read<NavigationPaneCubit>()
                            .setSelectedIndex(selectedIndex - 1);
                      },
                    ),
                  const SizedBox(width: 20),
                  if (selectedIndex < 6)
                    Button(
                      child: const Text('Next'),
                      onPressed: () {
                        context
                            .read<NavigationPaneCubit>()
                            .setSelectedIndex(selectedIndex + 1);
                      },
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
