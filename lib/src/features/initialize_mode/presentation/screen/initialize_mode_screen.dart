import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/initialize_mode/presentation/sections/remote_node_section.dart';
import 'package:gui/src/features/initialize_mode/presentation/widgets/radio_button_group_widget.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:gui/src/features/main/radio_button_cubit/presentation/radio_button_cubit.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class InitializeModeScreen extends StatelessWidget {
  const InitializeModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RadioButtonCubit(),
      child: BlocBuilder<NavigationPaneCubit, int>(
        builder: (context, selectedIndex) {
          return NavigationView(
            content: Stack(
              children: [
                Positioned.fill(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(46),
                          Text(
                            context.tr(LocaleKeys.initiate_your_node),
                            style: InterTextStyles.bodyBold.copyWith(
                              color: AppColors.primaryDark,
                            ),
                          ),
                          const Gap(8),
                          Text(
                            context.tr
                              (LocaleKeys.initiate_your_node_for_first_time),
                            style: InterTextStyles.smallRegular.copyWith(
                              color: AppColors.primaryGray,
                            ),
                          ),
                          const Gap(24),
                          BlocBuilder<RadioButtonCubit, int>(
                            builder: (context, selectedValue) {
                              return RadioButtonGroup(
                                selectedValue: selectedValue,
                                onChanged: (value) {
                                  context.read<RadioButtonCubit>()
                                      .changeValue(value);
                                },
                              );
                            },
                          ),
                          const Gap(30),
                          BlocBuilder<RadioButtonCubit, int>(
                            builder: (context, selectedValue) {
                              return selectedValue == 2 ? RemoteNodeSection() :
                              const SizedBox();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 89,
                    color: AppTheme.of(context)
                        .extension<SurfacePallet>()!
                        .surface3,
                    padding: const EdgeInsets.only(right: 46),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 32,
                        child: Button(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              AppColors.radioButtonActiveColor,
                            ),
                            padding: WidgetStatePropertyAll(
                              const EdgeInsets.symmetric(horizontal: 16),
                            ),
                          ),
                          onPressed: () {
                            context.read<NavigationPaneCubit>()
                                .setSelectedIndex(selectedIndex + 1);
                          },
                          child: Text(
                            'Next',
                            style: InterTextStyles.bodyBold.copyWith(
                              color: AppTheme.of(context)
                                  .extension<SurfacePallet>()!
                                  .surface3,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

