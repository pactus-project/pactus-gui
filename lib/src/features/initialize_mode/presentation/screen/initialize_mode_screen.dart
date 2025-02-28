import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/widgets/adaptive_filled_button.dart';
import 'package:gui/src/core/router/route_name.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/initialize_mode/presentation/sections/remote_node_section.dart';
import 'package:gui/src/features/initialize_mode/presentation/widgets/radio_button_group_widget.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:gui/src/features/main/radio_button_cubit/presentation/radio_button_cubit.dart';
import 'package:gui/src/features/validator_config/core/utils/methods/show_fluent_alert_method.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ## [InitializeModeScreen] Class Documentation
///
/// The `InitializeModeScreen` provides an interface for users to
/// initiate their node for the first time.
///
/// ### Properties:
///
/// - **Uses [BlocProvider]** to manage the state of `RadioButtonCubit`.
/// - **Uses [BlocBuilder]** to listen for state changes in
/// `NavigationPaneCubit` and `RadioButtonCubit`.
///
/// ### UI Components:
///
/// - **Header Section:**
///   - Displays the main title and a brief description.
///   - Localized using `context.tr(LocaleKeys.initiate_your_node)`.
///
/// - **Radio Button Group:**
///   - Uses `RadioButtonGroup` to allow users to select an initialization mode.
///   - When a selection changes, the `RadioButtonCubit` updates the state.
///
/// - **Remote Node Section:**
///   - Conditionally displayed when the selected radio button value is `2`.
///
/// - **Bottom Navigation Button:**
///   - Custom-styled `CustomFilledButton` for proceeding to the next step.
///   - Calls `setSelectedIndex` on `NavigationPaneCubit` to navigate forward.
///
/// ### Important Notes:
///
/// - Supports navigation using `NavigationPaneCubit`.
/// - Uses Fluent UI components for consistency with the application's theme.
/// - Ensures responsiveness with
/// `SingleChildScrollView` and `Positioned` elements.

/// to-do : Currently, no app bar has been designed for this page.
/// need to wait for the design team to redesign
/// the page before refactoring it again by Pouria
class InitializeModeScreen extends StatefulWidget {
  const InitializeModeScreen({super.key});

  @override
  State<InitializeModeScreen> createState() => _InitializeModeScreenState();
}

class _InitializeModeScreenState extends State<InitializeModeScreen> {
  final _remoteNodeSectionKey = GlobalKey<RemoteNodeSectionState>();

  void _handleNextPressed(int selectedValue) {
    // Validate all sections before proceeding
    switch (selectedValue) {
      case 0:
        context.goNamed(
          AppRoute.initializingLocalNodePane.name,
        );
      case 1:
        context.goNamed(
          AppRoute.restoringNodePane.name,
        );
      case 2:
        final isRemoteNodeValid =
            _remoteNodeSectionKey.currentState?.validate() ?? false;

        if (isRemoteNodeValid) {
          context.goNamed(
            AppRoute.connectingRemoteNodePane.name,
          );
        } else {
          showFluentAlert(
            context,
            context.tr(LocaleKeys.please_input_all_fields),
          );
        }
    }
  }

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
                            context.tr(
                              LocaleKeys.initiate_your_node_for_first_time,
                            ),
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
                                  context
                                      .read<RadioButtonCubit>()
                                      .changeValue(value);
                                },
                              );
                            },
                          ),
                          const Gap(30),
                          BlocBuilder<RadioButtonCubit, int>(
                            builder: (context, selectedValue) {
                              return selectedValue == 2
                                  ? RemoteNodeSection(
                                      key: _remoteNodeSectionKey,
                                    )
                                  : const SizedBox();
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
                    color:
                        AppTheme.of(context).extension<LightPallet>()!.light900,
                    padding: const EdgeInsets.only(right: 46),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: BlocBuilder<RadioButtonCubit, int>(
                        builder: (context, selectedValue) {
                          return AdaptiveFilledButton(
                            text: context.tr(LocaleKeys.next),
                            onPressed: () => _handleNextPressed(selectedValue),
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                AppColors.radioButtonActiveColor,
                              ),
                              padding: WidgetStatePropertyAll(
                                const EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                          );
                        },
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
