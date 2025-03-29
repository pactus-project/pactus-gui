import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/constants/cli_constants.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/cli_command.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_manager_bloc.dart';
import 'package:gui/src/features/dev_mode/core/utils/create_node_dialog.dart';
import 'package:gui/src/features/dev_mode/presentation/bloc/environment_selection_cubit.dart';
import 'package:gui/src/features/dev_mode/presentation/bloc/environment_selection_state.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 196,
      child: BlocBuilder<EnvironmentSelectionCubit, EnvironmentSelectionState>(
        builder: (context, state) {
          final validatedPassword =
              state.password != null && state.password!.trim().isNotEmpty;
          final validatedSeeds = state.seeds != null && state.seeds!.isNotEmpty;
          final validatedEnv = state.selectedEnvironment != null;
          return FilledButton(
            onPressed: validatedPassword && validatedSeeds && validatedEnv
                ? () {
                    final collectedFormData =
                        context.read<EnvironmentSelectionCubit>().state;

                    createNodeDialog(
                      context,
                      collectedFormData,
                      () {
                        context.read<DaemonManagerBloc>().add(
                              RunDaemonCommand(
                                cliCommand: CliCommand(
                                  command: CliConstants.pactusDaemon,
                                  arguments: [
                                    CliConstants.init,
                                    collectedFormData
                                        .selectedEnvironment!.argument,
                                    CliConstants.restoreArgument,
                                    collectedFormData.seeds!,
                                    CliConstants.workingDirArgument,
                                    '../../../../../../${collectedFormData.selectedEnvironment!.name}',
                                    CliConstants.passwordArgument,
                                    collectedFormData.password!,
                                    CliConstants.valNumArgument,
                                    CliConstants.validators12,
                                  ],
                                ),
                              ),
                            );
                        context
                            .read<EnvironmentSelectionCubit>()
                            .setPassword('');
                        context.read<EnvironmentSelectionCubit>().setSeeds('');
                      },
                    );
                  }
                : null,
            child: const Text('Submit'),
          );
        },
      ),
    );
  }
}
