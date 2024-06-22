import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pactus/dash_screens/log_dash_screen.dart';
import 'package:pactus/screen_wrapper/wrapper_screen.dart';
import 'package:pactus/screens/panel_screens/dashboard/dashboard_screen.dart';
import 'package:pactus/screens/panel_screens/transactions/transactions_screen.dart';
import 'package:pactus/screens/panel_screens/wallet/wallet_screen.dart';

class DashboardScreenWrapper extends StatefulWidget {
  const DashboardScreenWrapper({super.key});

  static const String route = '/dashboard';

  @override
  State<DashboardScreenWrapper> createState() => _DashboardScreenWrapperState();
}

class _DashboardScreenWrapperState extends State<DashboardScreenWrapper> {
  int paneIndex = 0;
  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    return WrapperPage(
      title: 'Pactus',
      content: NavigationView(
        onDisplayModeChanged: (value) {
          if (value.name == 'open') {
            setState(() {
            isDrawerOpen = true;
            });
          } else{
            setState(() {
            isDrawerOpen = false;
            });
          }
        },
        pane: NavigationPane(
          header: Text('PACTUS', style: GoogleFonts.lexend()),
          size: NavigationPaneSize(openMaxWidth: 300.w),
          selected: paneIndex,
          onChanged: (index) {
            setState(() {
              paneIndex = index;
            });
          },
          displayMode: PaneDisplayMode.compact,
          items: [
            PaneItem(
              icon: const Icon(
                Iconsax.home_1,
                size: 18,
              ),
              title: const Text('Dashboard'),
              body: ScreenUtilInit(
                  minTextAdapt: true,
                  splitScreenMode: true,
                  designSize: Size(
                    // isDrawerOpen
                        // ? (MediaQuery.of(context).size.width + 150.0)
                        MediaQuery.of(context).size.width+100,
                    MediaQuery.of(context).size.height,
                  ),
                  child: const DashBoardScreen()),
            ),
            // PaneItemSeparator(),
            PaneItem(
              icon: const Icon(
                Iconsax.money,
                size: 18,
              ),
              title: const Text('Transactions'),
              // infoBadge: const InfoBadge(source: Text('8')),
              body: const TransactionScreen(),
            ),
            PaneItem(
              icon: const Icon(
                Iconsax.wallet_1,
                size: 18,
              ),
              title: const Text('Wallet'),
              body: const UserWalletScreen(),
            ),
            PaneItem(
              icon: const Icon(
                Iconsax.code,
                size: 18,
              ),
              title: const Text('Node Logs'),
              body: const LogDashScreen(),
            ),
          ],
          footerItems: [
            PaneItem(
              icon: const Icon(
                Iconsax.setting_2,
                size: 18,
              ),
              title: Text('Settings'),
              body: const Placeholder(),
            ),
            PaneItem(
              icon: const Icon(
                Iconsax.book,
                size: 18,
              ),
              title: Text('FAQs'),
              onTap: () {
                print('FAQs');
              },
              body: const Placeholder(),
            ),
            PaneItem(
              icon: const Icon(
                Iconsax.information,
                size: 18,
              ),
              title: Text('Application Info'),
              onTap: () {
                print('FAQs');
              },
              body: const Placeholder(),
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> _restartDaemon() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final daemonPath = prefs.getString(Constants.daemonPath);
  //   final dataDirPath = prefs.getString(Constants.dataDirPath);
  //   if (daemonPath != null && dataDirPath != null) {
  //     if (Platform.isLinux || Platform.isMacOS) {
  //       final param = <String>['-w', dataDirPath];
  //       final res = await Process.start(daemonPath, ['start', ...param]);
  //       final pid = res.pid;
  //       ref.read(pidProvider.notifier).state = pid;
  //       ref.read(processProvider.notifier).state = res;
  //     } else {
  //       final directoryExe = Directory(daemonPath);
  //       final files = directoryExe.listSync();
  //       Process? res;
  //       print("PATH================"+dataDirPath);
  //       for (final file in files) {
  //         if (file.path.contains('pactus-daemon.exe')) {
  //           final param = <String>['-w', dataDirPath];
  //           res = await Process.start(file.path, ['start', ...param]);
  //           final pid = res.pid;
  //           ref.read(pidProvider.notifier).state = pid;
  //           ref.read(processProvider.notifier).state = res;
  //         }
  //       }
  //     }
  //   }
  // }
}
