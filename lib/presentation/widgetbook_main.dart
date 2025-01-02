import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../presentation/widgetbook_main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}
@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      appBuilder: (context, child) {
        return child;
      },
      addons: [
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhone13,
          ],
        ),
        AlignmentAddon(),
      ],
      directories: directories,
    );
  }
}
