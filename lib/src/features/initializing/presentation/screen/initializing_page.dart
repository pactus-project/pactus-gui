import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/cli_command.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_cubit.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_state.dart';
import 'package:gui/src/core/utils/daemon_manager/node_config_data.dart';
import 'package:gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:logger/logger.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class InitializingScreen extends StatefulWidget {
  const InitializingScreen({super.key});

  @override
  State<InitializingScreen> createState() => _InitializingScreenState();
}

class _InitializingScreenState extends State<InitializingScreen> {
  final cliCommand = CliCommand(
    command: './pactus-daemon',
    arguments: [
      'init',
      '--working-dir',
      NodeConfigData.instance.workingDirectory,
      '--restore',
      NodeConfigData.instance.restorationSeed!.sentence,
      '--password',
      NodeConfigData.instance.password,
      '--val-num',
      NodeConfigData.instance.validatorQty,
    ],
  );
  final logger = Logger();

  @override
  void initState() {
    super.initState();
    context.read<DaemonCubit>().runPactusDaemon(
          cliCommand: cliCommand,
        );
    logger
      ..i(
        '--working-dir ${NodeConfigData.instance.workingDirectory}',
      )
      ..i('--restore${NodeConfigData.instance.restorationSeed!.sentence}')
      ..i(
        '--password ${NodeConfigData.instance.password}',
      )
      ..i(
        '--val-num ${NodeConfigData.instance.validatorQty}',
      );
  }

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final colors = AppTheme.of(context).extension<DarkPallet>()!;

    return BlocConsumer<DaemonCubit, DaemonState>(
      listener: (context, state) {
        if (state is DaemonLoading) {
          logger.i('DaemonState is DaemonLoading \n\n please wait \n\n');
        }

        if (state is DaemonSuccess) {
          logger.i('DaemonState is DaemonSuccess');
          context
              .read<NavigationPaneCubit>()
              .setSelectedIndex(context.read<NavigationPaneCubit>().state + 1);
        }

        if (state is DaemonError) {
          logger.i('DaemonState is DaemonError');
        }
      },
      builder: (context, daemonState) {
        return BlocBuilder<NavigationPaneCubit, int>(
          builder: (context, selectedIndex) {
            if (daemonState is DaemonLoading || daemonState is DaemonInitial) {
              return Center(
                child: SizedBox(
                  height: 64,
                  width: 64,
                  child: ProgressRing(),
                ),
              );
            }
            return NavigationView(
              content: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr(LocaleKeys.initialization_complete),
                      style: theme.typography.title!.copyWith(
                        color: colors.dark900,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      context.tr(LocaleKeys.node_activation_powering),
                      style: theme.typography.body!.copyWith(
                        color: colors.dark500,
                      ),
                    ),
                    const SizedBox(height: 60),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.images.backgroundInitializing,
                            width: 480,
                            height: 360,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
