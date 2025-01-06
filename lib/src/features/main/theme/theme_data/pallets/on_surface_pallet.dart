import 'package:fluent_ui/fluent_ui.dart';

@immutable
class OnSurfacePallet extends ThemeExtension<OnSurfacePallet> {
  const OnSurfacePallet({
    required this.onSurface4,
    required this.onSurface3,
    required this.onSurface2,
    required this.onSurface1,
    required this.onSurface0,
  });

  final Color? onSurface4;
  final Color? onSurface3;
  final Color? onSurface2;
  final Color? onSurface1;
  final Color? onSurface0;

  @override
  OnSurfacePallet copyWith({
    Color? onSurface4,
    Color? onSurface3,
    Color? onSurface2,
    Color? onSurface1,
    Color? onSurface0,
  }) {
    return OnSurfacePallet(
      onSurface4: onSurface4 ?? this.onSurface4,
      onSurface3: onSurface3 ?? this.onSurface3,
      onSurface2: onSurface2 ?? this.onSurface2,
      onSurface1: onSurface1 ?? this.onSurface1,
      onSurface0: onSurface0 ?? this.onSurface0,
    );
  }

  // Controls how the properties change on theme changes
  @override
  OnSurfacePallet lerp(ThemeExtension<OnSurfacePallet>? other, double t) {
    if (other is! OnSurfacePallet) {
      return this;
    }
    return OnSurfacePallet(
      onSurface4: Color.lerp(onSurface4, other.onSurface4, t),
      onSurface3: Color.lerp(onSurface3, other.onSurface3, t),
      onSurface2: Color.lerp(onSurface2, other.onSurface2, t),
      onSurface1: Color.lerp(onSurface1, other.onSurface1, t),
      onSurface0: Color.lerp(onSurface0, other.onSurface0, t),
    );
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'OnSurfacePallet('
      'onSurface4: $onSurface4, '
      'onSurface3: $onSurface3, '
      'onSurface2: $onSurface2, '
      'onSurface1: $onSurface1, '
      'onSurface0: $onSurface0, '
      ')';

  Color? getByIndex(int index) {
    switch (index) {
      case 4:
        return onSurface4;
      case 3:
        return onSurface3;
      case 2:
        return onSurface2;
      case 1:
        return onSurface1;
      case 0:
        return onSurface0;
      default:
        throw Exception('Invalid OnSurfacePallet color index');
    }
  }

  // the light theme
  static const light = OnSurfacePallet(
    onSurface4: Color(0xff222222),
    //FIGMA: Black 100
    onSurface3: Color(0xff7A7A7A),
    //FIGMA: Black 60
    onSurface2: Color(0xffBDBDBD),
    //FIGMA: Black 30
    onSurface1: Color(0xffE9E9E9),
    //FIGMA: Black 10
    onSurface0: Color(0xffF8F8F8), //FIGMA: Black 03
  );

  // the dark theme
  static const dark = OnSurfacePallet(
    onSurface4: Color(0xffF8F8F8),
    onSurface3: Color(0xffE9E9E9),
    onSurface2: Color(0xffBDBDBD),
    onSurface1: Color(0xff7A7A7A),
    onSurface0: Color(0xff222222),
  );
}
