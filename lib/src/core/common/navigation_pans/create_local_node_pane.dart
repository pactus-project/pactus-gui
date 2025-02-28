import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/extensions/context_extensions.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/confirmation_seed/presentation/screen/confirmation_seed_page.dart';
import 'package:gui/src/features/finish/presentation/screen/finish_page.dart';
import 'package:gui/src/features/generation_seed/presentation/screens/generation_seed_screen.dart';
import 'package:gui/src/features/initializing/presentation/screen/initializing_page.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:gui/src/features/master_password/presentation/screen/master_password_screen.dart';
import 'package:gui/src/features/validator_config/presentation/screen/validator_config_screen.dart';

/// ## [CreateLocalNodePane] Class Documentation
///
/// The `CreateLocalNodePane` class represents the navigation panel for
/// the local node creation process.
/// It provides a structured flow for setting up a local node by navigating
/// through different configuration steps.
///
/// ### Usage:
///
/// This navigation pane consists of multiple steps, each represented by
/// a `PaneItem`, including:
/// - **[GenerationSeedScreen]**: Displays the wallet seed generation process.
/// - **[ConfirmationSeedPage]**: Allows the user to confirm the generated seed.
/// - **[MasterPasswordScreen]**: Provides an interface for setting a master
/// password.
/// - **[ValidatorConfigScreen]**: Configures validator-related settings.
/// - **[InitializingScreen]**: Handles the node initialization process.
/// - **[FinishPage]**: Concludes the setup process, including daemon
/// management.
///
/// ### Properties:
///
/// - **selectedIndex**:
///   - An `int` representing the currently selected navigation index.
///   - Managed by the `NavigationPaneCubit`.
///
/// - **[onChanged(index)]**:
///   - Updates the selected index when the user navigates forward or backward.
///   - Ensures only adjacent steps can be selected to maintain a
///   linear setup flow.
///
/// ### Notes:
///
/// - Each navigation item (`PaneItem`) uses localized text from `LocaleKeys`.
/// - Selected items are visually distinguished using colors from `AppColors`.
/// - The `FinishPage` is wrapped in a `MultiBlocProvider` to initialize a
/// `DaemonCubit` for managing the node daemon.
///
class CreateLocalNodePane extends StatelessWidget {
  const CreateLocalNodePane({super.key});

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
                    color: context.detectPaneTextColor(
                      isEnabledTextStyle: selectedIndex == 0,
                    ),
                  ),
                ),
                body: GenerationSeedScreen(),
              ),
              PaneItem(
                icon: const SizedBox(),
                title: Text(
                  context.tr(LocaleKeys.confirm_seed),
                  style: TextStyle(
                    color: context.detectPaneTextColor(
                      isEnabledTextStyle: selectedIndex == 1,
                    ),
                  ),
                ),
                body: ConfirmationSeedPage(),
              ),
              PaneItem(
                icon: const SizedBox(),
                title: Text(
                  context.tr(LocaleKeys.master_password),
                  style: TextStyle(
                    color: context.detectPaneTextColor(
                      isEnabledTextStyle: selectedIndex == 2,
                    ),
                  ),
                ),
                body: MasterPasswordScreen(),
              ),
              PaneItem(
                icon: const SizedBox(),
                title: Text(
                  context.tr(LocaleKeys.validator_config),
                  style: TextStyle(
                    color: context.detectPaneTextColor(
                      isEnabledTextStyle: selectedIndex == 3,
                    ),
                  ),
                ),
                body: ValidatorConfigScreen(),
              ),
              PaneItem(
                icon: const SizedBox(),
                title: Text(
                  context.tr(LocaleKeys.initializing),
                  style: TextStyle(
                    color: context.detectPaneTextColor(
                      isEnabledTextStyle: selectedIndex == 4,
                    ),
                  ),
                ),
                body: InitializingScreen(),
              ),
              PaneItem(
                icon: const SizedBox(),
                title: Text(
                  context.tr(LocaleKeys.finish),
                  style: TextStyle(
                    color: context.detectPaneTextColor(
                      isEnabledTextStyle: selectedIndex == 5,
                    ),
                  ),
                ),
                body: FinishPage(),
              ),
            ],
          ),
        );
      },
    );
  }
}
