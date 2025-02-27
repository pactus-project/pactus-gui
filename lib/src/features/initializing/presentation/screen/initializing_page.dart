import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_cubit.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_state.dart';
import 'package:gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';
import '../../../../core/utils/daemon_manager/node_config_data.dart';


class InitializingPage extends StatefulWidget {
  const InitializingPage({super.key});

  @override
  State<InitializingPage> createState() => _InitializingPageState();
}

class _InitializingPageState extends State<InitializingPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Start initialization when widget is created
    context.read<DaemonCubit>().runPactusDaemon(
      command: './pactus-daemon',
      arguments: [
        'init',
        '--working-dir',
        NodeConfigData.instance.workingDirectory,
        '--restore',
        NodeConfigData.instance.restorationSeed?.words.join(' ') ?? '',
        '--password',
        NodeConfigData.instance.password,
        '--val-num',
        NodeConfigData.instance.validatorQty,
      ],
    );
  }

  Widget _buildContent(BuildContext context, DaemonState state) {
    final theme = FluentTheme.of(context);
    final colors = AppTheme.of(context).extension<DarkPallet>()!;
    final bluePallet = AppTheme.of(context).extension<BluePallet>()!;

    if (state is DaemonLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProgressBar(
              activeColor: Colors.blue,
              backgroundColor: Colors.grey,
            ),
            const SizedBox(height: 20),
            Text(
              context.tr(LocaleKeys.initializing),
              style: theme.typography.body!.copyWith(
                color: colors.dark500,
              ),
            ),
          ],
        ),
      );
    }

    if (state is DaemonError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FluentIcons.error, color: Colors.red, size: 40),
            const SizedBox(height: 20),
            Text(
              state.toString(),
              style: theme.typography.body!.copyWith(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
    if (state is DaemonSuccess) {
      // context.goNamed(AppRoute.finish.name);
    }

    // Success state (DaemonRunning)
    return Column(
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
        const SizedBox(height: 60),
        Center(
          child: SizedBox(
            width: 700,
            height: 4,
            child: ProgressBar(
              activeColor: bluePallet.blue400,
              backgroundColor: colors.dark100,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPaneCubit, int>(
      builder: (context, selectedIndex) {
        return BlocBuilder<DaemonCubit, DaemonState>(
          builder: (context, state) {
            return NavigationView(
              content: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                child: _buildContent(context, state),
              ),
            );
          },
        );
      },
    );
  }
}
