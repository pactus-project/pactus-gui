import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gui/src/core/common/cubits/app_accent_color_cubit.dart';
import 'package:gui/src/core/constants/configurations.dart';
import 'package:gui/src/core/di/locator.dart';
import 'package:gui/src/core/router/app_router.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_cubit.dart';
import 'package:gui/src/features/main/language/core/language_constants.dart';
import 'package:gui/src/features/main/radio_button_cubit/presentation/radio_button_cubit.dart';
import 'package:gui/src/features/main/theme/bloc/theme_bloc.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';
import 'package:window_manager/window_manager.dart';
import 'src/core/common/cubits/step_validation_cubit.dart';
import 'src/features/main/language/presentation/bloc/language_bloc.dart';
import 'src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupSharedPreferences();
  await setupDependencies();

  try {
    await WindowManager.instance.ensureInitialized();

    final windowOptions = WindowOptions(
      size: Size(1280, 720),
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
    );

    await WindowManager.instance.waitUntilReadyToShow(windowOptions, () async {
      await WindowManager.instance
          .setAsFrameless()
          .then((_) => WindowManager.instance.show());
    });
  } on Exception catch (e) {
    debugPrint('Window initialization failed: $e');
  }
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
        BlocProvider<RadioButtonCubit>(
          create: (_) => RadioButtonCubit(),
        ),
        BlocProvider<DaemonCubit>(
          create: (_) => DaemonCubit(),
        ),
        BlocProvider<StepValidationCubit>(
          create: (_) => StepValidationCubit(),
        ),
        BlocProvider<AppAccentColorCubit>(
          create: (_) => AppAccentColorCubit(),
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
            return BlocBuilder<AppAccentColorCubit, int>(
              builder: (context, accentColorId) {
                final theme = isDarkMode
                    ? AppThemeData.darkTheme(
                        AccentPallet.dark.getByIndex(accentColorId),
                      )
                    : AppThemeData.lightTheme(
                        AccentPallet.light.getByIndex(accentColorId),
                      );
                return Builder(
                  builder: (context) {
                    return AppTheme(
                      themeData: theme,
                      child: FluentApp.router(
                        debugShowCheckedModeBanner: false,
                        routerConfig: routerConfig,
                        title: 'Pactus Gui App',
                        themeMode:
                            isDarkMode ? ThemeMode.dark : ThemeMode.light,
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
      },
    );
  }
}
