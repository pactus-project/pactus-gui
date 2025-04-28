import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/constants/cli_constants.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/cli_command.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/daemon_manager_bloc.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/features/dev_mode/core/utils/create_node_dialog.dart';
import 'package:pactus_gui/src/features/dev_mode/presentation/bloc/directory_check_bloc.dart';
import 'package:pactus_gui/src/features/dev_mode/presentation/bloc/environment_selection_cubit.dart';
import 'package:pactus_gui/src/features/dev_mode/presentation/bloc/environment_selection_state.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';

class SubmitButtonWidget extends StatefulWidget {
  const SubmitButtonWidget({
    super.key,
  });

  @override
  State<SubmitButtonWidget> createState() => _SubmitButtonWidgetState();
}

class _SubmitButtonWidgetState extends State<SubmitButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 196,
      child: BlocBuilder<EnvironmentSelectionCubit, EnvironmentSelectionState>(
        builder: (context, state) {
          return FilledButton(
            onPressed: _isValidateForm() ? _showCreateNodeDialog : null,
            child: Text(context.tr(LocaleKeys.submit)),
          );
        },
      ),
    );
  }

  bool _isValidateForm() {
    final collectedFormData = context.read<EnvironmentSelectionCubit>().state;

    return collectedFormData.seeds?.isNotEmpty == true &&
        collectedFormData.selectedEnvironment != null;
  }

  void _showCreateNodeDialog() {
    final collectedFormData = context.read<EnvironmentSelectionCubit>().state;

    createNodeDialog(
      context: context,
      clearForm: () {
        context.read<EnvironmentSelectionCubit>().clear();
      },
      createNodeCommand: () {
        context.read<DaemonManagerBloc>().add(
              RunDaemonCommand(
                cliCommand: CliCommand(
                  command: CliConstants.pactusDaemon,
                  arguments: [
                    CliConstants.init,
                    collectedFormData.selectedEnvironment!.argument,
                    CliConstants.restoreArgument,
                    collectedFormData.seeds!,
                    CliConstants.workingDirArgument,
                    '../../../../../../${collectedFormData.selectedEnvironment!.name}',
                    CliConstants.passwordArgument,
                    collectedFormData.password ?? 'null',
                    CliConstants.valNumArgument,
                    CliConstants.validators12,
                  ],
                ),
              ),
            );
      },
      collectedFormData: collectedFormData,
      checkNodeDirectories: () {
        context.read<DirectoryCheckBloc>().add(
              CheckDirectoryEvent(
                latestPartOfPath: collectedFormData.selectedEnvironment!.name,
                networkType: collectedFormData.selectedEnvironment!,
              ),
            );
      },
    );
  }
}
