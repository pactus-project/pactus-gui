import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class KeyboardShortcutWidget extends StatelessWidget {
  const KeyboardShortcutWidget({
    super.key,
    required this.child,
    required this.actionOnMacOs,
    required this.actionOnLinuxWindows,
    required this.shortcutOnLinuxWindows,
    required this.shortcutOnMacOs,
    required this.isEnabledInDebugMode,
  });

  final Widget child;
  final VoidCallback actionOnMacOs;
  final VoidCallback actionOnLinuxWindows;
  final LogicalKeyboardKey shortcutOnLinuxWindows;
  final LogicalKeyboardKey shortcutOnMacOs;
  final bool isEnabledInDebugMode;

  @override
  Widget build(BuildContext context) {
    return isEnabledInDebugMode && kDebugMode
        ? FocusableActionDetector(
            autofocus: true,
            shortcuts: {
              // Shortcuts for Windows/Linux (Ctrl+D)
              SingleActivator(shortcutOnLinuxWindows, control: true):
                  VoidCallbackIntent(actionOnLinuxWindows),

              // Shortcuts for macOs (Cmd+D)
              SingleActivator(shortcutOnMacOs, meta: true): VoidCallbackIntent(
                actionOnMacOs,
              ),
            },
            child: child,
          )
        : child;
  }
}
