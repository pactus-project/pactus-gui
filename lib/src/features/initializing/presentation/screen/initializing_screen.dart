import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pactus_gui/src/core/common/cubits/step_validation_cubit.dart';
import 'package:pactus_gui/src/core/common/sections/navigation_footer_section.dart';
import 'package:pactus_gui/src/core/common/widgets/standard_page_layout.dart';
import 'package:pactus_gui/src/core/constants/cli_constants.dart';
import 'package:pactus_gui/src/core/enums/app_enums.dart';
import 'package:pactus_gui/src/core/router/route_name.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/cli_command.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/daemon_cubit.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/daemon_state.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/node_config_data.dart';
import 'package:pactus_gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/core/utils/methods/print_debug.dart';
import 'package:pactus_gui/src/data/models/fluent_navigation_state_model.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class InitializingScreen extends StatefulWidget {
  const InitializingScreen({super.key, required this.initialMode});

  final InitialMode initialMode;

  @override
  State<InitializingScreen> createState() => _InitializingScreenState();
}

class _InitializingScreenState extends State<InitializingScreen> {
  @override
  void initState() {
    super.initState();
    final initialCommand = CliCommand(
      command: CliConstants.pactusDaemon,
      arguments: [
        CliConstants.init,
        // if (widget.initialMode == InitialMode.restore)
        CliConstants.restoreArgument,
        // if (widget.initialMode == InitialMode.restore)
        NodeConfigData.instance.restorationSeed?.sentence ?? '',
        CliConstants.workingDirArgument,
        NodeConfigData.instance.workingDirectory,
        CliConstants.passwordArgument,
        NodeConfigData.instance.password == null ||
                NodeConfigData.instance.password!.isEmpty
            ? 'null'
            : NodeConfigData.instance.password!,
        CliConstants.valNumArgument,
        NodeConfigData.instance.validatorQty,
      ],
    );
    context.read<DaemonCubit>().runPactusDaemon(
          cliCommand: initialCommand,
        );
    printDebug(
      '${CliConstants.workingDirArgument} '
      '${NodeConfigData.instance.workingDirectory}',
    );
    printDebug(
      '${CliConstants.passwordArgument} '
      '${NodeConfigData.instance.password}',
    );
    printDebug(
      '${CliConstants.valNumArgument} '
      '${NodeConfigData.instance.validatorQty}',
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final colors = AppTheme.of(context).extension<DarkPallet>()!;
    final cubit = context.read<NavigationPaneCubit>();
    final newIndex = cubit.state.selectedIndex + 1;
    return BlocConsumer<DaemonCubit, DaemonState>(
      listener: (context, state) {
        if (state is DaemonLoading) {
          printDebug('DaemonState is DaemonLoading \n\n please wait \n\n');
        }

        if (state is DaemonSuccess) {
          printDebug('DaemonState is DaemonSuccess');
          context.goNamed(AppRoute.basicPassword.name);
          Future.delayed(const Duration(seconds: 2), () {
            if (mounted) {
              cubit.setSelectedIndex(newIndex);
            }
          });
        }

        if (state is DaemonError) {
          printDebug('DaemonState is DaemonError');
        }
      },
      builder: (context, daemonState) {
        /// to-do(esmaeil): check performance cost
        context.read<StepValidationCubit>().setStepValid(
              stepIndex: newIndex,
              isValid: daemonState is DaemonSuccess,
            );
        return BlocBuilder<NavigationPaneCubit, NavigationState>(
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
                      activeColor: FluentTheme.of(context).accentColor,
                      backgroundColor: colors.dark100,
                    ),
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<DaemonCubit, DaemonState>(
                    builder: (context, state) {
                      return NavigationFooterSection(
                        selectedIndex: selectedIndex.selectedIndex,
                        onBackPressed: () {
                          context.read<NavigationPaneCubit>().setSelectedIndex(
                                selectedIndex.selectedIndex - 1,
                              );
                        },
                        onNextPressed: (state is DaemonSuccess)
                            ? () {
                                context
                                    .read<NavigationPaneCubit>()
                                    .setSelectedIndex(
                                      selectedIndex.selectedIndex + 1,
                                    );
                              }
                            : null,
                      );
                    },
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
