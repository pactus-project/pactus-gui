import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gui/src/core/constants/cli_constants.dart';
import 'package:gui/src/core/extensions/context_extensions.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/cli_command.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_cubit.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_state.dart';
import 'package:gui/src/core/utils/daemon_manager/node_config_data.dart';
import 'package:gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/core/utils/string_extension.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/password/core/utils/node_listener_handler.dart';
import 'package:pactus_gui_widgetbook/app_core.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';
import 'package:pactus_gui_widgetbook/app_widgets.dart';

class FinishScreen extends StatefulWidget {
  const FinishScreen({super.key});

  @override
  State<FinishScreen> createState() => _FinishScreenState();
}

class _FinishScreenState extends State<FinishScreen> {
  @override
  Widget build(BuildContext context) {
    return NavigationView(
      content: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 20,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 6, // 60% of the width
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: Stack(
                  children: [
                    ListView(
                      padding: EdgeInsetsDirectional.only(end: 8),
                      children: [
                        Text(
                          context.tr(LocaleKeys.your_journey_finalized),
                          style: FluentTheme.of(context)
                              .typography
                              .title
                              ?.copyWith(
                                color: AppTheme.of(context)
                                    .extension<DarkPallet>()!
                                    .dark900,
                              ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          context
                              .tr(LocaleKeys.your_journey_finalized_description)
                              .replaceHashWithSpecialCharacter(),
                          style:
                              FluentTheme.of(context).typography.body?.copyWith(
                                    color: AppTheme.of(context)
                                        .extension<DarkPallet>()!
                                        .dark900,
                                  ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          context
                              .tr(
                                LocaleKeys
                                    .your_journey_finalized_description_last,
                              )
                              .replaceHashWithSpecialCharacter(),
                          style:
                              FluentTheme.of(context).typography.body?.copyWith(
                                    color: AppTheme.of(context)
                                        .extension<DarkPallet>()!
                                        .dark900,
                                  ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 64),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: IntrinsicWidth(
                        child: SizedBox(
                          height: 32,
                          child: BlocConsumer<DaemonCubit, DaemonState>(
                            listener: (ctxListener, state) {
                              NodeListenerHandler.handleState(
                                context: ctxListener,
                                state: state,
                                password: NodeConfigData.instance.password,
                              );
                            },
                            builder: (ctxBuilder, state) {
                              return AdaptivePrimaryButton.createTitleOnly(
                                onPressed: () {
                                  context
                                      .read<DaemonCubit>()
                                      .runStartNodeCommand(
                                        cliCommand: CliCommand(
                                          command: CliConstants.pactusDaemon,
                                          arguments: [
                                            CliConstants.start,
                                            CliConstants.workingDirArgument,
                                            NodeConfigData
                                                .instance.workingDirectory,
                                            CliConstants.passwordArgument,
                                            NodeConfigData.instance.password,
                                          ],
                                        ),
                                      );
                                },
                                requestState: RequestStateEnum.loaded,
                                title: context.tr(
                                  LocaleKeys.go_to_dashboard,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Expanded(
              flex: 4, // 40% of the width
              child: Center(
                child: SvgPicture.asset(
                  context.isDarkTheme()
                      ? Assets.images.bgFinishDark
                      : Assets.images.bgFinishLight,
                  height: 400,
                  width: 400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
