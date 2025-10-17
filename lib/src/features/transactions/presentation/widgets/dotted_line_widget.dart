import 'package:fluent_ui/fluent_ui.dart';
import 'package:pactus_gui/src/core/common/widgets/dotted_line_painter.dart';
import 'package:pactus_gui/src/core/enums/app_enums.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class DottedLineWidget extends StatelessWidget {
  const DottedLineWidget({
    super.key,
    required this.width,
    required this.transactionStep,
    required this.currentStepID,
  });
  final double width;
  final TransactionStep transactionStep;
  final int currentStepID;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // Adjust width as needed
      height: 1,
      child: CustomPaint(
        painter: DottedLinePainter(
          color: transactionStep.id <= currentStepID
              ? AppTheme.of(context).accentColor
              : AppTheme.of(context).extension<TransactionsPallet>()!.border!,
          dotWidth: 3,
        ),
      ),
    );
  }
}
