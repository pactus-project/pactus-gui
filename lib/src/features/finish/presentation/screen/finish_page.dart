import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/router/route_name.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_cubit.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_state.dart';
import 'package:gui/src/core/utils/daemon_manager/node_config_data.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class FinishPage extends StatelessWidget {
  const FinishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPaneCubit, int>(
      builder: (context, selectedIndex) {
        return NavigationView(
          content: Center(
            child: Column(
              children: [
                Text(
                  'password: ${NodeConfigData.instance.password}',
                  style: TextStyle(
                    color:
                        AppTheme.of(context).extension<DarkPallet>()!.dark900,
                  ),
                ),
                Text(
                  'validatorQty: ${NodeConfigData.instance.validatorQty}',
                  style: TextStyle(
                    color:
                        AppTheme.of(context).extension<DarkPallet>()!.dark900,
                  ),
                ),
                Text(
                  'workingDirectory:'
                  '${NodeConfigData.instance.workingDirectory}',
                  style: TextStyle(
                    color:
                        AppTheme.of(context).extension<DarkPallet>()!.dark900,
                  ),
                ),
                Text(
                  'restorationSeed: ${NodeConfigData.instance.restorationSeed}',
                  style: TextStyle(
                    color:
                        AppTheme.of(context).extension<DarkPallet>()!.dark900,
                  ),
                ),
                Button(
                  onPressed: () async {
                    final daemonCubit = context.read<DaemonCubit>();

                    await daemonCubit.runPactusDaemon(
                      command: './pactus-daemon',
                      arguments: [
                        'init',
                        '--working-dir',
                        NodeConfigData.instance.workingDirectory,
                        '--restore',
                        NodeConfigData.instance.restorationSeed,
                        '--password',
                        NodeConfigData.instance.password,
                        '--val-num',
                        NodeConfigData.instance.validatorQty,
                      ],
                    );
                  },
                  child: Text('Run Node'),
                ),
                SizedBox(
                  height: 150,
                  child: BlocBuilder<DaemonCubit, DaemonState>(
                    builder: (context, state) {
                      if (state is DaemonLoading) {
                        return Center(child: ProgressRing());
                      } else if (state is DaemonSuccess) {
                        return SingleChildScrollView(
                          child: Text(
                            state.output,
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      } else if (state is DaemonError) {
                        return SingleChildScrollView(
                          child: Text(
                            state.error,
                            style: TextStyle(fontSize: 16, color: Colors.red),
                          ),
                        );
                      } else {
                        return Center(
                          child: Text('Press the button to run the daemon.'),
                        );
                      }
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (selectedIndex > 0)
                      Button(
                        child: const Text('Previous'),
                        onPressed: () {
                          context
                              .read<NavigationPaneCubit>()
                              .setSelectedIndex(selectedIndex - 1);
                        },
                      ),
                    const SizedBox(width: 20),
                    Button(
                      child: const Text('Finish'),
                      onPressed: () {
                        context.goNamed(AppRoute.password.name);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
