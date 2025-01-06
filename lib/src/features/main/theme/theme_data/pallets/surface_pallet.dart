import 'package:fluent_ui/fluent_ui.dart';

@immutable
class SurfacePallet extends ThemeExtension<SurfacePallet> {
  const SurfacePallet({
    required this.surface3,
    required this.surface2,
    required this.surface1,
  });

  final Color? surface3;
  final Color? surface2;
  final Color? surface1;

  @override
  SurfacePallet copyWith({Color? surface3, Color? surface2, Color? surface1}) {
    return SurfacePallet(
      surface3: surface3 ?? this.surface3,
      surface2: surface2 ?? this.surface2,
      surface1: surface1 ?? this.surface1,
    );
  }

  // Controls how the properties change on theme changes
  @override
  SurfacePallet lerp(ThemeExtension<SurfacePallet>? other, double t) {
    if (other is! SurfacePallet) {
      return this;
    }
    return SurfacePallet(
      surface3: Color.lerp(surface3, other.surface3, t),
      surface2: Color.lerp(surface2, other.surface2, t),
      surface1: Color.lerp(surface1, other.surface1, t),
    );
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'SurfacePallet('
      'surface3: $surface3, '
      'surface2: $surface2, '
      'surface1: $surface1, '
      ')';

  Color? getByIndex(int index) {
    switch (index) {
      case 3:
        return surface3;
      case 2:
        return surface2;
      case 1:
        return surface1;
      default:
        throw Exception('Invalid SurfacePallet color index');
    }
  }

  // the light theme
  static const light = SurfacePallet(
    surface3: Color(0xffffffff), // FIGMA: White 100
    surface2: Color.fromRGBO(255, 255, 255, 0.7), // FIGMA: White 70
    surface1: Color.fromRGBO(255, 255, 255, 0.3), // FIGMA: White 30
  );

  // the dark theme
  static const dark = SurfacePallet(
    surface3: Color(0xff222222),
    surface2: Color.fromRGBO(35, 35, 35, 0.7),
    surface1: Color.fromRGBO(35, 35, 35, 0.3),
  );
}
