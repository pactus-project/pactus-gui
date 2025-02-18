import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/cubits/expandable_states_cubit.dart';
import 'package:gui/src/core/common/widgets/custom_expandable_widget.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class AuthMethodComponent extends StatelessWidget {
  const AuthMethodComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 33,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.auth_method,
          style: InterTextStyles.captionMedium.copyWith(
            color: AppColors.primaryGray,
          ),
        ),
        BlocBuilder<ExpandableStateCubit, bool>(
          builder: (context, isExpanded) {
            return CustomExpandableWidget(
              header: LocaleKeys.basic_auth,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Item 1',
                    style: InterTextStyles.captionMedium.copyWith(
                      color: AppColors.primaryGray,
                    ),
                  ),
                  Text(
                    'Item 2',
                    style: InterTextStyles.captionMedium.copyWith(
                      color: AppColors.primaryGray,
                    ),
                  ),
                ],
              ),
              headerColor:
              AppTheme.of(context).extension<LightPallet>()!.light900,
              expandedColor:
              AppTheme.of(context).extension<LightPallet>()!.light900,
              padding: EdgeInsets.all(8),
              animationDuration: 400,
              width: 125,
              maxHeight: 200,
              isExpanded: isExpanded,
              onTap: (){
                context.read<ExpandableStateCubit>().toggleExpanded();
              },
            );
          },
        ),
      ],
    );
  }
}
