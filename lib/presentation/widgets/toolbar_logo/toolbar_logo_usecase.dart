import 'package:flutter/material.dart';
import 'package:gui/presentation/widgets/toolbar_logo/toolbar_logo_widget.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// ## [toolbarLogoUseCase] Documentation
/// A UseCase for testing the [ToolbarLogo] widget in both light
/// and dark themes.
@UseCase(name: 'Toolbar Logo', type: ToolbarLogo)
Widget toolbarLogoUseCase(BuildContext context) {
  // Theme toggle knob for switching between light and dark themes
  final isLightTheme = context.knobs.boolean(
    label: 'Is Light Theme',
    initialValue: true,
    description: 'Toggle to test ToolbarLogo in light or dark theme',
  );

  return MaterialApp(
    theme: isLightTheme ? ThemeData.light() : ThemeData.dark(),
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Toolbar Logo Example'),
        leading: const ToolbarLogo(),
      ),
      body: const Center(
        child: Text('Check the logo on the top left.'),
      ),
    ),
  );
}
