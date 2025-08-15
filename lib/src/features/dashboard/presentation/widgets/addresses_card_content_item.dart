import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui/src/core/common/widgets/custom_tooltip.dart'
    show CustomTooltip;
import 'package:pactus_gui_widgetbook/app_styles.dart';

abstract class _BaseTextCard extends StatelessWidget {
  const _BaseTextCard({
    super.key,
    required this.text,
    required this.width,
      this.height,
    this.textAlign = TextAlign.start,
  });
  final String text;
  final double width;
  final double? height;
  final TextAlign? textAlign;

  @protected
  TextStyle getTextStyle(BuildContext context) {
    return AppTheme.of(context).typography.caption!.copyWith(
      color: AppTheme.of(context).extension<DarkPallet>()!.dark800,
    );
  }

  @protected
  Widget buildTextWidget(
    BuildContext context,
    String displayText,
    TextStyle style,
  ) {
    return Text(
      displayText,
      style: style,
      maxLines: 1,
      overflow: TextOverflow.visible,
      textAlign: textAlign,
    );
  }
}

class SimpleTextCard extends _BaseTextCard {
  const SimpleTextCard({
    super.key,
    required super.text,
    required super.width,
      super.height,
    super.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: buildTextWidget(context, text, getTextStyle(context)),
      ),
    );
  }
}

class TooltipTextCard extends _BaseTextCard {
  const TooltipTextCard({
    super.key,
    required super.text,
    required super.width,
    super.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final style = getTextStyle(context);
            final displayText = _centerEllipsis(
              text,
              constraints.maxWidth,
              style,
            );
            return CustomTooltip(
              tooltipTitle: text,
              child: buildTextWidget(context, displayText, style),
            );
          },
        ),
      ),
    );
  }

  String _centerEllipsis(String text, double maxWidth, TextStyle style) {
    final tp = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    if (tp.width <= maxWidth) {
      return text;
    }

    var start = text;
    var end = '';
    var removeCount = 0;

    while (tp.width > maxWidth && removeCount < text.length) {
      removeCount++;
      final leftCount = ((text.length - removeCount) / 2).floor();
      start = text.substring(0, leftCount);
      end = text.substring(text.length - leftCount);
      final candidate = '$start....$end';

      tp
        ..text = TextSpan(text: candidate, style: style)
        ..layout();

      if (tp.width <= maxWidth) {
        return candidate;
      }
    }

    return '$start....$end';
  }
}
