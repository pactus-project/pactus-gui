import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/common/cubits/step_validation_cubit.dart';
import 'package:pactus_gui/src/core/common/sections/navigation_footer_section.dart';
import 'package:pactus_gui/src/core/common/widgets/standard_page_layout.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/node_config_data.dart';
import 'package:pactus_gui/src/data/models/fluent_navigation_state_model.dart';
import 'package:pactus_gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:pactus_gui/src/features/master_password/presentation/sections/master_password_section.dart';
import 'package:pactus_gui/src/features/validator_config/core/utils/methods/show_fluent_alert_method.dart';

/// ## [MasterPasswordScreen] Class Documentation
///
/// The `MasterPasswordScreen` class represents a screens where users ca set a
/// master password.
/// It includes input fields for entering and confirming the password along
/// with navigation controls.
///
/// ### Properties:
///
/// - **passwordController** (TextEditingController):
///   - Controls the input field for the master password.
///
/// - **confirmPasswordController** (TextEditingController):
///   - Controls the input field for confirming the master password.
///
/// ### Methods:
///
/// - **[dispose()]**:
///   - Disposes of the text controllers to free up resources.
///
/// - **[build(BuildContext context)]**:
///   - Builds the UI of the screens, which includes:
///     - A `MasterPasswordSection` for password input.
///     - A `NavigationFooterSection` with back, next, and skip buttons.
///
class MasterPasswordScreen extends StatefulWidget {
  const MasterPasswordScreen({super.key});

  @override
  State<MasterPasswordScreen> createState() => _MasterPasswordScreenState();
}

class _MasterPasswordScreenState extends State<MasterPasswordScreen> {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPaneCubit, NavigationState>(
      builder: (context, selectedIndex) {
        context.read<StepValidationCubit>().setStepValid(
              stepIndex: selectedIndex.selectedIndex,
              isValid: true,
            );
        return StandardPageLayout(
          content: MasterPasswordSection(
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
          ),
          footer: NavigationFooterSection(
            selectedIndex: selectedIndex.selectedIndex,
            showSkipButton: true,
            onSkipPressed: () {
              NodeConfigData.instance.password = '';
              context
                  .read<NavigationPaneCubit>()
                  .setSelectedIndex(selectedIndex.selectedIndex + 1);
            },
            onNextPressed: () {
              if (passwordController.text == confirmPasswordController.text) {
                NodeConfigData.instance.password = passwordController.text;
                context
                    .read<NavigationPaneCubit>()
                    .setSelectedIndex(selectedIndex.selectedIndex + 1);
              } else {
                showFluentAlert(
                  context,
                  'Passwords do not match !',
                );
              }
            },
            onBackPressed: () {
              context
                  .read<NavigationPaneCubit>()
                  .setSelectedIndex(selectedIndex.selectedIndex - 1);
            },
          ),
        );
      },
    );
  }
}
