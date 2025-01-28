import 'dart:io';
import 'package:file_selector/file_selector.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/router/route_name.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class ValidatorConfigPage extends StatefulWidget {
  const ValidatorConfigPage({super.key});

  @override
  State<ValidatorConfigPage> createState() => _ValidatorConfigPageState();
}

class _ValidatorConfigPageState extends State<ValidatorConfigPage> {
  TextEditingController directoryController = TextEditingController();
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

  Future<void> _saveFile() async {
    final path = directoryController.text;

    if (path.isEmpty) {
      setState(() {
        saveMessage = 'Please enter or select a directory!';
      });
      return;
    }

    final directory = Directory(path);

    // Check if the directory exists; if not, create it
    if (!directory.existsSync()) {
      try {
        await directory.create(recursive: true);
      } on Exception catch (e) {
        setState(() {
          saveMessage = 'Failed to create directory: $e';
        });
        return;
      }
    }

    // Check if the directory is empty
    final directoryContents = directory.listSync();
    if (directoryContents.isNotEmpty) {
      setState(() {
        saveMessage =
            'The directory is not empty. Please select an empty folder.';
      });
      return;
    }

    // Create and write the file
    final file = File('${directory.path}/example.txt');

    try {
      await file.writeAsString('This is an example file created in $path.');
      setState(() {
        saveMessage = 'File successfully saved at: ${file.path}';
      });
    } on Exception catch (e) {
      setState(() {
        saveMessage = 'Failed to save file: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        title: Text(
          'Validator Config Page',
          style: FluentTheme.of(context).typography.body!.copyWith(
                color: AppTheme.of(context)
                    .extension<OnSurfacePallet>()!
                    .onSurface4,
              ),
        ),
      ),
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
              Button(
                onPressed: _saveFile,
                child: const Text('Save File in Directory'),
              ),
              const SizedBox(height: 20),
              Text(
                saveMessage,
                style: TextStyle(
                  color: saveMessage.contains('successfully')
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Center(
                child: Button(
                  onPressed: () {
                    context.goNamed(AppRoute.initializing.name);
                  },
                  child: Text('Navigate to ${AppRoute.initializing.name}'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
