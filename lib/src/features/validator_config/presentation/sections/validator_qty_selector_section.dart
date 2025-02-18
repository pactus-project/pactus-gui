import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/cubits/expandable_states_cubit.dart';
import 'package:gui/src/core/common/widgets/custom_expandable_widget.dart';
import 'package:gui/src/core/constants/app_constants.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/validator_config/presentation/cubits/validator_qty_cubit.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class ValidatorQtySelectorSection extends StatelessWidget {
  const ValidatorQtySelectorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr(LocaleKeys.number_of_validators),
          style: InterTextStyles.captionMedium.copyWith(
            color: AppColors.primaryGray,
          ),
        ),
        const Gap(8),
        BlocBuilder<ValidatorQtyCubit, String>(
          builder: (context, selectedQty) {
            return CustomExpandableWidget(
              padding: const EdgeInsets.
              symmetric(horizontal: 10, vertical: 5),
              expandedColor: AppTheme.of(context)
                  .extension<LightPallet>()!
                  .light900,
              headerColor: AppTheme.of(context)
                  .extension<LightPallet>()!
                  .light900,
              borderHighlightColor: Colors.blue,
              width: 112,
              body: Column(
                children: [
                  AppConstants.validators10,
                  AppConstants.validators15,
                  AppConstants.validators20,
                  AppConstants.validators25,
                  AppConstants.validators32,
                ].map(
                      (value) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: GestureDetector(
                        onTap: () {
                          context.read<ValidatorQtyCubit>().setQty(value);
                          context.read<ExpandableStateCubit>().toggleExpanded();
                        },
                        child: Text(
                          value,
                          style: InterTextStyles.captionMedium.copyWith(
                            color: AppColors.primaryGray,
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),

              header: selectedQty,
              isExpanded: context
                  .watch<ExpandableStateCubit>()
                  .state,
              onTap: () {
                context
                    .read<ExpandableStateCubit>()
                    .toggleExpanded();
              },
            );
          },
        ),
      ],
    );
  }
}
