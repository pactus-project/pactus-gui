import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:window_manager/window_manager.dart';

import '../provider/theme_provider.dart';
import '../support/app_router.dart';

class WrapperPage extends ConsumerStatefulWidget {
  final String title;
  final Widget content;
  const WrapperPage({super.key, required this.title, required this.content});


  @override
  ConsumerState<WrapperPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<WrapperPage> {
  final viewKey = GlobalKey(debugLabel: 'Navigation View Key');
  get router => ref.read(goRouterProvider);
  get appTheme => ref.read(appThemeProvider);
  @override
  Widget build(BuildContext context) {
    return NavigationView(
      key: viewKey,
      appBar: NavigationAppBar(
        height: 50,
        backgroundColor: appTheme.navigationBarBackground,
        automaticallyImplyLeading: false,
        title: Text(widget.title),
        leading: Image.asset("assets/icons/logo.png", height: 30, width: 30, filterQuality: FilterQuality.high),
        actions: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Padding(
              padding: EdgeInsetsDirectional.only(end: 80.0.w),
              child: ToggleSwitch(
                content: Image.asset("assets/icons/moon.png", height: 20, width: 20, filterQuality: FilterQuality.high, color: appTheme.mode == ThemeMode.dark ? Colors.white.withOpacity(0.5) : null,),
                checked: FluentTheme.of(context).brightness.isDark,
                onChanged: (v) {
                  if (v) {
                    appTheme.mode = ThemeMode.dark;
                  } else {
                    appTheme.mode = ThemeMode.light;
                  }
                },
              ),
            ),
          ),
          if (!kIsWeb) const WindowButtons(),
        ]),
      ),

      content: widget.content,
    );
  }
}


class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);

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
