import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/gestures.dart' as gestures;
import 'package:flutter/material.dart' as material;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pactus_gui/l10n/app_localizations.dart' show AppLocalizations;
import 'package:pactus_gui/src/core/common/cubits/app_accent_color_cubit.dart';
import 'package:pactus_gui/src/core/constants/configurations.dart';
import 'package:pactus_gui/src/core/router/app_router.dart';
import 'package:pactus_gui/src/features/main/language/core/language_constants.dart';
import 'package:pactus_gui/src/features/main/theme/bloc/theme_bloc.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';
import 'src/features/main/language/presentation/bloc/language_bloc.dart';

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
                        scrollBehavior: const material.MaterialScrollBehavior()
                            .copyWith(
                              dragDevices: {
                                gestures.PointerDeviceKind.mouse,
                                gestures.PointerDeviceKind.touch,
                              },
                            ),
                        debugShowCheckedModeBanner: false,
                        routerConfig: routerConfig,
                        title: 'Pactus Gui App',
                        themeMode: isDarkMode
                            ? ThemeMode.dark
                            : ThemeMode.light,
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
