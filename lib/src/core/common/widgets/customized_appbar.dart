import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';
import 'package:window_manager/window_manager.dart';

import 'app_bar_button.dart';
import 'theme_switcher.dart';

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
/// - An optional title in the center.
/// - A toggle switch for changing themes.
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
  const CustomAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) async {
        await windowManager.startDragging();
      },
      child: Container(
        height: preferredSize.height,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppTheme.of(context).extension<LightPallet>()!.light800,
        ),
        child: Row(
          children: [
            // Logo on the left
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SvgPicture.asset(
                Assets.icons.icLogoLight,
              ),
            ),
            // Optional title in the center
            const Expanded(
              child: Center(
                child: Text('Pactus'),
              ),
            ),
            ThemeSwitcher(),
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
