import 'package:fluent_ui/fluent_ui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/router/route_name.dart';
import 'package:gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/core/utils/storage_utils.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:logger/logger.dart';
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
    _checkNavigationFlow();
  }

  /// Determines the navigation flow based on password status
  Future<void> _checkNavigationFlow() async {
    // Wait for splash screen to display briefly
    await Future<void>.delayed(_splashDuration);

    if (!mounted) {
      return;
    }
    final logger = Logger();

    final isInstallationFinished = await StorageUtils.isInstallationFinished();
    logger.i('isInstallationFinished: $isInstallationFinished');
    if (isInstallationFinished) {
      // If installation is finished but no password, go to dashboard
      // Check if password is set
      logger.i('Checking if password is set');
      final hasPassword = await StorageUtils.hasPassword();
      logger.i('hasPassword: $hasPassword');
      if (hasPassword) {
        // If password is set, go to password unlock screen
        logger.i('Password is set, going to password unlock screen');
        _navigateTo(AppRoute.basicPassword.name);
      } else {
        // Check if installation is finished
        logger.i('Password is not set, going to dashboard');
        _navigateTo(AppRoute.dashboard.name);
      }
    } else {
      // If installation is not finished, go to welcome screen
      logger.i('Installation is not finished, going to welcome screen');
      _navigateTo(AppRoute.welcome.name);
    }
  }

  /// Helper method to navigate
  void _navigateTo(String routeName) {
    if (mounted) {
      context.goNamed(routeName);
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
                            .extension<DarkPallet>()!
                            .dark900,
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
