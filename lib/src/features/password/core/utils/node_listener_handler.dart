import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pactus_gui/src/core/constants/cli_constants.dart';
import 'package:pactus_gui/src/core/constants/storage_keys.dart';
import 'package:pactus_gui/src/core/extensions/int_extensions.dart';
import 'package:pactus_gui/src/core/extensions/string_extensions.dart';
import 'package:pactus_gui/src/core/router/route_name.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/cli_command.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/daemon_cubit.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/daemon_state.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/core/utils/methods/update_node_details_singleton.dart';
import 'package:pactus_gui/src/core/utils/storage_utils.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui/src/features/validator_config/core/utils/methods/show_fluent_alert_method.dart';

mixin NodeListenerHandler {
  static void handleState({
    required BuildContext context,
    required DaemonState state,
    required String password,
  }) {
    if (state is DaemonSuccess) {
      _handleSuccessState(context, state, password);
    } else if (state is DaemonError) {
      _handleErrorState(context, state, password);
    }
  }

  static void _handleSuccessState(
    BuildContext context,
    DaemonSuccess state,
    String password,
  ) {
    // Handle network detection
    if (state.output.contains(CliConstants.detectNetwork)) {
      updateNodeDetailsSingleton(nodeType: state.output.extractNetworkName());
    }

    // Handle password validation
    if (state.output.contains(CliConstants.detectSucceedWalletPassword)) {
      _startNodeDaemon(context, password);
    }
    // Handle GRPC port extraction & navigation
    if (state.output.toLowerCase().contains(
      CliConstants.grpcServerStarLowerCase,
    )) {
      updateNodeDetailsSingleton(
        password: password,
        port: state.output.extractNetworkPort(),
      );
      context.go(AppRoute.dashboard.fullPath);
    }
  }

  static void _handleErrorState(
    BuildContext context,
    DaemonError state,
    String password,
  ) {
    if (state.error.toLowerCase().contains(CliConstants.invalidPassword) &&
        password != '') {
      _showErrorDialog(context, context.tr(LocaleKeys.incorrect_password));
    }
    if (state.error.toLowerCase() == CliConstants.nodeIsLocked) {
      _showErrorDialog(
        context,
        context.tr(LocaleKeys.error_node_duplicate_running),
      );
    }
  }

  static void _startNodeDaemon(BuildContext context, String password) {
    final nodeDirectory = StorageUtils.getData<String>(
      StorageKeys.nodeDirectory,
    );
    context.read<DaemonCubit>().runStartNodeCommand(
      cliCommand: CliCommand(
        command: CliConstants.pactusDaemon,
        arguments: [
          CliConstants.start,
          CliConstants.workingDirArgument,
          nodeDirectory!,
          CliConstants.passwordArgument,
          password,
        ],
      ),
    );
  }

  static void _showErrorDialog(BuildContext context, String message) {
    showFluentAlert(context, message);
  }
}
