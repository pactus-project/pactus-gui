import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/widgets/custom_expandable_widget.dart';
import 'package:gui/src/features/generation_seed/core/constants/enums/seed_type_enum.dart';
import 'package:gui/src/features/generation_seed/presentation/cubits/seed_type_cubit.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class SeedTypeSelectorWidget extends StatelessWidget {
  const SeedTypeSelectorWidget({
    required this.menuExpanded,
    required this.onToggle,
    super.key,
  });
  final bool menuExpanded;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeedTypeCubit, SeedTypeEnum>(
      builder: (context, state) {
        return CustomExpandableWidget(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 10,
            vertical: 7,
          ),
          headerStyle: InterTextStyles.captionMedium.copyWith(
            color: AppColors.expandableSeedTypeColor,
          ),
          width: 125,
          header: state.text,
          isExpanded: menuExpanded,
          onToggle: onToggle,
          body: Column(
            children: [
              GestureDetector(
                onTap: () {
                  context.read<SeedTypeCubit>().selectSeed(12);
                  onToggle();
                },
                child: Text(
                  SeedTypeEnum.twelve.text,
                  style: InterTextStyles.captionMedium.copyWith(
                    color: AppColors.expandableSeedTypeColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<SeedTypeCubit>().selectSeed(24);
                  onToggle();
                },
                child: Text(
                  SeedTypeEnum.twentyFour.text,
                  style: InterTextStyles.captionMedium.copyWith(
                    color: AppColors.expandableSeedTypeColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
