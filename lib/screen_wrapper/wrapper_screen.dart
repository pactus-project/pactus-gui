import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pactus/support/app_sizes.dart';
import 'package:pactus/support/platform_detect.dart';
import 'package:window_manager/window_manager.dart';

import '../provider/theme_provider.dart';
import '../support/app_router.dart';

class WrapperPage extends ConsumerStatefulWidget {
  const WrapperPage({super.key, required this.title, required this.content});

  final String title;
  final Widget content;

  @override
  ConsumerState<WrapperPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<WrapperPage> {
  final viewKey = GlobalKey(debugLabel: 'Navigation View Key');

  get router => ref.read(goRouterProvider);

  // get theme => ref.read(themeProvider);
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    return NavigationView(
      key: viewKey,
      appBar: NavigationAppBar(
        height: PlatformDetect.isMacOS ? 40 : 50,
        backgroundColor: theme.navigationBarBackground,
        automaticallyImplyLeading: false,
        // title: PlatformDetect.isMacOS ? null :  Text(widget.title),
        leading: PlatformDetect.isMacOS
            ? null
            : Image.asset(
                'assets/icons/logo.png',
                height: 30,
                width: 30,
                filterQuality: FilterQuality.high,
              ),
        actions: DragToMoveArea(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              if (PlatformDetect.isMacOS)
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/logo.png',
                        height: 20,
                        width: 20,
                        filterQuality: FilterQuality.high,
                      ),
                      gapW8,
                      Text(
                        widget.title,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              if (PlatformDetect.isMacOS)
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                      end: PlatformDetect.isMacOS ? 30.w : 80.0.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/icons/sun.png',
                          height: 20,
                          width: 20,
                          filterQuality: FilterQuality.high,
                          color: theme.mode == ThemeMode.light
                              ? Colors.transparent
                              : Colors.white.withOpacity(0.8),
                        ),
                        gapW16,
                        ToggleSwitch(
                          // content: Image.asset("assets/icons/moon.png", height: 20, width: 20, filterQuality: FilterQuality.high, color: theme.mode == ThemeMode.dark ? Colors.white.withOpacity(0.5) : null,),
                          checked: FluentTheme.of(context).brightness.isDark,
                          onChanged: (v) {
                            if (v) {
                              theme.mode = ThemeMode.dark;
                            } else {
                              theme.mode = ThemeMode.light;
                            }
                          },
                        ),
                        gapW16,
                        Image.asset(
                          'assets/icons/moon.png',
                          height: 20,
                          width: 20,
                          filterQuality: FilterQuality.high,
                          color: theme.mode == ThemeMode.dark
                              ? Colors.transparent
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              if (!PlatformDetect.isMacOS || kIsWeb)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/icons/sun.png',
                      height: 20,
                      width: 20,
                      filterQuality: FilterQuality.high,
                      color: theme.mode == ThemeMode.light
                          ? Colors.transparent
                          : Colors.white.withOpacity(0.8),
                    ),
                    gapW16,
                    ToggleSwitch(
                      // content: Image.asset("assets/icons/moon.png", height: 20, width: 20, filterQuality: FilterQuality.high, color: theme.mode == ThemeMode.dark ? Colors.white.withOpacity(0.5) : null,),
                      checked: FluentTheme.of(context).brightness.isDark,
                      onChanged: (v) {
                        if (v) {
                          theme.mode = ThemeMode.dark;
                        } else {
                          theme.mode = ThemeMode.light;
                        }
                      },
                    ),
                    gapW16,
                    Image.asset(
                      'assets/icons/moon.png',
                      height: 20,
                      width: 20,
                      filterQuality: FilterQuality.high,
                      color: theme.mode == ThemeMode.dark
                          ? Colors.transparent
                          : null,
                    ),
                    gapW8,
                    const WindowButtons(),
                  ],
                ),
            ],
          ),
        ),
      ),
      content: ColoredBox(color: theme.backgroungColor, child: widget.content),
    );
  }
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);

    return SizedBox(
      width: 138,
      height: 50,
      child: WindowCaption(
        brightness: theme.brightness,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
