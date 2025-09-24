import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_info/flutter_app_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pactus_gui/src/core/common/widgets/keyboard_shortcut_widget.dart';
import 'package:pactus_gui/src/core/constants/cli_constants.dart';
import 'package:pactus_gui/src/core/constants/storage_keys.dart';
import 'package:pactus_gui/src/core/enums/app_os_separator.dart';
import 'package:pactus_gui/src/core/router/route_name.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/cli_command.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/daemon_cubit.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/daemon_state.dart';
import 'package:pactus_gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/core/utils/methods/update_node_details_singleton.dart';
import 'package:pactus_gui/src/core/utils/node_lock_manager/bloc/unlock_node_cubit.dart';
import 'package:pactus_gui/src/core/utils/storage_utils.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui/src/features/validator_config/core/utils/methods/show_fluent_alert_method.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const _splashDuration = Duration(seconds: 2);
  static const _logoSize = 180.0;
  static const _logoNameWidth = 168.0;
  static const _logoNameHeight = 34.0;
  static const _spacingBetweenElements = 16.0;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: KeyboardShortcutWidget(
        isEnabledInDebugMode: true,
        actionOnLinuxWindows: () {
          context.go(AppRoute.devMode.fullPath);
        },
        actionOnMacOs: () {
          context.go(AppRoute.devMode.fullPath);
        },
        shortcutOnLinuxWindows: LogicalKeyboardKey.keyD,
        shortcutOnMacOs: LogicalKeyboardKey.keyD,
        child: BlocListener<UnlockNodeCubit, UnlockerState>(
          listener: (context, state) {
            if (state is UnlockerFailed) {
              showFluentAlert(context, context.tr(LocaleKeys.error));
            }
          },
          child: BlocBuilder<UnlockNodeCubit, UnlockerState>(
            builder: (context, state) {
              if (state is UnlockerLoading) {
                return Center(child: ProgressRing());
              }

              return BlocConsumer<DaemonCubit, DaemonState>(
                listener: (ctxListener, state) {
                  if (state is DaemonError) {
                    Future.delayed(_splashDuration, () {
                      if (context.mounted) {
                        context.go(AppRoute.welcome.fullPath);
                      }
                    });
                  }
                  if (state is DaemonSuccess) {
                    final isUnprotectedNode = state.output
                        .toLowerCase()
                        .contains('false');
                    final isProtectedNode = state.output.toLowerCase().contains(
                      'true',
                    );
                    final isUndefinedNode =
                        !state.output.toLowerCase().contains('is encrtypted') &&
                        !state.output.toLowerCase().contains('created at');
                    if (state.output.toLowerCase().contains('network:')) {
                      final match = RegExp(
                        r'mainnet|testnet|localnet',
                      ).firstMatch(state.output.toLowerCase());

                      final storageKey = StorageKeys.nodeDirectory;

                      final nodeDirectory =
                          '${StorageUtils.getData<String>(storageKey)}';

                      updateNodeDetailsSingleton(
                        networkName: match?.group(0) ?? 'unknown',
                        nodeWorkingDirectory: nodeDirectory,
                      );
                    }

                    if (isUnprotectedNode) {
                      Future.delayed(_splashDuration, () {
                        if (context.mounted) {
                          context.go(AppRoute.dashboard.fullPath);
                        }
                      });
                    }
                    if (isProtectedNode) {
                      updateNodeDetailsSingleton(isEncryptedNode: true);
                      Future.delayed(_splashDuration, () {
                        if (context.mounted) {
                          context.go(AppRoute.basicPassword.fullPath);
                        }
                      });
                    }

                    if (isUndefinedNode) {
                      Future.delayed(_splashDuration, () {
                        if (context.mounted) {
                          context.go(AppRoute.welcome.fullPath);
                        }
                      });
                    }
                  }
                },
                builder: (ctxBuilder, state) {
                  if (state is DaemonSuccess) {
                    return Stack(
                      children: [
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.icons.logo.image(
                                width: _logoSize,
                                height: _logoSize,
                                fit: BoxFit.contain,
                              ),
                              Gap(_spacingBetweenElements),
                              Assets.images.logoName.image(
                                color: AppTheme.of(
                                  context,
                                ).extension<DarkPallet>()!.dark900,
                                width: _logoNameWidth,
                                height: _logoNameHeight,
                                fit: BoxFit.contain,
                              ),
                              Gap(_spacingBetweenElements),
                              Text(
                                context.tr(LocaleKeys.applications),
                                style: FluentTheme.of(context).typography.title
                                    ?.copyWith(
                                      color: AppTheme.of(
                                        context,
                                      ).extension<DarkPallet>()!.dark900,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Text(
                              '${AppInfo.of(context).package.version}',
                              style: FluentTheme.of(context).typography.title
                                  ?.copyWith(
                                    color: AppTheme.of(
                                      context,
                                    ).extension<DarkPallet>()!.dark900,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    if (state is DaemonInitial) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        final sign = AppOS.current.separator;
                        final storageKey = StorageKeys.nodeDirectory;

                        final nodeDirectory =
                            '${StorageUtils.getData<String>(storageKey)}';

                        final walletPath =
                            '$sign${CliConstants.wallets}'
                            '$sign${CliConstants.defaultWallet}';

                        context.read<DaemonCubit>().runPactusDaemon(
                          cliCommand: CliCommand(
                            command: CliConstants.pactusWallet,
                            arguments: [
                              CliConstants.info,
                              CliConstants.pathArgument,
                              nodeDirectory + walletPath,
                            ],
                          ),
                        );
                      });
                    }
                    return Center(child: ProgressRing());
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
