import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_cubit.dart';
import 'package:gui/src/core/utils/daemon_manager/node_config_data.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/confirmation_seed/presentation/bloc/confirmation_seed_cubit.dart';
import 'package:gui/src/features/confirmation_seed/presentation/screen/confirmation_seed_page.dart';
import 'package:gui/src/features/finish/presentation/screen/finish_page.dart';
import 'package:gui/src/features/generation_seed/presentation/screens/generation_seed_screen.dart';
import 'package:gui/src/features/initialize_mode/presentation/screen/initialize_mode_screen.dart';
import 'package:gui/src/features/initializing/presentation/screen/initializing_page.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:gui/src/features/master_password/presentation/screen/master_password_page.dart';
import 'package:gui/src/features/validator_config/presentation/cubits/validator_qty_cubit.dart';
import 'package:gui/src/features/validator_config/presentation/screen/validator_config_screen.dart';

/// ## [InitializingNavigationPane] Class Documentation
///
/// The `InitializingNavigationPane` class represents a navigation pane for
/// managing the initialization process of the application.
/// It uses `NavigationView` and `NavigationPane` to organize different setup
/// steps.
///
/// ### Properties:
///
/// - **selectedIndex** (`int`)
///   - Manages the currently selected navigation index.
///   - Controlled by `NavigationPaneCubit`.
///
/// - **pane** (`NavigationPane`)
///   - Contains navigation items for different initialization steps.
///   - Ensures step-by-step progression by limiting selection jumps.
///
/// - **items** (`List<PaneItem>`)
///   - Defines individual navigation steps, each associated
///   with a corresponding screen.
///   - Includes screens like `InitializeModeScreen`,
///   `RestorationSeedPage`, `ConfirmationSeedPage`, etc.
///
/// ### Constructor:
///
/// - `InitializingNavigationPane({super.key})`
///   - Initializes the navigation pane as a `StatelessWidget`.
///   - Uses `BlocBuilder` to track and update the selected index dynamically.
///
/// ### Important Notes:
///
/// - Implements `NavigationPaneSize` for UI consistency.
/// - Uses `MultiBlocProvider` to inject dependencies in the final step.
/// - Prevents skipping steps by allowing only sequential navigation.

class InitializingNavigationPane extends StatelessWidget {
  const InitializingNavigationPane({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPaneCubit, int>(
      builder: (context, selectedIndex) {
        return NavigationView(
          pane: NavigationPane(
            displayMode: PaneDisplayMode.open,
            menuButton: const SizedBox(),
            size: const NavigationPaneSize(
              openMaxWidth: 209,
            ),
            selected: selectedIndex,
            onChanged: (index) {
              if (index == selectedIndex + 1 || index == selectedIndex - 1) {
                context.read<NavigationPaneCubit>().setSelectedIndex(index);
              }
            },
            indicator: const SizedBox(),
            items: [
              PaneItem(
                icon: const SizedBox(),
                title: Text(
                  context.tr(LocaleKeys.initialize_mode),
                  style: TextStyle(
                    color: selectedIndex == 0
                        ? AppColors.navigationPanelEnableColor
                        : AppColors.navigationPanelDisableColor,
                  ),
                ),
                body: InitializeModeScreen(),
              ),
              PaneItem(
                icon: const SizedBox(),
                title: Text(
                  context.tr(LocaleKeys.wallet_seed),
                  style: TextStyle(
                    color: selectedIndex == 1
                        ? AppColors.navigationPanelEnableColor
                        : AppColors.navigationPanelDisableColor,
                  ),
                ),
                body: GenerationSeedScreen(),
              ),
              PaneItem(
                icon: const SizedBox(),
                title: Text(
                  context.tr(LocaleKeys.confirm_seed),
                  style: TextStyle(
                    color: selectedIndex == 2
                        ? AppColors.navigationPanelEnableColor
                        : AppColors.navigationPanelDisableColor,
                  ),
                ),
                body: Builder(
                  builder: (context) {
                    return BlocProvider(
                      create: (_) => ConfirmationSeedCubit(
                        NodeConfigData.instance.restorationSeed!.words,
                      ),
                      child: ConfirmationSeedPage(),
                    );
                  },
                ),
              ),
              PaneItem(
                icon: const SizedBox(),
                title: Text(
                  context.tr(LocaleKeys.master_password),
                  style: TextStyle(
                    color: selectedIndex == 3
                        ? AppColors.navigationPanelEnableColor
                        : AppColors.navigationPanelDisableColor,
                  ),
                ),
                body: MasterPasswordPage(),
              ),
              PaneItem(
                icon: const SizedBox(),
                title: Text(
                  context.tr(LocaleKeys.validator_config),
                  style: TextStyle(
                    color: selectedIndex == 4
                        ? AppColors.navigationPanelEnableColor
                        : AppColors.navigationPanelDisableColor,
                  ),
                ),
                body: BlocProvider(
                  create: (context) => ValidatorQtyCubit(),
                  child: ValidatorConfigScreen(),
                ),
              ),
              PaneItem(
                icon: const SizedBox(),
                title: Text(
                  context.tr(LocaleKeys.initializing),
                  style: TextStyle(
                    color: selectedIndex == 5
                        ? AppColors.navigationPanelEnableColor
                        : AppColors.navigationPanelDisableColor,
                  ),
                ),
                body: InitializingPage(),
              ),
              PaneItem(
                icon: const SizedBox(),
                title: Text(
                  context.tr(LocaleKeys.finish),
                  style: TextStyle(
                    color: selectedIndex == 6
                        ? AppColors.navigationPanelEnableColor
                        : AppColors.navigationPanelDisableColor,
                  ),
                ),
                body: MultiBlocProvider(
                  providers: [
                    BlocProvider<DaemonCubit>(
                      create: (_) => DaemonCubit(),
                    ),
                  ],
                  child: const FinishPage(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
