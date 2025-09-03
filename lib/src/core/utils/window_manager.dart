import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui/src/core/utils/methods/print_debug.dart';
import 'package:window_manager/window_manager.dart';

Future<void> windowsManager() async {
  try {
    await WindowManager.instance.ensureInitialized();

    final windowOptions = WindowOptions(
      title: 'Pactus GUI',
      size: Size(1280, 720),
      minimumSize: Size(1280, 720),
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
    );

    await WindowManager.instance.waitUntilReadyToShow(windowOptions, () async {
      await WindowManager.instance.setAsFrameless().then(
        (_) => WindowManager.instance.show(),
      );
    });
  } on Exception catch (e) {
    printDebug('Window initialization failed: $e');
  }
}
