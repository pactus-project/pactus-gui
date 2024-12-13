import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/constants/configurations.dart';
import 'package:gui/src/core/router/app_router.dart';
import 'package:gui/src/core/utils/gen/localization/codegen_loader.g.dart';
import 'package:gui/src/features/main/theme/bloc/theme_bloc.dart';
import 'src/features/main/language/presentation/bloc/language_bloc.dart';

void main() async {
  await EasyLocalization.ensureInitialized();
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
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                routerConfig: routerConfig,
                title: 'Flutter Demo',
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
