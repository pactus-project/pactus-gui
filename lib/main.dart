import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/constants/configurations.dart';
import 'package:gui/src/core/di/service_locator.dart';
import 'package:gui/src/core/router/app_router.dart';
import 'package:gui/src/core/utils/gen/localization/codegen_loader.g.dart';
import 'package:gui/src/features/main/theme/bloc/theme_bloc.dart';
import 'package:gui/src/features/main/theme/bloc/theme_state.dart';
import 'src/core/services/shared_preferences_service.dart';
import 'src/features/main/language/presentation/bloc/language_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupSharedPreferences();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>(
          create: (_) => LanguageBloc(locator<SharedPreferencesService>()),
        ),
        BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(locator<SharedPreferencesService>()),
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
          if (context.locale != languageState.selectedLanguage.value) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.setLocale(languageState.selectedLanguage.value);
            });
          }
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
