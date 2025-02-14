import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/features/confirmation_seed/data/models/seed_item_data.dart';
import 'package:gui/src/features/confirmation_seed/presentation/bloc/confirmation_seed_cubit.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';

class ConfirmationSeedPage extends StatelessWidget {
  const ConfirmationSeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPaneCubit, int>(
      builder: (context, selectedIndex) {
        return NavigationView(
          content:/* Column(
            children: [*/
              Column(
                children: [
                  Expanded(
                    child: BlocBuilder<ConfirmationSeedCubit,
                        ConfirmationSeedState>(
                      builder: (context, state) {
                        if (state.words.isEmpty) {
                          return const Center(child: ProgressRing());
                        }

                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final crossAxisCount =
                                  (constraints.maxWidth / 160)
                                      .floor()
                                      .clamp(2, 6);

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

                                  if (!item.isNeedConfirmation) {
                                    return Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: FluentTheme.of(context)
                                            .micaBackgroundColor,
                                        borderRadius:
                                            BorderRadius.circular(20),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        item.word,
                                        textAlign: TextAlign.center,
                                        style: FluentTheme.of(context)
                                            .typography
                                            .bodyStrong!
                                            .copyWith(color: Colors.black),
                                      ),
                                    );
                                  }

                                  final isCorrect =
                                      state.validationResults[index];
                                  final color = (isCorrect ?? false)
                                      ? Colors.green
                                      : Colors.red;

                                  return ChipTextBox(
                                    backgroundColor: color,
                                    placeholder: '',
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
                    child: BlocBuilder<ConfirmationSeedCubit,
                        ConfirmationSeedState>(
                      builder: (context, state) {
                        return Button(
                          child: Text(
                            'Check',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            final isValidated = context
                                .read<ConfirmationSeedCubit>()
                                .isAllValid();
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
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     if (selectedIndex > 0)
              //       Button(
              //         child: const Text('Previous'),
              //         onPressed: () {
              //           context
              //               .read<NavigationPaneCubit>()
              //               .setSelectedIndex(selectedIndex - 1);
              //         },
              //       ),
              //     const SizedBox(width: 20),
              //     if (selectedIndex < 6)
              //       Button(
              //         child: const Text('Next'),
              //         onPressed: () {
              //           context
              //               .read<NavigationPaneCubit>()
              //               .setSelectedIndex(selectedIndex + 1);
              //         },
              //       ),
              //   ],
              // ),
      /*      ],
          ),*/
        );
      },
    );
  }
}

class ChipTextBox extends StatelessWidget {
  const ChipTextBox({
    super.key,
    required this.backgroundColor,
    required this.onChanged,
    this.placeholder,
  });
  final Color backgroundColor;
  final String? placeholder;
  final ValueChanged<String> onChanged;
  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: TextBox(
        padding: EdgeInsets.zero,
        placeholder: placeholder,
        decoration: WidgetStateProperty.all(
          BoxDecoration(
            borderRadius: BorderRadius.circular(64),
            color: backgroundColor,
          ),
        ),
        textAlign: TextAlign.center,
        onChanged: onChanged,
      ),
    );
  }
}
