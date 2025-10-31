import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;
import 'package:pactus_gui/src/core/enums/app_enums.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui/src/features/transactions/presentation/blocs/form_validations/bond_form_validation.dart';
import 'package:pactus_gui/src/features/transactions/presentation/blocs/form_validations/transter_form_validation.dart';
import 'package:pactus_gui/src/features/transactions/presentation/blocs/form_validations/unbond_form_validation.dart'
    show UnBondFormValidation;
import 'package:pactus_gui/src/features/transactions/presentation/blocs/form_validations/withdraw_form_validator.dart'
    show WithdrawFormValidation;
import 'package:pactus_gui/src/features/transactions/presentation/blocs/transaction_step_cubit.dart'
    show TransactionStepCubit;
import 'package:pactus_gui_widgetbook/app_core.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';
import 'package:pactus_gui_widgetbook/app_widgets.dart';

class TransactionBottomBarWidget extends StatelessWidget {
  const TransactionBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void resetForms() {
      context.read<TransferFormValidation>().resetForm();
      context.read<BondFormValidation>().resetForm();
      context.read<UnBondFormValidation>().resetForm();
      context.read<WithdrawFormValidation>().resetForm();
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 88,
      color: AppTheme.of(context).scaffoldBackgroundColor,
      child: BlocBuilder<TransactionStepCubit, TransactionStep>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              switch (state) {
                TransactionStep.confirmation => UnconstrainedBox(
                  child: AdaptiveSecondaryButton(
                    title: context.tr(LocaleKeys.back),
                    buttonType: ButtonTypeEnum.titleOnly,
                    paddingSize: PaddingSizeEnum.large,
                    requestState: RequestStateEnum.initial,

                    onPressed: () {
                      context.read<TransactionStepCubit>().goToForm();
                    },
                  ),
                ),
                _ => SizedBox(),
              },

              UnconstrainedBox(
                child: AdaptivePrimaryButton(
                  title: switch (state) {
                    TransactionStep.transactionForm => context.tr(
                      LocaleKeys.next,
                    ),
                    TransactionStep.confirmation => context.tr(
                      LocaleKeys.confirm,
                    ),
                    TransactionStep.result => context.tr(LocaleKeys.close),
                  },
                  buttonType: ButtonTypeEnum.titleOnly,
                  paddingSize: PaddingSizeEnum.large,
                  requestState: RequestStateEnum.initial,

                  onPressed: switch (state) {
                    TransactionStep.transactionForm => () {
                      context.read<TransactionStepCubit>().goToConfirmation();
                    },
                    TransactionStep.confirmation => () {
                      context.read<TransactionStepCubit>().goToResult();
                    },
                    TransactionStep.result => () {
                      resetForms();
                      context.read<TransactionStepCubit>().goToForm();
                    },
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
