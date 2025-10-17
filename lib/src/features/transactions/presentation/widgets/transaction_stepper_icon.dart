import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pactus_gui/src/core/enums/app_enums.dart';
import 'package:pactus_gui/src/core/utils/gen/assets/assets.gen.dart'
    show Assets;
import 'package:pactus_gui/src/features/transactions/presentation/blocs/transaction_step_cubit.dart'
    show TransactionStepCubit;
import 'package:pactus_gui_widgetbook/app_styles.dart';

class TransactionStepperIcon extends StatelessWidget {
  const TransactionStepperIcon({super.key, required this.transactionStep});
  final TransactionStep transactionStep;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionStepCubit, TransactionStep>(
      builder: (context, state) {
        return Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.of(
              context,
            ).extension<TransactionsPallet>()!.stepperBackground,
            border: Border.all(
              color: state.id >= transactionStep.id
                  ? AppTheme.of(context).accentColor
                  : AppTheme.of(
                context,
              ).extension<TransactionsPallet>()!.border!,

              width: 2,
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 8),
          child: SvgPicture.asset(
            switch (transactionStep) {
              TransactionStep.transactionForm => Assets.icons.icTransactionStep,
              TransactionStep.confirmation => Assets.icons.icConfirmationStep,
              TransactionStep.result => Assets.icons.icResultStep,
            },
            colorFilter: ColorFilter.mode(
              state.id >= transactionStep.id
                  ? AppTheme.of(context).accentColor
                  : AppTheme.of(context).extension<TransactionsPallet>()!.icon!,
              BlendMode.srcIn,
            ),
          ),
        );
      },
    );
  }
}
