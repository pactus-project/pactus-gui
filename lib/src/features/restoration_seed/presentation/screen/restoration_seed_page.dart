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
    return BlocBuilder<NavigationPaneCubit, int>(
      builder: (context, selectedIndex) {
        return NavigationView(
          appBar: NavigationAppBar(
            title: Text(
              'Restoration Seed Page',
              style: FluentTheme.of(context).typography.body!.copyWith(
                    color: AppTheme.of(context)
                        .extension<DarkPallet>()!
                        .dark900,
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
                    '${SeedGenerator().generateSeed(12)?.sentence}',
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
                    '${SeedGenerator().generateSeed(24)?.sentence}',
                    style: FluentTheme.of(context).typography.body!.copyWith(
                          color: AppTheme.of(context)
                              .extension<DarkPallet>()!
                              .dark900,
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
                            NodeConfigData.instance.restorationSeed =
                                '${SeedGenerator().generateSeed(12)?.sentence}';
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
