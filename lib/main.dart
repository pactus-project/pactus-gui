import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pactus/provider/theme_provider.dart';
import 'package:pactus/support/app_router.dart';
import 'package:pactus/support/extensions.dart';
import 'package:pactus/support/platform_detect.dart';
import 'package:system_theme/system_theme.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  // if (!kIsWeb &&
  //     [
  //       TargetPlatform.windows,
  //       TargetPlatform.android,
  //     ].contains(defaultTargetPlatform)) {
  //   SystemTheme.accentColor.load();
  // }

  if (isDesktop) {
    await Window.initialize();
    if (defaultTargetPlatform == TargetPlatform.windows) {
      await Window.hideWindowControls();
    }
    await WindowManager.instance.ensureInitialized();
    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setTitleBarStyle(TitleBarStyle.hidden, windowButtonVisibility: PlatformDetect.isMacOS); //Hiding the titlebar
      await windowManager.setMinimumSize(const Size(802, 523));
      await windowManager.show();
      await windowManager.setPreventClose(true);
      await windowManager.setSkipTaskbar(false);
    });
  }
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

bool get isDesktop {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

bool isDarkMode() {
  final darkMode = WidgetsBinding.instance.platformDispatcher.platformBrightness;
  if (darkMode == Brightness.dark) {
    return true;
  } else {
    return false;
  }
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    context.afterBuild(() {
      var darkMode = isDarkMode();
      if (darkMode) {
        ref.read(appThemeProvider.notifier).mode = ThemeMode.dark;
      } else {
        ref.read(appThemeProvider.notifier).mode = ThemeMode.light;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(goRouterProvider);
    final appTheme = ref.watch(appThemeProvider);
    return FluentApp.router(
      title: "appTitle",
      themeMode: appTheme.mode,
      debugShowCheckedModeBanner: false,
      color: appTheme.color,
      darkTheme: FluentThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily,
        brightness: Brightness.dark,
        accentColor: appTheme.color,
        micaBackgroundColor: appTheme.scaffoldBackgroundColor,
        inactiveBackgroundColor: appTheme.scaffoldBackgroundColor,
        visualDensity: VisualDensity.standard,
        focusTheme: FocusThemeData(
          glowFactor: is10footScreen(context) ? 2.0 : 0.0,
        ),
      ),
      theme: FluentThemeData(
        fontFamily: GoogleFonts.robotoFlex().fontFamily,
        accentColor: appTheme.color,
        inactiveBackgroundColor: appTheme.scaffoldBackgroundColor,
        visualDensity: VisualDensity.standard,
        focusTheme: FocusThemeData(
          glowFactor: is10footScreen(context) ? 2.0 : 0.0,
        ),
      ),
      locale: appTheme.locale,
      builder: (context, child) {
        return Directionality(
          textDirection: appTheme.textDirection,
          child: NavigationPaneTheme(
            data: NavigationPaneThemeData(
              backgroundColor: appTheme.windowEffect != WindowEffect.disabled ? Colors.transparent : null,
            ),
            child: ScreenUtilInit(minTextAdapt: true, splitScreenMode: true, designSize: const Size(802, 523), child: child!),
          ),
        );
      },
      // routerConfig: router,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
    );
  }
}

