import 'package:file_selector/file_selector.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/cubits/step_validation_cubit.dart';
import 'package:gui/src/core/common/sections/navigation_footer_section.dart';
import 'package:gui/src/core/common/widgets/custom_filled_button.dart';
import 'package:gui/src/core/common/widgets/standard_page_layout.dart';
import 'package:gui/src/core/constants/storage_keys.dart';
import 'package:gui/src/core/enums/app_enums.dart';
import 'package:gui/src/core/utils/daemon_manager/node_config_data.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/core/utils/storage_utils.dart';
import 'package:gui/src/features/generation_seed/presentation/cubits/seed_type_cubit.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:gui/src/features/validator_config/core/utils/methods/is_not_empty_directory_method.dart';
import 'package:gui/src/features/validator_config/core/utils/methods/show_fluent_alert_method.dart';
import 'package:gui/src/features/validator_config/presentation/sections/validator_config_title_section.dart';
import 'package:gui/src/features/validator_config/presentation/sections/validator_qty_selector_section.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// ## [ValidatorConfigScreen] Class Documentation
///
/// The `ValidatorConfigScreen` class represents the screen where the user
/// configures the validator settings.
/// It provides functionality to choose a working directory and select the
/// validator quantity, with various interactions for navigation.
///
/// ### Usage:
///
/// This screen allows the user to:
/// - Select a working directory via the "Select Folder" button.
/// - Choose the validator quantity from a predefined set of options.
/// - Navigate between sections using the navigation pane.
///
/// ### Methods:
///
/// - **[_chooseDirectory()]**:
///   - Opens a directory picker dialog to allow the user to select a directory.
///   - If a directory is selected, it updates the `directoryController` with
///   the selected path.
///
/// ### Notes:
///
/// - The screen uses a `BlocBuilder` to manage state and respond to changes
/// in the selected index of the navigation pane.
/// - The `NavigationFooterSection` is used for navigation and includes logic
/// for the "Next" and "Back" buttons.
///
/// to-do #81: correct colors after identifying in Figma design by Pouria
class ValidatorConfigScreen extends StatefulWidget {
  const ValidatorConfigScreen({super.key});

  @override
  State<ValidatorConfigScreen> createState() => _ValidatorConfigScreenState();
}

class _ValidatorConfigScreenState extends State<ValidatorConfigScreen> {
  TextEditingController directoryController = TextEditingController();
  bool isDirectoryValid = false;

  @override
  void dispose() {
    super.dispose();
    directoryController.dispose();
  }

  Future<void> _chooseDirectory() async {
    final directoryPath = await getDirectoryPath();
    if (directoryPath != null) {
      setState(() {
        directoryController.text = directoryPath;
        isDirectoryValid = directoryController.text.isNotEmpty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DropdownCubit<ValidatorQty>(ValidatorQty.seven),
      child: BlocBuilder<NavigationPaneCubit, int>(
        builder: (context, selectedIndex) {
          isDirectoryValid = directoryController.text.isNotEmpty;
          context.read<StepValidationCubit>().setStepValid(
                stepIndex: context.read<NavigationPaneCubit>().state,
                isValid: isDirectoryValid,
              );
          return StandardPageLayout(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValidatorConfigTitleSection(),
                const Gap(28),
                Text(
                  context.tr(LocaleKeys.working_directory),
                  style: InterTextStyles.captionMedium.copyWith(
                    color: AppColors.primaryGray,
                  ),
                ),
                const Gap(8),
                Row(
                  children: [
                    Expanded(
                      child: ExcludeSemantics(
                        child: TextBox(
                          controller: directoryController,
                          placeholder: context.tr(
                            LocaleKeys.choose_your_directory,
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              isDirectoryValid = newValue.isNotEmpty;
                            });
                          },
                          decoration: WidgetStateProperty.all(
                            BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Gap(28),
                    CustomFilledButton(
                      text: context.tr(LocaleKeys.select_folder),
                      onPressed: _chooseDirectory,
                      style: ButtonStyle(
                        padding:
                            WidgetStateProperty.all<EdgeInsetsDirectional?>(
                          const EdgeInsetsDirectional.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                        ),
                        backgroundColor: WidgetStateProperty.all<Color?>(
                          FluentTheme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(28),
                ValidatorQtySelectorSection(),
              ],
            ),
            footer: NavigationFooterSection(
              selectedIndex: selectedIndex,
              onNextPressed: isDirectoryValid
                  ? () async {
                      final isDirectoryNotEmpty = await isNotEmptyDirectory(
                        text: directoryController.text,
                      );

                      // Check if context is still mounted before proceeding
                      if (!context.mounted) {
                        return;
                      }

                      // save `nodeDirectory` in `shared preferences` .
                      // used for run cli commands in splash screen .
                      StorageUtils.saveData(
                        StorageKeys.nodeDirectory,
                        directoryController.text,
                      );

                      if (isDirectoryNotEmpty) {
                        showFluentAlert(
                          context,
                          context.tr(LocaleKeys.directory_not_empty),
                        );
                      } else {
                        final selectedQty =
                            context.read<DropdownCubit<ValidatorQty>>().state;

                        NodeConfigData.instance.validatorQty =
                            '${selectedQty.qty}';

                        NodeConfigData.instance.workingDirectory =
                            directoryController.text;

                        context
                            .read<NavigationPaneCubit>()
                            .setSelectedIndex(selectedIndex + 1);
                      }
                    }
                  : null,
              onBackPressed: () {
                context
                    .read<NavigationPaneCubit>()
                    .setSelectedIndex(selectedIndex - 1);
              },
            ),
          );
        },
      ),
    );
  }
}
