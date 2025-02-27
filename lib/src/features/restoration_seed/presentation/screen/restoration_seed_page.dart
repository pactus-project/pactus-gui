import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/utils/daemon_manager/node_config_data.dart';
import 'package:gui/src/core/utils/daemon_manager/seed_generator.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class RestorationSeedPage extends StatelessWidget {
  const RestorationSeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final seed12 = SeedGenerator().generateSeed(12);
    final seed24 = SeedGenerator().generateSeed(24);
    return BlocBuilder<NavigationPaneCubit, int>(
      builder: (context, selectedIndex) {
        return NavigationView(
          appBar: NavigationAppBar(
            title: Text(
              'Restoration Seed Page',
              style: FluentTheme.of(context).typography.body!.copyWith(
                    color:
                        AppTheme.of(context).extension<DarkPallet>()!.dark900,
                  ),
            ),
          ),
          content: Center(
            child: SizedBox(
              width: 320,
              child: Column(
                spacing: 16,
                children: [
                  Text(
                    '12 seeds:',
                    style: FluentTheme.of(context).typography.body!.copyWith(
                          color: AppTheme.of(context)
                              .extension<DarkPallet>()!
                              .dark900,
                        ),
                  ),
                  Text(
                    '${seed12?.sentence}',
                    style: FluentTheme.of(context).typography.body!.copyWith(
                          color: AppTheme.of(context)
                              .extension<DarkPallet>()!
                              .dark900,
                        ),
                  ),
                  Text(
                    '24 seeds:',
                    style: FluentTheme.of(context).typography.body!.copyWith(
                          color: AppTheme.of(context)
                              .extension<DarkPallet>()!
                              .dark900,
                        ),
                  ),
                  Text(
                    '${seed24?.sentence}',
                    style: FluentTheme.of(context).typography.body!.copyWith(
                          color: AppTheme.of(context)
                              .extension<DarkPallet>()!
                              .dark900,
                        ),
                  ),

                  // Two separate Next buttons for 12 and 24 seeds
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Button for 12 seeds
                      if (selectedIndex < 6)
                        Button(
                          child: const Text('Next 12 Seeds'),
                          onPressed: () {
                            // Store the 12-seed sentence for navigation
                            NodeConfigData.instance.restorationSeed = seed12;
                            context
                                .read<NavigationPaneCubit>()
                                .setSelectedIndex(selectedIndex + 1);
                          },
                        ),
                      const SizedBox(width: 20),

                      // Button for 24 seeds
                      if (selectedIndex < 6)
                        Button(
                          child: const Text('Next 24 Seeds'),
                          onPressed: () {
                            // Store the 24-seed sentence for navigation
                            NodeConfigData.instance.restorationSeed = seed24;
                            context
                                .read<NavigationPaneCubit>()
                                .setSelectedIndex(selectedIndex + 1);
                          },
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
