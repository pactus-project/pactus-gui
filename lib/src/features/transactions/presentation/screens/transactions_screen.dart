import 'package:fluent_ui/fluent_ui.dart';
import 'package:gap/gap.dart' show Gap;
import 'package:pactus_gui/src/features/transactions/presentation/widgets/step_viewer_widget.dart'
    show StepViewerWidget;
import 'package:pactus_gui/src/features/transactions/presentation/widgets/stepper_widget.dart'
    show StepperWidget;
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transaction_bottom_bar_widget.dart'
    show TransactionBottomBarWidget;
import 'package:pactus_gui_widgetbook/app_styles.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      padding: EdgeInsets.all(0),
      content: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 32),
        color: AppTheme.of(context).scaffoldBackgroundColor,
        child: Column(children: [StepperWidget(), Gap(46), StepViewerWidget()]),
      ),
      bottomBar: TransactionBottomBarWidget(),
    );
  }
}
