import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/cubits/step_validation_cubit.dart';
import 'package:gui/src/core/common/widgets/app_layout.dart';
import 'package:gui/src/core/constants/app_constants.dart';
import 'package:gui/src/core/enums/app_enums.dart';
import 'package:gui/src/core/extensions/context_extensions.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/data/models/fluent_navigation_state_model.dart';
import 'package:gui/src/features/finish/presentation/screen/finish_screen.dart';
import 'package:gui/src/features/initializing/presentation/screen/initializing_screen.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';

class RemoteNodePane extends StatelessWidget {
  const RemoteNodePane({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPaneCubit, NavigationState>(
      builder: (context, selectedIndex) {
        return AppLayout(
          content: NavigationView(
            pane: NavigationPane(
              displayMode: PaneDisplayMode.open,
              menuButton: const SizedBox(),
              size:
                  const NavigationPaneSize(openMaxWidth: 209, compactWidth: 52),
              selected: selectedIndex.selectedIndex,
              onChanged: (index) {
                final stepValidationCubit = context.read<StepValidationCubit>();
                final navigationCubit = context.read<NavigationPaneCubit>();

                // Allow moving forward only if the previous step is valid
                final canGoForward = index == selectedIndex.selectedIndex + 1 &&
                    stepValidationCubit
                        .isStepValid(selectedIndex.selectedIndex);

                // Allow moving backward only if you're not at the first page
                final canGoBack = index == selectedIndex.selectedIndex - 1 &&
                    selectedIndex.selectedIndex <
                        AppConstants.remoteNodeMaxIndex;

                // If you've reached the first page,you won't be able to go back
                if (selectedIndex.selectedIndex == 1) {
                  // If you've reached the first page,
                  // going backward is not allowed
                  if (index == selectedIndex.selectedIndex - 1) {
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
                    context.tr(LocaleKeys.initializing),
                    style: TextStyle(
                      color: context.detectPaneTextColor(
                        isEnabledTextStyle: selectedIndex.selectedIndex == 0,
                      ),
                    ),
                  ),
                  body: InitializingScreen(
                    initialMode: InitialMode.remote,
                  ),
                ),
                PaneItem(
                  icon: const SizedBox(),
                  title: Text(
                    context.tr(LocaleKeys.finish),
                    style: TextStyle(
                      color: context.detectPaneTextColor(
                        isEnabledTextStyle: selectedIndex.selectedIndex == 1,
                      ),
                    ),
                  ),
                  body: FinishScreen(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
