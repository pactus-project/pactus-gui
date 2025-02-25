import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_cubit.dart';
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
  bool _isLoading = true;
  bool _hasError = false;
  String? _errorMessage;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   _initializeDaemon();
  // }

  Future<void> _initializeDaemon() async {
    try {
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
      setState(() {
        _isLoading = false;
        _hasError = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasError = true;
        _errorMessage = e.toString();
      });
    }
  }

  Widget _buildContent(BuildContext context) {
    final theme = FluentTheme.of(context);
    final colors = AppTheme.of(context).extension<DarkPallet>()!;

    // if (_hasError) {
    //   return Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Icon(
    //           FluentIcons.error,
    //           color: colors.dark900,
    //           size: 48,
    //         ),
    //         const SizedBox(height: 20),
    //         Text(
    //           context.tr(LocaleKeys.initialization_failed),
    //           style: theme.typography.bodyStrong!.copyWith(
    //             color: colors.dark900,
    //           ),
    //         ),
    //         if (_errorMessage != null) ...[
    //           const SizedBox(height: 10),
    //           Text(
    //             _errorMessage!,
    //             style: theme.typography.body!.copyWith(
    //               color: colors.dark500,
    //             ),
    //             textAlign: TextAlign.center,
    //           ),
    //         ],
    //         const SizedBox(height: 20),
    //         Button(
    //           child: Text(context.tr(LocaleKeys.retry)),
    //           onPressed: () {
    //             setState(() {
    //               _isLoading = true;
    //               _hasError = false;
    //             });
    //             _initializeDaemon();
    //           },
    //         ),
    //       ],
    //     ),
    //   );
    // }

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
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPaneCubit, int>(
      builder: (context, selectedIndex) {
        return NavigationView(
          content: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            child: _buildContent(context),
          ),
        );
      },
    );
  }
}
