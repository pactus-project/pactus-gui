import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/app.dart';
import 'package:gui/src/core/common/cubits/app_accent_color_cubit.dart';
import 'package:gui/src/core/di/locator.dart';
import 'package:gui/src/core/utils/daemon_manager/bloc/daemon_cubit.dart';
import 'package:gui/src/features/main/radio_button_cubit/presentation/radio_button_cubit.dart';
import 'package:gui/src/features/main/theme/bloc/theme_bloc.dart';
import 'src/core/common/cubits/step_validation_cubit.dart';
import 'src/core/utils/window_manager.dart';
import 'src/features/main/language/presentation/bloc/language_bloc.dart';
import 'src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:flutter_app_info/flutter_app_info.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupSharedPreferences();
  await setupDependencies();
  await windowsManager();

  runApp(
    AppInfo(
      data: await AppInfoData.get(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppAccentColorCubit>(
            create: (_) => AppAccentColorCubit(),
          ),
          BlocProvider<LanguageBloc>(
            create: (_) => LanguageBloc(),
          ),
          BlocProvider<AppThemeCubit>(
            create: (_) => AppThemeCubit(),
          ),
          BlocProvider<NavigationPaneCubit>(
            create: (_) => NavigationPaneCubit(),
          ),
          BlocProvider<RadioButtonCubit>(
            create: (_) => RadioButtonCubit(),
          ),
          BlocProvider<DaemonCubit>(
            create: (_) => DaemonCubit(),
          ),
          BlocProvider<StepValidationCubit>(
            create: (_) => StepValidationCubit(),
          ),
        ],
        child: PactusGuiApp(),
      ),
    ),
  );
}
