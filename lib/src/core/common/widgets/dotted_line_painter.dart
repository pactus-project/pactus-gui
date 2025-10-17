import 'package:fluent_ui/fluent_ui.dart'
    show
        Canvas,
        Color,
        Colors,
        CustomPainter,
        Offset,
        Paint,
        PaintingStyle,
        Size;

class DottedLinePainter extends CustomPainter {
  DottedLinePainter({
    this.color = Colors.grey,
    this.dotWidth = 2.0,
    this.dotSpace = 2.0,
  });
  final Color color;
  final double dotWidth;
  final double dotSpace;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawCircle(
        Offset(startX + dotWidth / 2, size.height / 2),
        dotWidth / 2,
        paint,
      );
      startX += dotWidth + dotSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
