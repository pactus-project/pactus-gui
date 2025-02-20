import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_cubit.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/finish/presentation/screen/finish_page.dart';
import 'package:gui/src/features/initializing/presentation/screen/initializing_page.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:gui/src/features/master_password/presentation/screen/master_password_page.dart';
import 'package:gui/src/features/restoration_seed/presentation/screen/restoration_seed_page.dart';
import 'package:gui/src/features/validator_config/presentation/screen/validator_config_page.dart';

/// ## [RestoringNodePane] Class Documentation
///
/// The `RestoringNodePane` class manages the navigation for restoring a node.
/// It provides a step-by-step flow to restore a wallet and configure the node.
///
/// ### Navigation Steps:
///
/// - **[RestorationSeedPage]**: Restores the wallet using a seed phrase.
/// - **[MasterPasswordPage]**: Sets or verifies the master password.
/// - **[ValidatorConfigPage]**: Configures validator settings.
/// - **[InitializingPage]**: Initializes the restored node.
/// - **[FinishPage]**: Completes the restoration process.
///
/// ### Properties:
///
/// - **selectedIndex**:
///   - An `int` representing the current navigation index.
///   - Controlled by `NavigationPaneCubit`.
///
/// - **[onChanged(index)]**:
///   - Moves between steps sequentially.
///   - Ensures users follow the correct restoration flow.
///
/// ### Notes:
///
/// - Uses `LocaleKeys` for localization.
/// - Selected navigation items are visually highlighted with `AppColors`.
/// - The `FinishPage` is managed by a `DaemonCubit` to handle
/// node daemon operations.

class RestoringNodePane extends StatelessWidget {
  const RestoringNodePane({super.key});

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
                  context.tr(LocaleKeys.wallet_seed),
                  style: TextStyle(
                    color: selectedIndex == 0
                        ? AppColors.navigationPanelEnableColor
                        : AppColors.navigationPanelDisableColor,
                  ),
                ),
                body: RestorationSeedPage(),
              ),
              PaneItem(
                icon: const SizedBox(),
                title: Text(
                  context.tr(LocaleKeys.master_password),
                  style: TextStyle(
                    color: selectedIndex == 1
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
                    color: selectedIndex == 2
                        ? AppColors.navigationPanelEnableColor
                        : AppColors.navigationPanelDisableColor,
                  ),
                ),
                body: ValidatorConfigPage(),
              ),
              PaneItem(
                icon: const SizedBox(),
                title: Text(
                  context.tr(LocaleKeys.initializing),
                  style: TextStyle(
                    color: selectedIndex == 3
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
                    color: selectedIndex == 4
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
                  child: FinishPage(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
