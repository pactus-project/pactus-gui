import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gui/src/core/common/widgets/theme_switcher.dart';
import 'package:gui/src/core/common/widgets/toolbar_logo.dart';
import 'package:gui/src/features/main/language/presentation/widget/language_widget.dart';
import 'package:gui/src/features/main/theme/presentation/widgets/theme_selector.dart';
import 'package:gui/src/features/main/theme/theme_data/pallets/on_surface_pallet.dart';

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
        title: Text(AppLocalizations.of(context)!.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.subtitle,
              style: theme.textTheme.titleMedium!.copyWith(
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
            const ThemeSelector(),
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
