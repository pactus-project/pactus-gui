import 'package:fluent_ui/fluent_ui.dart';

/// [WidgetUtils] documentation
/// A utility class providing reusable widget properties and settings.
///
/// This class encapsulates common configurations to avoid code duplication,
/// particularly for widget state properties and appearance settings.
///
/// **Note:** This class is non-instantiable and serves as a static utility.
class WidgetUtils {
  const WidgetUtils._();

  /// Creates a [WidgetStateProperty] for an [OutlinedBorder] with a specified -
  /// border radius.
  ///
  /// - **border**: The radius of the border corners (required).
  ///
  /// **Example:**
  /// ```dart
  /// final shapeProperty = WidgetUtils.shape(border: 12.0);
  /// ```
  ///
  /// **Returns:**
  /// A [WidgetStateProperty] of type [OutlinedBorder], configured with the -
  /// given border radius.
  static WidgetStateProperty<OutlinedBorder?>? shape({
    required double border,
  }) =>
      WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(border),
        ),
      );
}
