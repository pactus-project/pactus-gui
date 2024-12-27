import 'package:fluent_ui/fluent_ui.dart';
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

  // TODO(Esmaeil): Update this part based on the new text style in the Figma.
  static final lightTypography = Typography.raw();

  // TODO(Esmaeil): Update this part based on the new text style in the Figma.
  static final darkTypography = Typography.raw();
}
