import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/widgets/app_layout.dart';
import 'package:gui/src/data/models/fluent_navigation_state_model.dart';
import 'package:gui/src/features/dashboard/presentation/widgets/menu_button.dart';
import 'package:gui/src/features/dashboard/presentation/widgets/pane_items.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPaneCubit, NavigationState>(
      builder: (context, state) {
        return AppLayout(
          isDashboard: true,
          content: NavigationView(
            pane: NavigationPane(
              displayMode: context.read<NavigationPaneCubit>().state.isMenuOpen
                  ? PaneDisplayMode.open
                  : PaneDisplayMode.compact,
              menuButton: MenuButton(),
              size:
                  const NavigationPaneSize(openMaxWidth: 209, compactWidth: 52),
              selected: state.selectedIndex,
              onChanged: (index) {
                context.read<NavigationPaneCubit>().setSelectedIndex(index);
              },
              footerItems: [
                PaneItems.settings,
                PaneItems.faq,
                PaneItems.aboutUs,
              ],
              items: [
                PaneItems.home,
                PaneItems.transactions,
                PaneItems.wallet,
                PaneItems.nodeLogs,
              ],
            ),
          ),
        );
      },
    );
  }
}
