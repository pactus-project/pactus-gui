import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';

class InitializeModePage extends StatelessWidget {
  const InitializeModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPaneCubit, int>(
      builder: (context, selectedIndex) {
        return NavigationView(
          content: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (selectedIndex < 6)
                  Button(
                    child: const Text('Next'),
                    onPressed: () {
                      context.read<NavigationPaneCubit>()
                          .setSelectedIndex(selectedIndex + 1);
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
