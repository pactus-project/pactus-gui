import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/widgets/custom_input_widget.dart';
import 'package:gui/src/core/constants/cli_constants.dart';
import 'package:gui/src/core/constants/storage_keys.dart';
import 'package:gui/src/core/enums/app_os_separator.dart';
import 'package:gui/src/core/router/route_name.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/cli_command.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_cubit.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_state.dart';
import 'package:gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/core/utils/methods/update_node_details_singleton.dart';
import 'package:gui/src/core/utils/storage_utils.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/validator_config/core/utils/methods/show_fluent_alert_method.dart';
import 'package:logger/logger.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

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
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final colors = AppTheme.of(context).extension<DarkPallet>()!;

    return NavigationView(
      content: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: _maxContentWidth,
            ),
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
                  color:
                      isDark ? AppColors.primaryLight : AppColors.primaryDark,
                ),
                const SizedBox(height: _spacingMedium),

                // Instruction Text
                Text(
                  context.tr(LocaleKeys.unlock_wallet_description),
                  style: theme.typography.body!.copyWith(
                    color: colors.dark700,
                  ),
                ),
                const SizedBox(height: _spacingLarge),

                // Password Field
                CustomInputWidget(
                  width: 280,
                  placeholder: context.tr(LocaleKeys.enter_your_password),
                  obscureText: true,
                  onChanged: (value) {
                    passwordNotifier.value = value;
                    Logger().i('Password value: $value');
                  },
                ),

                const SizedBox(height: _spacingLarge),

                // Unlock Button with ValueListenableBuilder
                ValueListenableBuilder<String>(
                  valueListenable: passwordNotifier,
                  builder: (context, password, child) {
                    return BlocConsumer<DaemonCubit, DaemonState>(
                      listener: (ctxListener, state) {
                        if (state is DaemonSuccess) {
                          final isPasswordCorrect = state.output
                              .contains('Your wallet password successfully');
                          if (isPasswordCorrect) {
                            final nodeDirectory = StorageUtils.getData<String>(
                              StorageKeys.nodeDirectory,
                            );

                            context.read<DaemonCubit>().runPactusDaemon(
                                  cliCommand: CliCommand(
                                    command: CliConstants.pactusDaemon,
                                    arguments: [
                                      CliConstants.start,
                                      CliConstants.dashDashWorkingDir,
                                      nodeDirectory!,
                                      CliConstants.dashDashPassword,
                                      password,
                                    ],
                                  ),
                                );

                            updateNodeDetailsSingleton(password);
                            // Always navigate to the standalone dashboard route
                            context.go(AppRoute.dashboard.fullPath);
                          } else {
                            showFluentAlert(
                              context,
                              context.tr(LocaleKeys.incorrect_password),
                            );
                          }
                        }
                      },
                      builder: (ctxBuilder, state) {
                        return SizedBox(
                          width: 100,
                          child: FilledButton(
                            onPressed: password.isNotEmpty
                                ? () {
                                    final sign = AppOS.current.separator;
                                    final storageKey =
                                        StorageKeys.nodeDirectory;

                                    final nodeDirectory =
                                        '${StorageUtils.getData<String>(
                                      storageKey,
                                    )}';
                                    final walletPath =
                                        '$sign${CliConstants.wallets}'
                                        '$sign${CliConstants.defaultWallet}';

                                    final cliCommand = CliCommand(
                                      command: CliConstants.pactusWallet,
                                      arguments: [
                                        CliConstants.password,
                                        CliConstants.dashDashPassword,
                                        password,
                                        CliConstants.dashDashPath,
                                        nodeDirectory + walletPath,
                                      ],
                                    );
                                    context.read<DaemonCubit>().runPactusDaemon(
                                          cliCommand: cliCommand,
                                        );

                                    Logger().i(
                                      'Unlocking with password: $password',
                                    );
                                  }
                                : null, // Disable button if password is empty
                            child: context.read<DaemonCubit>().state
                                    is DaemonLoading
                                ? SizedBox(
                                    height: 26,
                                    width: 26,
                                    child: ProgressRing(),
                                  )
                                : Text(context.tr(LocaleKeys.unlock_wallet)),
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
      ),
    );
  }
}
