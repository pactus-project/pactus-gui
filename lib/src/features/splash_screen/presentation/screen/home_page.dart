import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gui/src/core/common/widgets/theme_switcher.dart';
import 'package:gui/src/core/common/widgets/toolbar_logo.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.g.dart';
import 'package:gui/src/features/main/language/presentation/widget/language_widget.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [ToolbarLogo(), ThemeSwitcher()],
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Text(LocaleKeys.title.tr()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              LocaleKeys.subtitle.tr(),
              style: InterTextStyles.title.copyWith(
                color: theme.extension<OnSurfacePallet>()!.onSurface3,
              ),
            ),
            Text(
              '$_counter',
              style: theme.textTheme.headlineMedium!.copyWith(
                color: theme.extension<OnSurfacePallet>()!.onSurface3,
              ),
            ),
            const SizedBox(height: 20),
            const ThemeSwitcher(),
            const SizedBox(height: 20),
            const LanguageSelector(), // Add the language selector here
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
