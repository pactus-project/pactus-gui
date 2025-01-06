import 'package:fluent_ui/fluent_ui.dart';

class WidgetUtils {
  const WidgetUtils._();
  static WidgetStateProperty<OutlinedBorder?>? shape({
    required double border,
  }) =>
      WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            border,
          ), // Optional: Set border radius
        ),
      );
}
