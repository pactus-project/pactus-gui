import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/features/blockchain_get_info/presentation/pages/blockchain_info_section.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        automaticallyImplyLeading: false,
      ),
      content: PopScope(
        canPop: false,
        child: Center(
          child: Column(
            children: [
              const Text(
                'DashboardPage',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              BlockchainInfoSection(),
            ],
          ),
        ),
      ),
    );
  }
}
