import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pactus/provider/theme_provider.dart';
import 'package:pactus/support/app_router.dart';
import 'package:pactus/support/extensions.dart';
import 'package:pactus/support/platform_detect.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

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
// var sp=await SharedPreferences.getInstance();
//     sp.clear();
  if (isDesktop) {
    await Window.initialize();
    if (defaultTargetPlatform == TargetPlatform.windows) {
      await Window.hideWindowControls();
    }
    await WindowManager.instance.ensureInitialized();
    await windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setTitleBarStyle(TitleBarStyle.hidden, windowButtonVisibility: PlatformDetect.isMacOS || PlatformDetect.isLinux) ; //Hiding the titlebar
      await windowManager.setMinimumSize(const Size(1043, 552));
      await windowManager.show();
      await windowManager.center(animate: false);
      await windowManager.setPreventClose(false);
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
      title: "Pactus",
      themeMode: appTheme.mode,
      debugShowCheckedModeBanner: false,
      color: appTheme.color,
      darkTheme: FluentThemeData(
        scaffoldBackgroundColor: isDarkMode() ? Color(0xFF1D1E20) : Colors.grey.withOpacity(0.1),
        fontFamily: 'Lexend',
        brightness: Brightness.dark,
        accentColor: appTheme.color,
        // micaBackgroundColor: appTheme.backgroungColor,
        inactiveBackgroundColor: appTheme.backgroungColor,
        visualDensity: VisualDensity.standard,
        focusTheme: FocusThemeData(
          glowFactor: is10footScreen(context) ? 2.0 : 0.0,
        ),
      ),
      theme: FluentThemeData(
        
        fontFamily: 'Lexend',
        brightness: Brightness.light,
        // accentColor: appTheme.color,
        // inactiveBackgroundColor: appTheme.backgroungColor,
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
            child: ScreenUtilInit(minTextAdapt: true, splitScreenMode: true, designSize: const Size(1043, 552), child: child!),
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

