import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gui/src/features/main/theme/bloc/theme_bloc.dart';
import 'src/features/main/language/presentation/bloc/language_bloc.dart';
import 'src/features/splash_screen/presentation/screen/home_page.dart';

void main() {
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
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, languageState) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: themeState.themeData,
              locale: languageState.selectedLanguage.value,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'), // English
                Locale('es'), // Spanish
                Locale('fr'), // French
              ],
              home: const MyHomePage(),
            );
          },
        );
      },
    );
  }
}
