import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:window_manager/window_manager.dart';

import 'app_bar_button.dart';

/// ## [CustomAppBar] Class Documentation
///
/// The `CustomAppBar` class represents a custom application bar (AppBar)
/// that provides
/// window management controls (minimize, maximize, and close) along with
/// an optional theme toggle.
/// It is designed to be used with the `fluent_ui` and `flutter_svg` packages
/// and includes custom buttons
/// for window operations, integrated with the `window_manager` package.
///
/// ### Usage:
///
/// This widget provides a custom AppBar for an application, including:
/// - An SVG logo on the left.
/// - A toggle switch for changing themes (currently commented out).
/// - Window control buttons for minimizing, maximizing, and closing the window.
///
/// ### Properties:
///
/// - **[preferredSize]**:
///   - Returns a fixed size for the AppBar, specifically `48` pixels in height.
///
/// ### Methods:
///
/// - **[build(BuildContext context)]**:
///   - Builds the UI of the custom AppBar, including window controls and layout
///   management.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final isLightTheme = theme.brightness == Brightness.light;
    return GestureDetector(
      onPanStart: (details) async {
        await windowManager.startDragging();
      },
      child: Container(
        height: preferredSize.height,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: SvgPicture.asset(
                  Assets.icons.icLogoLight,
                ),
              ),
            ),
            ToggleSwitch(
              checked: true,
              onChanged: (bool value) {
                /// to-do #42 : uncomment this part after resolving confilcts
                /// between theme & Fluent UI by Pouria
                // context.read<ThemeBloc>().add(
                //   ThemeChanged(
                //     theme: isLightTheme ? ThemeModes.dark : ThemeModes.light,
                //   ),
                // );
              },
            ),
            Row(
              children: [
                FluentAppBarButton(
                  icon: Assets.icons.icMinimize,
                  onPressed: () async {
                    await windowManager.minimize();
                  },
                ),
                FluentAppBarButton(
                  icon: Assets.icons.icMaximize,
                  onPressed: () async {
                    final isMaximized = await windowManager.isMaximized();
                    if (isMaximized) {
                      await windowManager.unmaximize();
                    } else {
                      await windowManager.maximize();
                    }
                  },
                ),
                FluentAppBarButton(
                  icon: Assets.icons.icClose,
                  onPressed: () async {
                    await windowManager.close();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
