import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/enums/app_enums.dart';
import 'package:gui/src/core/common/cubits/step_validation_cubit.dart';
import 'package:gui/src/core/constants/app_constants.dart';
import 'package:gui/src/core/extensions/context_extensions.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/generation_seed/core/constants/enums/seed_type_enum.dart';
import 'package:gui/src/features/generation_seed/presentation/cubits/seed_type_cubit.dart';
import 'package:gui/src/features/finish/presentation/screen/finish_screen.dart';
import 'package:gui/src/features/initializing/presentation/screen/initializing_screen.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:gui/src/features/master_password/presentation/screen/master_password_screen.dart';
import 'package:gui/src/features/restoration_seed/presentation/cubits/restoration_seed_cubit.dart';
import 'package:gui/src/features/restoration_seed/presentation/screen/restoration_seed_screen.dart';
import 'package:gui/src/features/validator_config/presentation/screen/validator_config_screen.dart';

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
            size: const NavigationPaneSize(openMaxWidth: 209),
            selected: selectedIndex,
            onChanged: (index) {
              final stepValidationCubit = context.read<StepValidationCubit>();
              final navigationCubit = context.read<NavigationPaneCubit>();

              // Allow moving forward only if the previous step is valid
              final canGoForward = index == selectedIndex + 1 &&
                  stepValidationCubit.isStepValid(selectedIndex);

              // Allow moving backward only if you're not at the last page
              final canGoBack = index == selectedIndex - 1 &&
                  selectedIndex < AppConstants.restoreNodeMaxIndex;

              // If you've reached the last page, you won't be able to go back
              if (selectedIndex == 4) {
                // If you've reached the last page, going backward
                // is not allowed
                if (index == selectedIndex - 1) {
                  return;
                }
              }

              // Otherwise, allow moving forward or backward only if valid
              if (canGoForward || canGoBack) {
                navigationCubit.setSelectedIndex(index);
              }
            },
            indicator: const SizedBox(),
            items: [
              PaneItem(
                icon: const SizedBox(),
                title: Text(
                  context.tr(LocaleKeys.restoration),
                  style: TextStyle(
                    color: context.detectPaneTextColor(
                      isEnabledTextStyle: selectedIndex == 0,
                    ),
                  ),
                ),
                body: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) =>
                          DropdownCubit<SeedTypeEnum>(SeedTypeEnum.twelve),
                    ),
                    BlocProvider(
                      create: (context) => SeedTextCubit(SeedTypeEnum.twelve),
                    ),
                  ],
                  child: RestorationSeedScreen(),
                ),
              ),
              PaneItem(
                icon: const SizedBox(),
                title: Text(
                  context.tr(LocaleKeys.master_password),
                  style: TextStyle(
                    color: context.detectPaneTextColor(
                      isEnabledTextStyle: selectedIndex == 1,
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
                      isEnabledTextStyle: selectedIndex == 2,
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
                      isEnabledTextStyle: selectedIndex == 3,
                    ),
                  ),
                ),
                body: InitializingScreen(
                  initialMode: InitialMode.restore,
                ),
              ),
              PaneItem(
                icon: const SizedBox(),
                title: Text(
                  context.tr(LocaleKeys.finish),
                  style: TextStyle(
                    color: context.detectPaneTextColor(
                      isEnabledTextStyle: selectedIndex == 4,
                    ),
                  ),
                ),
                body: FinishScreen(),
              ),
            ],
          ),
        );
      },
    );
  }
}
