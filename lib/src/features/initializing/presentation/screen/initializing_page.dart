import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gui/src/core/common/sections/navigation_footer_section.dart';
import 'package:gui/src/core/common/widgets/standard_page_layout.dart';
import 'package:gui/src/core/enums/app_enums.dart';
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
  const InitializingScreen({super.key, required this.initialMode});
  final InitialMode initialMode;
  @override
  State<InitializingScreen> createState() => _InitializingScreenState();
}

class _InitializingScreenState extends State<InitializingScreen> {
  final logger = Logger();

  @override
  void initState() {
    super.initState();
    final initialCommand = CliCommand(
      command: './pactus-daemon',
      arguments: [
        'init',
        // if (widget.initialMode == InitialMode.restore)
        '--restore',
        // if (widget.initialMode == InitialMode.restore)
        NodeConfigData.instance.restorationSeed!.sentence,
        '--working-dir',
        NodeConfigData.instance.workingDirectory,
        if (NodeConfigData.instance.password.isNotEmpty) '--password',
        if (NodeConfigData.instance.password.isNotEmpty)
          NodeConfigData
              .instance.password, // Add password only if it's not empty
        '--val-num',
        NodeConfigData.instance.validatorQty,
      ],
    );
    context.read<DaemonCubit>().runPactusDaemon(
          cliCommand: initialCommand,
        );
    logger
      ..i(
        '--working-dir ${NodeConfigData.instance.workingDirectory}',
      )
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
    final bluePallet = AppTheme.of(context).extension<BluePallet>()!;

    return BlocConsumer<DaemonCubit, DaemonState>(
      listener: (context, state) {
        if (state is DaemonLoading) {
          logger.i('DaemonState is DaemonLoading \n\n please wait \n\n');
        }

        if (state is DaemonSuccess) {
          logger.i('DaemonState is DaemonSuccess');
          final cubit = context.read<NavigationPaneCubit>();
          final newIndex = cubit.state + 1;
          Future.delayed(const Duration(seconds: 2), () {
            if (mounted) {
              cubit.setSelectedIndex(newIndex);
            }
          });
        }

        if (state is DaemonError) {
          logger.i('DaemonState is DaemonError');
        }
      },
      builder: (context, daemonState) {
        return BlocBuilder<NavigationPaneCubit, int>(
          builder: (context, selectedIndex) {
            return StandardPageLayout(
              content: Column(
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
                ],
              ),
              footer: Column(
                children: [
                  const SizedBox(height: 60),
                  SizedBox(
                    width: 700,
                    height: 4,
                    child: ProgressBar(
                      activeColor: bluePallet.blue400,
                      backgroundColor: colors.dark100,
                    ),
                  ),
                  const SizedBox(height: 20),
                  NavigationFooterSection(
                    selectedIndex: selectedIndex,
                    onBackPressed: null,
                    onNextPressed: () {
                      context
                          .read<NavigationPaneCubit>()
                          .setSelectedIndex(selectedIndex + 1);
                    },
                    // showPrevious: false,
                    // showNext: false,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
