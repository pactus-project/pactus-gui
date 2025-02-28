import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/common/widgets/custom_password_widget.dart';
import 'package:gui/src/core/router/route_name.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/cli_command.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_cubit.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_state.dart';
import 'package:gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/validator_config/core/utils/methods/show_fluent_alert_method.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';
import '../../../../core/common/colors/app_colors.dart';

class UnblockPasswordScreen extends StatefulWidget {
  const UnblockPasswordScreen({super.key, required this.fromRegistrationRoute});
  final bool fromRegistrationRoute;

  static const double _maxContentWidth = 400;
  static const double _lockIconSize = 406;
  static const double _lockIconContainerSize = 364;
  static const double _smallLockIconSize = 30;
  static const double _spacingMedium = 10;
  static const double _spacingLarge = 20;

  @override
  State<UnblockPasswordScreen> createState() => _UnblockPasswordScreenState();
}

class _UnblockPasswordScreenState extends State<UnblockPasswordScreen> {
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
      appBar: NavigationAppBar(
        title: Text(
          '',
          style: theme.typography.body!.copyWith(
            color: colors.dark900,
          ),
        ),
      ),
      content: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: UnblockPasswordScreen._maxContentWidth,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Lock Icon Container
              Container(
                width: UnblockPasswordScreen._lockIconSize,
                height: UnblockPasswordScreen._lockIconContainerSize,
                decoration: BoxDecoration(
                  color: AppTheme.of(context).scaffoldBackgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    isDark
                        ? Assets.images.masterPasswordDark
                        : Assets.images.masterPasswordLight,
                    width: UnblockPasswordScreen._lockIconSize,
                    height: UnblockPasswordScreen._lockIconContainerSize,
                  ),
                ),
              ),
              const SizedBox(height: UnblockPasswordScreen._spacingMedium),

              // Small Lock Icon
              Assets.icons.lock.image(
                width: UnblockPasswordScreen._smallLockIconSize,
                height: UnblockPasswordScreen._smallLockIconSize,
                fit: BoxFit.contain,
                color: isDark ? AppColors.primaryLight : AppColors.primaryDark,
              ),
              const SizedBox(height: UnblockPasswordScreen._spacingMedium),

              // Instruction Text
              Text(
                context.tr(LocaleKeys.unlock_wallet_description),
                style: theme.typography.body!.copyWith(
                  color: colors.dark700,
                ),
              ),
              const SizedBox(height: UnblockPasswordScreen._spacingLarge),

              // Password Field
              CustomPasswordWidget(
                width: 280,
                placeholder: 'Enter the password ...',
                onChanged: (value) {
                  passwordNotifier.value = value;
                  debugPrint('Password value: $value');
                },
              ),

              const SizedBox(height: UnblockPasswordScreen._spacingLarge),

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
                          if (widget.fromRegistrationRoute) {
                            context.goNamed(AppRoute.dashboard.name);
                          } else {
                            context.goNamed(AppRoute.basicDashboard.name);
                          }
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
                                  final cliCommand = CliCommand(
                                    command: './pactus-wallet',
                                    arguments: ['password', password],
                                  );
                                  context
                                      .read<DaemonCubit>()
                                      .runPactusDaemon(cliCommand: cliCommand);

                                  debugPrint(
                                    'Unlocking with password: $password',
                                  );
                                }
                              : null, // Disable button if password is empty
                          child:
                              context.read<DaemonCubit>().state is DaemonLoading
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
    );
  }
}
