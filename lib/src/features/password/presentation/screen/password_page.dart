import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/common/widgets/theme_switcher.dart';
import 'package:gui/src/core/router/route_name.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/main/language/presentation/widget/language_widget.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key, required this.fromRegistrationRoute});
  final bool fromRegistrationRoute;
  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        title: Text(
          'PasswordPage',
          style: FluentTheme.of(context).typography.body!.copyWith(
                color: AppTheme.of(context)
                    .extension<OnSurfacePallet>()!
                    .onSurface4,
              ),
        ),
      ),
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.tr(LocaleKeys.title),
              style: FluentTheme.of(context).typography.title?.copyWith(
                    color: AppTheme.of(context)
                        .extension<OnSurfacePallet>()!
                        .onSurface4,
                  ),
            ),
            LanguageSelector(),
            ThemeSwitcher(),
            fromRegistrationRoute
                ? Button(
                    onPressed: () {
                      context.goNamed(AppRoute.dashboard.name);
                    },
                    child: Text(
                      'Navigate to ${AppRoute.dashboard.name}',
                      style: FluentTheme.of(context).typography.title?.copyWith(
                            color: AppTheme.of(context)
                                .extension<OnSurfacePallet>()!
                                .onSurface4,
                          ),
                    ),
                  )
                : Button(
                    onPressed: () {
                      context.goNamed(AppRoute.basicDashboard.name);
                    },
                    child: Text(
                      'Navigate to ${AppRoute.basicDashboard.name}',
                    ),
                  ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
