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
/// ## [ValidatorQtySelectorSection] Class Documentation
///
/// The `ValidatorQtySelectorSection` class represents the section of the UI
/// where the user selects the number of validators.
/// It provides a collapsible widget with selectable options for the validator
/// quantity.
///
/// ### Usage:
///
/// This section includes:
/// - A label `Number of validators` that prompts the user to select a quantity.
/// - A collapsible widget (`CustomExpandableWidget`) that contains the
/// available options for selecting the number of validators.
/// - The options for quantity selection include:
/// `10`, `15`, `20`, `25`, and `32`.
/// - The user can select a value, which updates the
/// state and closes the expandable widget.
///
/// ### Properties:
///
/// - **[selectedQty]**:
///   - A `String` representing the currently selected quantity of
///   validators. It is managed by the `ValidatorQtyCubit`.
///
/// ### Methods:
///
/// - **[onTap()]**:
///   - Toggles the expandable widget's state when the user taps on the header.
///   - Updates the selected validator quantity when an option is selected.
///
/// ### Notes:
///
/// - The `CustomExpandableWidget` is styled with padding, expanded color,
/// header color, and border highlight color from the app theme.
/// - The widget's behavior (expanded/collapsed)
/// is controlled using the `ExpandableStateCubit`.

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
