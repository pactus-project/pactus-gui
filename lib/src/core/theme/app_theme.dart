import 'package:flutter/material.dart';

/// ## [AppTheme] Class
///
/// ### Overview
/// - An [InheritedWidget] that provides access to the [ThemeData] for the -
/// widget tree. It allows child widgets to access the current theme without -
/// having to explicitly pass it down the widget tree.
///
/// ### Constructor
/// - **[AppTheme()]**
///   - `themeData`: The [ThemeData] to be provided to the widget tree.
///   - `child`: The child widget that will have access to the [themeData].
///
/// ### [of] Method
/// - A static method that retrieves the current [ThemeData] from the nearest -
/// [AppTheme] in the widget tree.
///
/// ### [updateShouldNotify] Method
/// - Compares the new [themeData] with the old one and returns a boolean -
/// indicating whether the widget should notify its dependents about the change.
///
/// ### Usage
/// The [AppTheme] is typically used to apply a theme to the widget tree and -
/// to ensure that child widgets can access the theme without manually passing
/// it down.
///
class AppTheme extends InheritedWidget {

  const AppTheme({
    required this.themeData,
    required super.child,
    super.key,
  });
  final ThemeData themeData;

  static ThemeData of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<AppTheme>()!.themeData;
    return scope;
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) {
    return themeData != oldWidget.themeData;
  }
}
