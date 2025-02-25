import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/widgets/custom_expandable_widget.dart';
import 'package:gui/src/features/generation_seed/core/constants/enums/seed_type_enum.dart';
import 'package:gui/src/features/generation_seed/presentation/cubits/seed_type_cubit.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ## [SeedTypeSelectorWidget] Class Documentation
///
/// The `SeedTypeSelectorWidget` class is a widget that allows users to select
/// the type of seed (12 words or 24 words) by expanding a menu and tapping
/// the respective option. It uses a `BlocBuilder` to listen for state changes
/// in `SeedTypeCubit` and display the current selection.
///
/// ### Properties:
///
/// - **[menuExpanded]** (`bool`):
///   - A flag indicating whether the menu is expanded or not.
///
/// - **[onToggle]** (`VoidCallback`):
///   - A callback function that is triggered when the menu is toggled.
///
/// ### Methods:
///
/// - **[build]**:
///   - Builds the widget UI. It shows the current selected seed type and
///     expands a menu to select between 12 words or 24 words.
///
/// ### Notes:
///
/// - The widget listens to the `SeedTypeCubit` to get the current seed type
///   and uses `CustomExpandableWidget` for the expandable menu.
/// - When a user selects a seed type (12 or 24 words), the corresponding
///   action is dispatched to `See

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
          onTap: onToggle,
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
