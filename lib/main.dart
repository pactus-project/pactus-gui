import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gui/src/core/constants/configurations.dart';
import 'package:gui/src/core/router/app_router.dart';
import 'package:gui/src/features/main/language/core/language_constants.dart';
import 'package:gui/src/features/main/theme/bloc/theme_bloc.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';
import 'src/features/main/language/presentation/bloc/language_bloc.dart';
import 'src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>(
          create: (_) => LanguageBloc(),
        ),
        BlocProvider<AppThemeCubit>(
          create: (_) => AppThemeCubit(),
        ),
        BlocProvider<NavigationPaneCubit>(
          create: (_) => NavigationPaneCubit(),
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
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, languageState) {
        return BlocBuilder<AppThemeCubit, bool>(
          builder: (context, isDarkMode) {
            final theme = isDarkMode
                ? AppThemeData.darkTheme(AppThemeData.darkAccentColors[0])
                    .copyWith(
                    extensions: AppThemeData.darkExtensions,
                    typography: AppThemeData.typography,
                  )
                : AppThemeData.lightTheme(AppThemeData.lightAccentColors[0])
                    .copyWith(
                    extensions: AppThemeData.lightExtensions,
                    typography: AppThemeData.typography,
                  );
            return Builder(
              builder: (context) {
                return AppTheme(
                  themeData: theme,
                  child: FluentApp.router(
                    debugShowCheckedModeBanner: false,
                    routerConfig: routerConfig,
                    title: 'Pactus Gui App',
                    themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
                    theme: theme,
                    localizationsDelegates: [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: AppConfigs.supportedLocales,
                    locale: languageState.selectedLanguage == null
                        ? Locale(
                            LanguageConstants.enUS.language,
                            LanguageConstants.enUS.country,
                          )
                        : Locale(
                            languageState.selectedLanguage!.language,
                            languageState.selectedLanguage!.country,
                          ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
