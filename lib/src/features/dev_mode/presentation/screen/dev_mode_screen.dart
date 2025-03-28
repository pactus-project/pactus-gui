import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/enums/app_environment.dart';
import 'package:gui/src/core/utils/daemon_manager/seed_generator.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class DeveloperModeScreen extends StatefulWidget {
  const DeveloperModeScreen({super.key});

  @override
  State<DeveloperModeScreen> createState() => _DeveloperModeScreenState();
}

class _DeveloperModeScreenState extends State<DeveloperModeScreen> {
  int? selectedOption;
  String password = '';
  String generatedSeed = '';
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: AppTheme.of(context).extension<DarkPallet>()!.dark900,
    );

    return ScaffoldPage(
      header: PageHeader(
        title: Text(
          'Setting Pactus GUI Network',
          style: textStyle,
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 3 Radio Buttons in a column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RadioButton(
                  checked: selectedOption == 1,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = 1;
                    });
                  },
                  content: Text(
                    AppEnvironment.mainnet.name,
                    style: textStyle,
                  ),
                ),
                const SizedBox(height: 8),
                RadioButton(
                  checked: selectedOption == 2,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = 2;
                    });
                  },
                  content: Text(
                    AppEnvironment.testnet.name,
                    style: textStyle,
                  ),
                ),
                const SizedBox(height: 8),
                RadioButton(
                  checked: selectedOption == 3,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = 3;
                    });
                  },
                  content: Text(
                    AppEnvironment.localnet.name,
                    style: textStyle,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Row with text, textbox, and generate button
            Row(
              children: [
                Text(
                  'Generate seed',
                  style: textStyle,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ExcludeSemantics(
                    child: TextBox(
                      placeholder: 'Seed will appear here',
                      readOnly: true,
                      controller: TextEditingController(text: generatedSeed),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                FilledButton(
                  child: Text(
                    'Generate',
                    style: TextStyle(
                      color: AppTheme.of(context)
                          .extension<OnAccentPallet>()!
                          .onAccentColor,
                    ),
                  ),
                  onPressed: () {
                    final generateSeed =
                        SeedGenerator().generateSeed(12)!.sentence;
                    setState(() {
                      generatedSeed = generateSeed;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Password text box
            Text(
              'Password',
              style: textStyle,
            ),
            const SizedBox(height: 8),
            ExcludeSemantics(
              child: PasswordBox(
                placeholder: 'Enter your password',
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 24),

            // Submit button
            Spacer(),
            Center(
              child: SizedBox(
                width: 196,
                child: FilledButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    _showResults(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showResults(BuildContext context) {
    final textStyle = TextStyle(
      color: AppTheme.of(context).extension<DarkPallet>()!.dark900,
    );

    var selected = 'No option selected';
    if (selectedOption == 1) {
      selected = AppEnvironment.mainnet.name;
    }
    if (selectedOption == 2) {
      selected = AppEnvironment.testnet.name;
    }
    if (selectedOption == 3) {
      selected = AppEnvironment.localnet.name;
    }
    bool? isValidateForm = false;
    if (selectedOption != null &&
        password.isNotEmpty &&
        generatedSeed.isNotEmpty) {
      isValidateForm = true;
    }

    if (isValidateForm) {
      showDialog(
        context: context,
        builder: (context) => ContentDialog(
          style: ContentDialogThemeData(
            titleStyle: textStyle,
            bodyStyle: textStyle,
          ),
          title: const Text('Results'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(selected),
              const SizedBox(height: 8),
              Text('Password: $password'),
              const SizedBox(height: 8),
              if (generatedSeed.isNotEmpty)
                Text('Generated Seed: $generatedSeed'),
            ],
          ),
          actions: [
            FilledButton(
              child: Text(
                'Create Node',
                style: TextStyle(
                  color: AppTheme.of(context)
                      .extension<OnAccentPallet>()!
                      .onAccentColor,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            FilledButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  // If the button is pressed, return green, otherwise blue
                  if (states.isHovered) {
                    return AppTheme.of(context).extension<RedPallet>()!.red500;
                  }
                  return AppTheme.of(context).extension<RedPallet>()!.red600;
                }),
              ),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color:
                      AppTheme.of(context).extension<LightPallet>()!.light900,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => ContentDialog(
          style: ContentDialogThemeData(
            titleStyle: textStyle,
            bodyStyle: textStyle,
          ),
          title: const Text('Incomplete Form'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Please complete the form.'),
            ],
          ),
          actions: [
            Button(
              child: const Text('Ok'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }
}
