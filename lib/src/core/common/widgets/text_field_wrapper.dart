import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:gui/src/core/utils/paltform_detection.dart';

/// [TextFieldWrapper] Documentation
///
/// ### Purpose:
/// A platform-specific wrapper to address accessibility-related issues-
/// on Linux.
///
/// This widget was designed to resolve an issue found on Linux platforms where
/// selecting a `TextField` or `TextFormField` can cause the app to freeze for
/// an extended period (20-40 seconds).
/// It addresses this by conditionally excluding
/// semantics for wrapped widgets on Linux.
/// This ensures consistent behavior across different platforms without-
/// impacting functionality on other operating systems.
///
/// ### Behavior:
/// - **On Linux**: The [child] widget is wrapped with [ExcludeSemantics]
///   to prevent accessibility-related issues affecting semantics on Linux.
/// - **On other platforms**: The [child] widget is displayed as-is without-
///   any changes.
///
/// ### Usage:
/// Use this wrapper around any widget that might be affected by semantic-
/// accessibility issues specific to Linux, such as `TextFormField`,
/// `TextField`, or other form-related widgets.
///
class TextFieldWrapper extends StatelessWidget {
  const TextFieldWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (Platform.isLinux) {
      return ExcludeSemantics(child: child);
    }
    return child;
  }
}
