import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/constants/configurations.dart';
import 'package:gui/src/core/router/app_router.dart';
import 'package:gui/src/core/utils/gen/localization/codegen_loader.g.dart';
import 'package:gui/src/features/main/theme/bloc/theme_bloc.dart';
import 'package:window_manager/window_manager.dart';
import 'src/features/main/language/presentation/bloc/language_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await windowManager.ensureInitialized();
  final windowOptions = WindowOptions(
    size: Size(800, 600),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.startDragging();
  });

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>(
          create: (_) => LanguageBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(),
        ),
      ],
      child: PactusGuiApp(),
    ),
  );
}

class PactusGuiApp extends StatelessWidget {
  const PactusGuiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      useFallbackTranslations: true,
      supportedLocales: AppConfigs.supportedLocales,
      path: AppConfigs.translationsPath,
      fallbackLocale: AppConfigs.enLocale,
      startLocale: AppConfigs.enLocale,
      assetLoader: const CodegenLoader(),
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, languageState) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, themeState) {
              return FluentApp.router(
                debugShowCheckedModeBanner: false,
                routerConfig: routerConfig,
                title: 'Pactus Gui App',
                theme: themeState.themeData,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: AppConfigs.supportedLocales,
                locale: languageState.selectedLanguage.value,
              );
            },
          );
        },
      ),
    );
  }
}
