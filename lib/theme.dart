import 'package:flutter/foundation.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:system_theme/system_theme.dart';

import 'package:fluent_ui/fluent_ui.dart';

enum NavigationIndicators { sticky, end }

class AppTheme extends ChangeNotifier {
  AccentColor? _color;

  AccentColor get color => _color ?? systemAccentColor;

  set color(AccentColor color) {
    _color = color;
    notifyListeners();
  }

  Color? _scaffoldBackgroundColor;

  Color get scaffoldBackgroundColor => _scaffoldBackgroundColor ?? Colors.white;

  set scaffold(Color color) {
    _scaffoldBackgroundColor = color;
    notifyListeners();
  }

  ThemeMode _mode = ThemeMode.system;

  ThemeMode get mode => _mode;

  set mode(ThemeMode mode) {
    _mode = mode;
    notifyListeners();
  }

  PaneDisplayMode _displayMode = PaneDisplayMode.auto;

  PaneDisplayMode get displayMode => _displayMode;

  set displayMode(PaneDisplayMode displayMode) {
    _displayMode = displayMode;
    notifyListeners();
  }

  NavigationIndicators _indicator = NavigationIndicators.sticky;

  NavigationIndicators get indicator => _indicator;

  set indicator(NavigationIndicators indicator) {
    _indicator = indicator;
    notifyListeners();
  }

  WindowEffect _windowEffect = WindowEffect.disabled;

  WindowEffect get windowEffect => _windowEffect;

  set windowEffect(WindowEffect windowEffect) {
    _windowEffect = windowEffect;
    notifyListeners();
  }

  void setEffect(WindowEffect effect, BuildContext context) {
    Window.setEffect(
      effect: effect,
      color: [
        WindowEffect.solid,
        WindowEffect.acrylic,
      ].contains(effect)
          ? FluentTheme.of(context).micaBackgroundColor.withOpacity(1.00)
          : Colors.transparent,
      dark: FluentTheme.of(context).brightness.isDark,
    );
  }

  TextDirection _textDirection = TextDirection.ltr;

  TextDirection get textDirection => _textDirection;

  set textDirection(TextDirection direction) {
    _textDirection = direction;
    notifyListeners();
  }

  Locale? _locale;

  Locale? get locale => _locale;

  set locale(Locale? locale) {
    _locale = locale;
    notifyListeners();
  }

  Color get navigationBarBackground => _mode == ThemeMode.dark || _mode == ThemeMode.system ?
  const Color(0xFF1A1A1A) : const Color(0xFFF0F0F0);

  Color get separator => _mode == ThemeMode.dark || _mode == ThemeMode.system ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.1);

  Color get buttonBar => _mode == ThemeMode.dark || _mode == ThemeMode.system ? Colors.black.withOpacity(0.6) : Colors.white;

}

AccentColor get systemAccentColor {
  if ((defaultTargetPlatform == TargetPlatform.windows || defaultTargetPlatform == TargetPlatform.android) && !kIsWeb) {
    return AccentColor.swatch({
      'darkest': SystemTheme.accentColor.darkest,
      'darker': SystemTheme.accentColor.darker,
      'dark': SystemTheme.accentColor.dark,
      'normal': SystemTheme.accentColor.accent,
      'light': SystemTheme.accentColor.light,
      'lighter': SystemTheme.accentColor.lighter,
      'lightest': SystemTheme.accentColor.lightest,
    });
  }
  return Colors.blue;
}
