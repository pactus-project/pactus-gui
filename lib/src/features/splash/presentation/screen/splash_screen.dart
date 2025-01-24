import 'package:fluent_ui/fluent_ui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/router/route_name.dart';
import 'package:gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const _splashDuration = Duration(seconds: 2);
  static const _logoSize = 180.0;
  static const _logoNameWidth = 168.0;
  static const _logoNameHeight = 34.0;
  static const _spacingBetweenElements = 16.0;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await Future<void>.delayed(_splashDuration);
    if (mounted) {
      context.goNamed(AppRoute.welcome.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.icons.logo.image(
                  width: _logoSize,
                  height: _logoSize,
                  fit: BoxFit.contain,
                ),
                Gap(_spacingBetweenElements),
                Assets.images.logoName.image(
                  width: _logoNameWidth,
                  height: _logoNameHeight,
                  fit: BoxFit.contain,
                ),
                Gap(_spacingBetweenElements),
                Text(
                  context.tr(LocaleKeys.applications),
                  style: FluentTheme.of(context).typography.title?.copyWith(
                        color: AppTheme.of(context)
                            .extension<OnSurfacePallet>()!
                            .onSurface4,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
