import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:gui/src/features/master_password/presentation/sections/master_password_footer.dart';
import 'package:gui/src/features/master_password/presentation/sections/master_password_section.dart';

class MasterPasswordScreen extends StatefulWidget {
  const MasterPasswordScreen({super.key});

  @override
  State<MasterPasswordScreen> createState() => _MasterPasswordScreenState();
}

class _MasterPasswordScreenState extends State<MasterPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPaneCubit, int>(
      builder: (context, selectedIndex) {
        return NavigationView(
          content: Stack(
            children: [
              MasterPasswordSection(
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: MasterPasswordFooter(selectedIndex: selectedIndex),
              ),
            ],
          ),
        );
      },
    );
  }
}


