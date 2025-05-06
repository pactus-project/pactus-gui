import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pactus_gui/src/core/common/widgets/app_layout.dart';
import 'package:pactus_gui/src/core/common/widgets/custom_input_widget.dart';
import 'package:pactus_gui/src/core/common/widgets/keyboard_shortcut_widget.dart';
import 'package:pactus_gui/src/core/constants/cli_constants.dart';
import 'package:pactus_gui/src/core/constants/storage_keys.dart';
import 'package:pactus_gui/src/core/router/route_name.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/cli_command.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/daemon_cubit.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/bloc/daemon_state.dart';
import 'package:pactus_gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/core/utils/storage_utils.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui/src/features/password/core/utils/node_listener_handler.dart';
import 'package:pactus_gui_widgetbook/app_core.dart'
    show ButtonTypeEnum, PaddingSizeEnum, RequestStateEnum;
import 'package:pactus_gui_widgetbook/app_styles.dart';
import 'package:pactus_gui_widgetbook/app_widgets.dart';

class UnlockPasswordScreen extends StatefulWidget {
  const UnlockPasswordScreen({super.key, required this.fromRegistrationRoute});
  final bool fromRegistrationRoute;

  @override
  State<UnlockPasswordScreen> createState() => _UnlockPasswordScreenState();
}

class _UnlockPasswordScreenState extends State<UnlockPasswordScreen> {
  // Constants for layout
  static const double _maxContentWidth = 400;
  static const double _lockIconSize = 406;
  static const double _lockIconContainerSize = 364;
  static const double _smallLockIconSize = 30;
  static const double _spacingMedium = 10;
  static const double _spacingLarge = 20;
  final ValueNotifier<String> passwordNotifier = ValueNotifier<String>('');

  @override
  void dispose() {
    passwordNotifier.dispose(); // Prevents memory leaks
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
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
              'null',
            ],
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final colors = AppTheme.of(context).extension<DarkPallet>()!;

    return KeyboardShortcutWidget(
      isEnabledInDebugMode: true,
      actionOnLinuxWindows: () {
        context.go(AppRoute.devMode.fullPath);
      },
      actionOnMacOs: () {
        context.go(AppRoute.devMode.fullPath);
      },
      shortcutOnLinuxWindows: LogicalKeyboardKey.keyD,
      shortcutOnMacOs: LogicalKeyboardKey.keyD,
      child: AppLayout(
        content: NavigationView(
          content: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                constraints: BoxConstraints(
                  maxWidth: _maxContentWidth,
                  maxHeight: constraints.maxHeight,
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Lock Icon Container
                        Container(
                          width: _lockIconSize,
                          height: _lockIconContainerSize,
                          decoration: BoxDecoration(
                            color: AppTheme.of(context).scaffoldBackgroundColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              isDark
                                  ? Assets.images.masterPasswordDark
                                  : Assets.images.masterPasswordLight,
                              width: _lockIconSize,
                              height: _lockIconContainerSize,
                            ),
                          ),
                        ),
                        const SizedBox(height: _spacingMedium),

                        // Small Lock Icon
                        Assets.icons.lock.image(
                          width: _smallLockIconSize,
                          height: _smallLockIconSize,
                          fit: BoxFit.contain,
                          color: colors.contrast,
                        ),
                        const SizedBox(height: _spacingMedium),

                        // Instruction Text
                        Text(
                          context.tr(LocaleKeys.unlock_wallet_description),
                          style: theme.typography.body!.copyWith(
                            color: colors.contrast,
                          ),
                        ),
                        const SizedBox(height: _spacingLarge),

                        // Password Field
                        CustomInputWidget(
                          width: 280,
                          placeholder:
                              context.tr(LocaleKeys.enter_your_password),
                          obscureText: true,
                          onChanged: (value) {
                            passwordNotifier.value = value;

                            // Logger().i('Password value: $value');
                          },
                        ),

                        const SizedBox(height: _spacingLarge),

                        // Unlock Button with ValueListenableBuilder
                        ValueListenableBuilder<String>(
                          valueListenable: passwordNotifier,
                          builder: (context, password, child) {
                            return BlocConsumer<DaemonCubit, DaemonState>(
                              listener: (ctxListener, state) {
                                NodeListenerHandler.handleState(
                                  context: context,
                                  state: state,
                                  password: password,
                                );
                              },
                              builder: (ctxBuilder, state) {
                                return SizedBox(
                                  width: 120,
                                  child: AdaptivePrimaryButton(
                                    buttonType: ButtonTypeEnum.titleOnly,
                                    paddingSize: PaddingSizeEnum.min,
                                    requestState: context
                                            .read<DaemonCubit>()
                                            .state is DaemonLoading
                                        ? RequestStateEnum.loading
                                        : RequestStateEnum.initial,
                                    onPressed: password.isNotEmpty
                                        ? () {
                                            final nodeDirectory =
                                                '${StorageUtils.getData<String>(
                                              StorageKeys.nodeDirectory,
                                            )}';

                                            context
                                                .read<DaemonCubit>()
                                                .runStartNodeCommand(
                                                  cliCommand: CliCommand(
                                                    command: CliConstants
                                                        .pactusDaemon,
                                                    arguments: [
                                                      CliConstants.start,
                                                      CliConstants
                                                          .workingDirArgument,
                                                      nodeDirectory,
                                                      CliConstants
                                                          .passwordArgument,
                                                      password,
                                                    ],
                                                  ),
                                                );
                                          }
                                        : null,
                                    title: context.tr(LocaleKeys.unlock_wallet),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
