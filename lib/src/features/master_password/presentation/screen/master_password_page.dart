import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/utils/daemon_manager/node_config_data.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class MasterPasswordPage extends StatefulWidget {
  const MasterPasswordPage({super.key});

  @override
  State<MasterPasswordPage> createState() => _MasterPasswordPageState();
}

class _MasterPasswordPageState extends State<MasterPasswordPage> {
  TextEditingController directoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPaneCubit, int>(
      builder: (context, selectedIndex) {
        return NavigationView(
          appBar: NavigationAppBar(
            title: Text(
              'MasterPasswordPage',
              style: FluentTheme.of(context).typography.body!.copyWith(
                    color:
                        AppTheme.of(context).extension<DarkPallet>()!.dark900,
                  ),
            ),
          ),
          content: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                SizedBox(
                  width: 220,
                  child: ExcludeSemantics(
                    child: TextBox(
                      controller: directoryController,
                      placeholder: 'Password',
                      autofocus: true,
                      decoration: WidgetStateProperty.all(
                        BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
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
                    if (selectedIndex < 6)
                      Button(
                        child: const Text('Next'),
                        onPressed: () {
                          NodeConfigData.instance.password =
                              directoryController.text;
                          context
                              .read<NavigationPaneCubit>()
                              .setSelectedIndex(selectedIndex + 1);
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
