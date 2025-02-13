import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/router/route_name.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class InitializeModePage extends StatelessWidget {
  const InitializeModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        title: Text(
          'InitializeModePage',
          style: FluentTheme.of(context).typography.body!.copyWith(
                color: AppTheme.of(context).extension<DarkPallet>()!.dark900,
              ),
        ),
      ),
      content: Center(
        child: Button(
          onPressed: () {
            context.goNamed(AppRoute.restorationSeed.name);
          },
          child: Text('Navigate to ${AppRoute.restorationSeed.name}'),
        ),
      ),
    );
  }
}
