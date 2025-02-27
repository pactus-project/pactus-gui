import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/sections/navigation_footer_section.dart';
import 'package:gui/src/core/common/widgets/standard_page_layout.dart';
import 'package:gui/src/core/utils/daemon_manager/node_config_data.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';

class MasterPasswordPage extends StatefulWidget {
  const MasterPasswordPage({super.key});

  @override
  State<MasterPasswordPage> createState() => _MasterPasswordPageState();
}

class _MasterPasswordPageState extends State<MasterPasswordPage> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPaneCubit, int>(
      builder: (context, selectedIndex) {
        return StandardPageLayout(
          content: Center(
            child: SizedBox(
              width: 220,
              child: TextBox(
                controller: _passwordController,
                placeholder: 'Enter master password',
                obscureText: true,
                decoration: WidgetStateProperty.all(
                  BoxDecoration(
                    border: Border.all(color: Colors.grey[120]),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
          footer: NavigationFooterSection(
            selectedIndex: selectedIndex,
            onNextPressed: () {
              NodeConfigData.instance.password = _passwordController.text;
              context
                  .read<NavigationPaneCubit>()
                  .setSelectedIndex(selectedIndex + 1);
            },
            onBackPressed: () {
              context
                  .read<NavigationPaneCubit>()
                  .setSelectedIndex(selectedIndex - 1);
            },
          ),
        );
      },
    );
  }
}
