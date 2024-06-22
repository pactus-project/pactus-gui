import 'package:flutter_acrylic/flutter_acrylic.dart';

import 'package:fluent_ui/fluent_ui.dart';

enum NavigationIndicators { sticky, end }

class AppTheme extends ChangeNotifier {
  AccentColor? _color;

  AccentColor get color => _color ?? AccentColor.swatch({
    'darkest': Colors.blue.darkest,
    'darker': Colors.blue.darker,
    'dark':  Colors.blue.dark,
    'normal':  Colors.blue.normal,
    'light':  Colors.blue.light,
    'lighter':  Colors.blue.lighter,
    'lightest':  Colors.blue.lightest,
  });

  set color(AccentColor color) {
    _color = color;
    notifyListeners();
  }

  // Color? _scaffoldBackgroundColor;
  //
  // Color get scaffoldBackgroundColor => _scaffoldBackgroundColor ?? Colors.white;
  //
  // set scaffold(Color color) {
  //   _scaffoldBackgroundColor = color;
  //   notifyListeners();
  // }

  ThemeMode _mode = ThemeMode.light;

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
  Color get backgroungColor => _mode == ThemeMode.light ? const Color(0xFFFAFAFA) : Colors.black.withOpacity(0.9);

  Color get navigationBarBackground {
    return _mode == ThemeMode.dark
        ? const Color(0xFF1A1A1A)
        : const Color(0xFFF0F0F0);
  }

  bool isLightTheme(BuildContext context) {
    return _mode == ThemeMode.light;
  }

  Color get separator => _mode == ThemeMode.dark || _mode == ThemeMode.system ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.1);

  Color get buttonBar => _mode == ThemeMode.dark || _mode == ThemeMode.system ? Colors.black.withOpacity(0.2) : Colors.white;

  Color get fieldBackground => _mode == ThemeMode.dark || _mode == ThemeMode.system ? Colors.white.withOpacity(0.05) : Colors.white;

  Color get mnemonicWords => _mode == ThemeMode.dark || _mode == ThemeMode.system ? Colors.white.withOpacity(0.1) : const Color(0xFFEBF3FC);

  Color get successWords => _mode == ThemeMode.dark || _mode == ThemeMode.system ? Colors.green.lightest.withOpacity(0.9) : const Color(0xFFC6FFBD);

  Color get mnemonicText => _mode == ThemeMode.dark || _mode == ThemeMode.system ? Colors.white.withOpacity(0.9) : const Color(0xFF0F6CBD);

  Color get clipBoardText => _mode == ThemeMode.dark || _mode == ThemeMode.system ? Colors.white.withOpacity(0.7) : const Color(0xFF0066B4);

  Color get textColor => _mode == ThemeMode.dark || _mode == ThemeMode.system ? Colors.white : Colors.black;

  Color get cursorColor => _mode == ThemeMode.dark || _mode == ThemeMode.system ? Colors.white.withOpacity(0.8) : Colors.black.withOpacity(0.8);


}
