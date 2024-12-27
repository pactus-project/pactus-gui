import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/constants/inter_text_styles.dart';
import 'package:gui/src/core/enums/theme_modes.dart';
import 'package:gui/src/core/utils/gen/assets/fonts.gen.dart';
import 'package:gui/src/features/main/theme/theme_data/pallets/on_surface_pallet.dart';
import 'package:gui/src/features/main/theme/theme_data/pallets/surface_pallet.dart';

/// ## [AppThemeData] Documentation
///
/// The `AppThemeData` class provides theming configs for the application,
/// supporting both light and dark themes.
///
/// ### Properties
///
/// - **`themeDataModes`**: A static map containing theme configurations for:
///   - **Light Theme**: Configured with `lightTypography` and light palette.
///   - **Dark Theme**: Configured with `darkTypography` and dark palette.
///
/// - **`lightTypography`**: The typography config used for the light theme.
///
/// - **`darkTypography`**: The typography config used for the dark theme.
///
/// ### Example Usage
///
/// ```dart
/// final theme = AppThemeData.themeDataModes[ThemeModes.light];
/// ```
class AppThemeData {
  const AppThemeData._();

  static final Map<ThemeModes, FluentThemeData> themeDataModes = {
    // light ThemeData.
    ThemeModes.light: FluentThemeData(
      fontFamily: FontFamily.inter,
      scaffoldBackgroundColor: SurfacePallet.light.surface3,
      brightness: Brightness.light,
      typography: lightTypography,
      cardColor: SurfacePallet.light.surface3,
      extensions: const <ThemeExtension<dynamic>>[
        OnSurfacePallet.light,
        SurfacePallet.light,
      ],
    ),
    // dark ThemeData.
    ThemeModes.dark: FluentThemeData(
      fontFamily: FontFamily.inter,
      scaffoldBackgroundColor: SurfacePallet.dark.surface3,
      brightness: Brightness.dark,
      typography: Typography.raw(),
      cardColor: SurfacePallet.dark.surface3,
      extensions: const <ThemeExtension<dynamic>>[
        OnSurfacePallet.dark,
        SurfacePallet.dark,
      ],
    ),
  };

  static final lightTypography = Typography.raw(
    caption: InterTextStyles.caption,
    body: InterTextStyles.body,
    subtitle: InterTextStyles.subtitle,
    title: InterTextStyles.title,
    titleLarge: InterTextStyles.titleLarge,
    display: InterTextStyles.display,
    bodyLarge: InterTextStyles.bodyLarge,
    bodyStrong: InterTextStyles.bodyStrong,
  );

  static final darkTypography = Typography.raw(
    caption: InterTextStyles.caption.copyWith(
      color: OnSurfacePallet.dark.onSurface4,
    ),
    body: InterTextStyles.body.copyWith(
      color: OnSurfacePallet.dark.onSurface4,
    ),
    subtitle: InterTextStyles.subtitle.copyWith(
      color: OnSurfacePallet.dark.onSurface4,
    ),
    title: InterTextStyles.title.copyWith(
      color: OnSurfacePallet.dark.onSurface4,
    ),
    titleLarge: InterTextStyles.titleLarge.copyWith(
      color: OnSurfacePallet.dark.onSurface4,
    ),
    display: InterTextStyles.display.copyWith(
      color: OnSurfacePallet.dark.onSurface4,
    ),
    bodyLarge: InterTextStyles.bodyLarge.copyWith(
      color: OnSurfacePallet.dark.onSurface4,
    ),
    bodyStrong: InterTextStyles.bodyStrong.copyWith(
      color: OnSurfacePallet.dark.onSurface4,
    ),
  );
}
