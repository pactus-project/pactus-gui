import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pactus_gui/src/core/common/widgets/icon_action_button.dart';
import 'package:pactus_gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/core/utils/methods/print_debug.dart';
import 'package:pactus_gui/src/core/utils/node_lock_manager/directory_manager.dart'
    show DaemonFileEnum, DirectoryManager;
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_core.dart';
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
  const CustomAppBar({super.key, this.title, this.isDashboard = false});

  final String? title;
  final bool isDashboard;

  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  Widget build(BuildContext context) {
    final isLightTheme = FluentTheme.of(context).brightness == Brightness.light;
    return GestureDetector(
      onPanStart: (details) async {
        await windowManager.startDragging();
      },
      child: Container(
        height: preferredSize.height,
        decoration: BoxDecoration(
          color: AppTheme.of(context).extension<LightPallet>()!.light800,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 20),
              child: SizedBox(
                width: 25,
                height: 25,
                child: SvgPicture.asset(
                  isLightTheme
                      ? Assets.icons.icLogoLight
                      : Assets.icons.icLogoDark,
                  width: 25,
                  height: 25,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onDoubleTap: _toggleMaximize,
                child: const SizedBox.expand(),
              ),
            ),
            Row(
              children: [
                if (isDashboard) ...[
                  IconActionButton(
                    icon: Assets.icons.icCode,
                    onPressed: _toggleShowLog,
                    size: 30,
                  ),
                  IconActionButton(
                    icon: Assets.icons.icClock,
                    onPressed: _toggleClock,
                    size: 30,
                    tooltipTitle: context.tr(LocaleKeys.clock_offset),
                    tooltipDescription: context.tr(
                      LocaleKeys.clock_offset_description,
                    ),
                  ),
                  IconActionButton(
                    icon: Assets.icons.icConnection,
                    onPressed: _toggleConnection,
                    size: 30,
                    tooltipTitle: context.tr(LocaleKeys.connection),
                    tooltipDescription: context.tr(LocaleKeys.inbound_outbound),
                  ),
                  IconActionButton(
                    icon: Assets.icons.icReachbility,
                    onPressed: _toggleReachability,
                    size: 30,
                    tintColor: Colors.green,
                    tooltipTitle: context.tr(LocaleKeys.reachability),
                    tooltipDescription: context.tr(LocaleKeys.public),
                  ),
                ],
                const ThemeSwitcher(),
                const Gap(4),
                _buildWindowControls(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWindowControls() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildControlButton(Assets.icons.icMinimize, windowManager.minimize),
        _buildControlButton(Assets.icons.icMaximize, _toggleMaximize),
        _buildControlButton(Assets.icons.icClose, () async {
          await DirectoryManager().killDaemonProcess(
            DaemonFileEnum.pactusDaemon,
          );
          await DirectoryManager().removeLockFile();
          await windowManager.close();
        }, color: PalletColors.red400),
      ],
    );
  }

  Future<void> _toggleShowLog() async {
    // Implement toggle show log
  }

  Future<void> _toggleClock() async {
    // Implement toggle clock
  }

  Future<void> _toggleConnection() async {
    // Implement toggle connection
  }

  Future<void> _toggleReachability() async {
    //Implement toggle reachability
  }

  Future<void> _toggleMaximize() async {
    final isMaximized = await windowManager.isMaximized();
    isMaximized
        ? await windowManager.unmaximize()
        : await windowManager.maximize();
  }

  Widget _buildControlButton(
    String icon,
    AsyncCallback action, {
    PalletColors? color,
    double size = 48,
  }) {
    return FluentAppBarButton(
      icon: icon,
      size: size,
      color: color,
      onPressed: () async {
        try {
          await action();
        } on Exception catch (e) {
          printDebug('Window action failed: $e');
        }
      },
    );
  }
}
