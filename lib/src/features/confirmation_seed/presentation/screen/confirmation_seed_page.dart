import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/router/route_name.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class ConfirmationSeedPage extends StatelessWidget {
  const ConfirmationSeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        title: Text(
          'ConfirmationSeedPage',
          style: FluentTheme.of(context).typography.body!.copyWith(
                color: AppTheme.of(context)
                    .extension<DarkPallet>()!
                    .dark900,
              ),
        ),
      ),
      content: Center(
        child: Button(
          onPressed: () {
            context.goNamed(AppRoute.masterPassword.name);
          },
          child: Text('Navigate to ${AppRoute.masterPassword.name}'),
        ),
      ),
    );
  }
}
