import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pactus/screen_wrapper/wrapper_screen.dart';
import 'package:pactus/support/constants.dart';
import 'package:pactus/support/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  static const String route = '/dashboard';

  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  void initState() {
    super.initState();
    context.afterBuild(() async {
      final prefs = await SharedPreferences.getInstance();
      final daemonPath = prefs.getString(Constants.daemonPath);
      final dataDirPath = prefs.getString(Constants.dataDirPath);
      if (daemonPath != null && dataDirPath != null) {
        if (context.mounted) {

        }
      }
    });
  }


  int paneIndex = 0;
  List<NavigationPaneItem> items = [
    PaneItem(
      icon: const Icon(FluentIcons.home_solid),
      title: const Text('Dashboard'),
      body: const Placeholder(),
    ),
    // PaneItemSeparator(),
    PaneItem(
      icon: const Icon(FluentIcons.money),
      title: const Text('Transactions'),
      // infoBadge: const InfoBadge(source: Text('8')),
      body: const Placeholder(),
    ),
    PaneItem(
      icon: const Icon(FluentIcons.album),
      title: const Text('Wallet'),
      body: const Placeholder(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WrapperPage(
        title: "",
        content: NavigationView(
          pane: NavigationPane(
            size: NavigationPaneSize(openMaxWidth: 300.w),
            selected: paneIndex,
            onChanged: (index) {
              setState(() {
                paneIndex = index;
              });
              // Your Logic to change the body of the NavigationView
              print(index);
            },
            displayMode: PaneDisplayMode.compact,
            items: items,
            footerItems: [
              PaneItem(
                icon: const Icon(FluentIcons.settings),
                title: const Text('Settings'),
                body: const Placeholder(),
              ),
              PaneItem(
                icon: const Icon(FluentIcons.add),
                title: const Text('FAQs'),
                onTap: () {
                  print('FAQs');
                },
                body: const Placeholder(),
              ),
              PaneItem(
                icon: const Icon(FluentIcons.info),
                title: const Text('FAQs'),
                onTap: () {
                  print('FAQs');
                },
                body: const Placeholder(),
              ),
            ],
          ),
        ));
  }
}
