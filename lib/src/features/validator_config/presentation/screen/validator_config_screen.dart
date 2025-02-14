import 'package:file_selector/file_selector.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/sections/navigation_footer_section.dart';
import 'package:gui/src/core/common/widgets/custom_filled_button.dart';
import 'package:gui/src/core/utils/daemon_manager/node_config_data.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:gui/src/features/validator_config/core/utils/methods/is_not_empty_directory_method.dart';
import 'package:gui/src/features/validator_config/core/utils/methods/show_fluent_alert_method.dart';
import 'package:gui/src/features/validator_config/presentation/cubits/validator_qty_cubit.dart';
import 'package:gui/src/features/validator_config/presentation/sections/validator_config_title_section.dart';
import 'package:gui/src/features/validator_config/presentation/sections/validator_qty_selector_section.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

/// todo #81: correct colors after identifying in Figma design by Pouria
class ValidatorConfigScreen extends StatefulWidget {
  const ValidatorConfigScreen({super.key});

  @override
  State<ValidatorConfigScreen> createState() => _ValidatorConfigScreenState();
}

class _ValidatorConfigScreenState extends State<ValidatorConfigScreen> {
  TextEditingController directoryController = TextEditingController();

  Future<void> _chooseDirectory() async {
    final directoryPath = await getDirectoryPath();
    if (directoryPath != null) {
      setState(() {
        directoryController.text = directoryPath;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPaneCubit, int>(
        builder: (context, selectedIndex) {
      return NavigationView(
        content: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ValidatorConfigTitleSection(),
                        const Gap(28),
                        ///todo #81: work on improve Working Directory
                        /// section by Pouria
                        Text(
                          'Working Directory',
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
                                  placeholder: 'choose your directory...',
                                  decoration: WidgetStateProperty.all(
                                    BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Gap(36),
                            CustomFilledButton(
                              text: 'Select Folder',
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              onPressed: _chooseDirectory,
                            ),
                          ],
                        ),
                        const Gap(28),
                        ValidatorQtySelectorSection(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: NavigationFooterSection(
                selectedIndex: selectedIndex,
                onNextPressed: () async {
                  final x =
                      await isNotEmptyDirectory(text: directoryController.text);
                  if (x) {
                    if (context.mounted) {
                      showFluentAlert(context);
                    }
                  } else {
                    final selectedQty = context.read<ValidatorQtyCubit>().state;
                    NodeConfigData.instance.validatorQty = selectedQty;
                    NodeConfigData.instance.workingDirectory =
                        directoryController.text;
                    if (context.mounted) {
                      context
                          .read<NavigationPaneCubit>()
                          .setSelectedIndex(selectedIndex + 1);
                    }
                  }
                },
                onBackPressed: () {
                  context
                      .read<NavigationPaneCubit>()
                      .setSelectedIndex(selectedIndex - 1);
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
