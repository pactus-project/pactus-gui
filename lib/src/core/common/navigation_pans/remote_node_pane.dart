import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_cubit.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/finish/presentation/screen/finish_page.dart';
import 'package:gui/src/features/initializing/presentation/screen/initializing_page.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';

/// ## [RemoteNodePane] Class Documentation
///
/// The `RemoteNodePane` class provides a navigation panel for setting up
/// a remote node.
/// It consists of two key steps: initialization and finalization.
///
/// ### Usage:
///
/// This navigation pane contains the following steps:
/// - **[InitializingPage]**: Handles the remote node initialization process.
/// - **[FinishPage]**: Completes the setup and manages the node daemon.
///
/// ### Properties:
///
/// - **selectedIndex**:
///   - An `int` representing the currently selected navigation index.
///   - Managed by the `NavigationPaneCubit`.
///
/// - **[onChanged(index)]**:
///   - Updates the selected index when navigating between steps.
///   - Ensures a linear transition between setup steps.
///
/// ### Notes:
///
/// - Navigation labels are localized using `LocaleKeys`.
/// - Selected items use colors from `AppColors` for visual distinction.
/// - The `FinishPage` is wrapped in a `MultiBlocProvider` to initialize a
/// `DaemonCubit` for daemon management.

class RemoteNodePane extends StatelessWidget {
  const RemoteNodePane({super.key});

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
                  context.tr(LocaleKeys.initializing),
                  style: TextStyle(
                    color: selectedIndex == 0
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
                    color: selectedIndex == 1
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
