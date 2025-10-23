import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:pactus_gui/src/core/enums/app_enums.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui/src/features/transactions/presentation/blocs/transaction_step_cubit.dart'
    show TransactionStepCubit;
import 'package:pactus_gui/src/features/transactions/presentation/widgets/dotted_line_widget.dart'
    show DottedLineWidget;
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transaction_stepper_icon.dart'
    show TransactionStepperIcon;
import 'package:pactus_gui_widgetbook/app_styles.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionStepCubit, TransactionStep>(
      builder: (context, state) {
        return SizedBox(
          width: 533,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TransactionStepperIcon(
                    transactionStep: TransactionStep.transactionForm,
                  ),
                  DottedLineWidget(
                    currentStepID: state.id,
                    transactionStep: TransactionStep.confirmation,
                    width: 80,
                  ),

                  TransactionStepperIcon(
                    transactionStep: TransactionStep.confirmation,
                  ),
                  DottedLineWidget(
                    currentStepID: state.id,
                    transactionStep: TransactionStep.result,
                    width: 80,
                  ),

                  TransactionStepperIcon(
                    transactionStep: TransactionStep.result,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 112,
                    child: Center(
                      child: Text(
                        context.tr(TransactionStep.transactionForm.title),
                        style: AppTheme.of(context).typography.bodyStrong!
                            .copyWith(
                              color:
                                  state.id >= TransactionStep.transactionForm.id
                                  ? AppTheme.of(context).accentColor
                                  : AppTheme.of(
                                      context,
                                    ).extension<TransactionsPallet>()!.text,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 112,

                    child: Center(
                      child: Text(
                        context.tr(TransactionStep.confirmation.title),
                        style: AppTheme.of(context).typography.bodyStrong!
                            .copyWith(
                              color: state.id >= TransactionStep.confirmation.id
                                  ? AppTheme.of(context).accentColor
                                  : AppTheme.of(
                                      context,
                                    ).extension<TransactionsPallet>()!.text,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 112,
                    child: Center(
                      child: Text(
                        context.tr(TransactionStep.result.title),
                        style: AppTheme.of(context).typography.bodyStrong!
                            .copyWith(
                              color: state.id >= TransactionStep.result.id
                                  ? AppTheme.of(context).accentColor
                                  : AppTheme.of(
                                      context,
                                    ).extension<TransactionsPallet>()!.text,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
