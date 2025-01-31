import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/utils/daemon_manager/node_config_data.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';

class ValidatorConfigPage extends StatefulWidget {
  const ValidatorConfigPage({super.key});

  @override
  State<ValidatorConfigPage> createState() => _ValidatorConfigPageState();
}

class _ValidatorConfigPageState extends State<ValidatorConfigPage> {
  TextEditingController directoryController = TextEditingController();
  TextEditingController validatorQtyController = TextEditingController();
  String saveMessage = '';

  Future<void> _chooseDirectory() async {
    // Open native directory selector
    final directoryPath = await getDirectoryPath();

    if (directoryPath != null) {
      setState(() {
        directoryController.text = directoryPath; // Update text field
        saveMessage = ''; // Reset message
      });
    }
  }

  Future<bool> _isNotEmptyDirectory() async {
    final directory = Directory(directoryController.text);

    if (!directory.existsSync()) {
      try {
        await directory.create(recursive: true);
      } on Exception catch (_) {}
    }

    final directoryContents = directory.listSync();
    if (directoryContents.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPaneCubit, int>(
      builder: (context, selectedIndex) {
    return NavigationView(
      content: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Button(
                onPressed: _chooseDirectory,
                child: const Text('Choose Directory'),
              ),
              const SizedBox(height: 20),
              ExcludeSemantics(
                child: TextBox(
                  controller: directoryController,
                  placeholder: 'Selected Directory',
                  decoration: WidgetStateProperty.all(
                    BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ExcludeSemantics(
                child: TextBox(
                  maxLength: 2,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: validatorQtyController,
                  placeholder: 'Validator Qty',
                  decoration: WidgetStateProperty.all(
                    BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (selectedIndex > 0)
                    Button(
                      child: const Text('Previous'),
                      onPressed: () {
                        context.read<NavigationPaneCubit>()
                            .setSelectedIndex(selectedIndex - 1);
                      },
                    ),
                  const SizedBox(width: 20),
                  if (selectedIndex < 6)
                    Button(
                      child: const Text('Next'),
                      onPressed: () async {
                        final isNotEmptyDirectory =
                        await _isNotEmptyDirectory();
                        if (isNotEmptyDirectory) {
                          if (context.mounted) {
                            showFluentAlert(context);
                          }
                        } else {
                          NodeConfigData.instance.validatorQty =
                              validatorQtyController.text;
                          NodeConfigData.instance.workingDirectory =
                              directoryController.text;
                          if (context.mounted) {
                            context.read<NavigationPaneCubit>()
                                .setSelectedIndex(selectedIndex + 1);
                          }
                        }
                      },
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  },
);
  }
}

void showFluentAlert(BuildContext context) {
  displayInfoBar(
    context,
    builder: (context, close) {
      return InfoBar(
        title: Text(
          'Error',
          style: TextStyle(color: AppColors.primaryDark),
        ),
        content: Text(
          'Directory is not empty. need empty directory to continue',
          style: TextStyle(color: AppColors.primaryDark),
        ),
        action: Button(
          onPressed: close,
          child: const Text('OK'), // Close the InfoBar
        ),
        severity: InfoBarSeverity.error, // Makes it a warning message
      );
    },
  );
}
