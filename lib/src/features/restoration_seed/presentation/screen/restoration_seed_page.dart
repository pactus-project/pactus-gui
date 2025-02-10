import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/router/route_name.dart';
import 'package:gui/src/core/utils/daemon_manager/node_config_data.dart';
import 'package:gui/src/core/utils/daemon_manager/seed_generator.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class RestorationSeedPage extends StatelessWidget {
  const RestorationSeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final th12words = SeedGenerator().generateSeed(12);
    final th24words = SeedGenerator().generateSeed(24);
    return NavigationView(
      appBar: NavigationAppBar(
        title: Text(
          'Restoration Seed Page',
          style: FluentTheme.of(context).typography.body!.copyWith(
                color: AppTheme.of(context)
                    .extension<OnSurfacePallet>()!
                    .onSurface4,
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
                          .extension<OnSurfacePallet>()!
                          .onSurface4,
                    ),
              ),
              Text(
                '${th12words?.sentence}',
                style: FluentTheme.of(context).typography.body!.copyWith(
                      color: AppTheme.of(context)
                          .extension<OnSurfacePallet>()!
                          .onSurface4,
                    ),
              ),
              Text(
                '24 seeds:',
                style: FluentTheme.of(context).typography.body!.copyWith(
                      color: AppTheme.of(context)
                          .extension<OnSurfacePallet>()!
                          .onSurface4,
                    ),
              ),
              Text(
                '${th24words?.sentence}',
                style: FluentTheme.of(context).typography.body!.copyWith(
                      color: AppTheme.of(context)
                          .extension<OnSurfacePallet>()!
                          .onSurface4,
                    ),
              ),
              Button(
                onPressed: () {
                  NodeConfigData.instance.restorationSeed =
                      '${th12words?.sentence}';
                  context.goNamed(
                    AppRoute.confirmationSeed.name,
                    extra: th24words?.words,
                  );
                },
                child: Text('Navigate to ${AppRoute.confirmationSeed.name}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
