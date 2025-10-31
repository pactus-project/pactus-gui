import 'package:fluent_ui/fluent_ui.dart'
    show TextDirection, TextPainter, TextSpan, TextStyle;

extension CenterEllipsisExtension on String {
  String centerEllipsis(double maxWidth, TextStyle style) {
    final tp = TextPainter(
      text: TextSpan(text: this, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    if (tp.width <= maxWidth) {
      return this;
    }

    var start = this;
    var end = '';
    var removeCount = 0;

    while (tp.width > maxWidth && removeCount < length) {
      removeCount++;
      final leftCount = ((length - removeCount) / 2).floor();
      start = substring(0, leftCount);
      end = substring(length - leftCount);
      final candidate = '$start . . . $end';

      tp
        ..text = TextSpan(text: candidate, style: style)
        ..layout();

      if (tp.width <= maxWidth) {
        return candidate;
      }
    }

    return '$start . . . $end';
  }
}
