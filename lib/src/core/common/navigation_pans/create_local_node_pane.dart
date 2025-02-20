import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_cubit.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/confirmation_seed/presentation/screen/confirmation_seed_page.dart';
import 'package:gui/src/features/finish/presentation/screen/finish_page.dart';
import 'package:gui/src/features/generation_seed/presentation/screens/generation_seed_screen.dart';
import 'package:gui/src/features/initializing/presentation/screen/initializing_page.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:gui/src/features/master_password/presentation/screen/master_password_page.dart';
import 'package:gui/src/features/validator_config/presentation/screen/validator_config_page.dart';

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
                    color: selectedIndex == 0
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
                    color: selectedIndex == 1
                        ? AppColors.navigationPanelEnableColor
                        : AppColors.navigationPanelDisableColor,
                  ),
                ),
                body: ConfirmationSeedPage(),
              ),
              PaneItem(
                icon: const SizedBox(),
                title: Text(
                  context.tr(LocaleKeys.master_password),
                  style: TextStyle(
                    color: selectedIndex == 2
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
                    color: selectedIndex == 3
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
                    color: selectedIndex == 4
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
                    color: selectedIndex == 5
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
