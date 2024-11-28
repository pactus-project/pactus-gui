import 'package:flutter/material.dart';
import 'package:gui/gen/fonts.gen.dart';
import 'package:gui/src/core/enums/theme_modes.dart';
import 'package:gui/src/features/main/theme/theme_data/pallets/on_surface_pallet.dart';
import 'package:gui/src/features/main/theme/theme_data/pallets/surface_pallet.dart';

/// ## [AppThemeData] Documentation
///
/// The [AppThemeData] class provides theming configurations for the
/// application.
/// It contains a static map that holds the `ThemeData` for both light and dark
/// modes, allowing for easy theme management based on the user's preference.
///
class AppThemeData {
  const AppThemeData._();
  static final Map<ThemeModes, ThemeData> themeDataModes = {
    // light ThemeData.
    ThemeModes.light: ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: SurfacePallet.light.surface3,
      ),
      scaffoldBackgroundColor: SurfacePallet.light.surface3,
      brightness: Brightness.light,
      dividerColor: OnSurfacePallet.light.onSurface1,
      textTheme: lightTextTheme,
      cardColor: SurfacePallet.light.surface3,
      extensions: const <ThemeExtension<dynamic>>[
        OnSurfacePallet.light,
        SurfacePallet.light,
      ],
    ),

    // dark ThemeData.
    ThemeModes.dark: ThemeData(
      brightness: Brightness.dark,
      textTheme: darkTextTheme,
      extensions: <ThemeExtension<dynamic>>[
        OnSurfacePallet.dark,
        SurfacePallet.dark,
      ],
    ),
  };

  static final lightTextTheme = TextTheme(
    displaySmall: TextStyle(
      fontFamily: FontFamily.inter,
      color: SurfacePallet.light.surface3,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 16,
      height: 24 / 12,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    headlineLarge: TextStyle(
      fontFamily: FontFamily.inter,
      color: SurfacePallet.light.surface3,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 36,
      height: 52 / 36,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    headlineMedium: TextStyle(
      fontFamily: FontFamily.inter,
      color: SurfacePallet.light.surface3,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 32,
      height: 44 / 32,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    headlineSmall: TextStyle(
      fontFamily: FontFamily.inter,
      color: SurfacePallet.light.surface3,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 24,
      height: 36 / 24,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    titleLarge: TextStyle(
      fontFamily: FontFamily.inter,
      color: SurfacePallet.light.surface3,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 20,
      height: 28 / 20,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    titleMedium: TextStyle(
      fontFamily: FontFamily.inter,
      color: SurfacePallet.light.surface3,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 24 / 16,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    titleSmall: TextStyle(
      fontFamily: FontFamily.inter,
      color: SurfacePallet.light.surface3,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 16 / 12,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    bodyLarge: TextStyle(
      fontFamily: FontFamily.inter,
      color: SurfacePallet.light.surface3,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 16,
      height: 24 / 16,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    bodyMedium: TextStyle(
      fontFamily: FontFamily.inter,
      color: SurfacePallet.light.surface3,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 20 / 14,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    bodySmall: TextStyle(
      fontFamily: FontFamily.inter,
      color: SurfacePallet.light.surface3,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 18 / 12,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    labelLarge: TextStyle(
      fontFamily: FontFamily.inter,
      color: SurfacePallet.light.surface3,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 20 / 16,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    labelMedium: TextStyle(
      fontFamily: FontFamily.inter,
      color: SurfacePallet.light.surface3,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 20 / 14,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    labelSmall: TextStyle(
      fontFamily: FontFamily.inter,
      color: SurfacePallet.light.surface3,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 10,
      height: 16 / 10,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  );

  static final darkTextTheme = TextTheme(
    displaySmall: TextStyle(
      fontFamily: FontFamily.inter,
      color: SurfacePallet.light.surface3,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 16,
      height: 24 / 12,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    headlineLarge: TextStyle(
      fontFamily: FontFamily.inter,
      color: OnSurfacePallet.light.onSurface4,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 36,
      height: 52 / 36,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    headlineMedium: TextStyle(
      fontFamily: FontFamily.inter,
      color: OnSurfacePallet.light.onSurface4,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 32,
      height: 44 / 32,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    headlineSmall: TextStyle(
      fontFamily: FontFamily.inter,
      color: OnSurfacePallet.light.onSurface4,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 24,
      height: 36 / 24,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    titleLarge: TextStyle(
      fontFamily: FontFamily.inter,
      color: OnSurfacePallet.light.onSurface4,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 20,
      height: 28 / 20,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    titleMedium: TextStyle(
      fontFamily: FontFamily.inter,
      color: OnSurfacePallet.light.onSurface4,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 24 / 16,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    titleSmall: TextStyle(
      fontFamily: FontFamily.inter,
      color: OnSurfacePallet.light.onSurface4,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 16 / 12,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    bodyLarge: TextStyle(
      fontFamily: FontFamily.inter,
      color: OnSurfacePallet.light.onSurface4,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 16,
      height: 24 / 16,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    bodyMedium: TextStyle(
      fontFamily: FontFamily.inter,
      color: OnSurfacePallet.light.onSurface4,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 20 / 14,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    bodySmall: TextStyle(
      fontFamily: FontFamily.inter,
      color: OnSurfacePallet.light.onSurface4,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 18 / 12,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    labelLarge: TextStyle(
      fontFamily: FontFamily.inter,
      color: OnSurfacePallet.light.onSurface4,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 20 / 16,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    labelMedium: TextStyle(
      fontFamily: FontFamily.inter,
      color: OnSurfacePallet.light.onSurface4,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 20 / 14,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    labelSmall: TextStyle(
      fontFamily: FontFamily.inter,
      color: OnSurfacePallet.light.onSurface4,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 10,
      height: 16 / 10,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  );
}
