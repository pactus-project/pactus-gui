import 'dart:async';
import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pactus/provider/grpc_provider.dart';
import 'package:pactus/provider/pid_provider.dart';
import 'package:pactus/screen_wrapper/wrapper_screen.dart';
import 'package:pactus/support/app_sizes.dart';
import 'package:pactus/support/constants.dart';
import 'package:pactus/support/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  static const String route = '/dashboard';

  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    context.afterBuild(() async {
      int? pid = ref.read(pidProvider.notifier).state;
      Process? p = ref.read(processProvider.notifier).state;
      if (pid == null || p == null) {
        _restartDaemon();
      } else {
        context.afterBuild(() {
          _init();
        });
      }
    });
  }

  _init() async {
    await Future.delayed(const Duration(seconds: 2));
    ref.read(networkInfoProvider.notifier).fetchNetworkInfo();
    ref.read(nodeInfoProvider.notifier).fetchNetworkInfo();
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      ref.read(networkInfoProvider.notifier).fetchNetworkInfo();
      ref.read(nodeInfoProvider.notifier).fetchNetworkInfo();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  int paneIndex = 0;

  @override
  Widget build(BuildContext context) {
    var network = ref.watch(networkInfoProvider);
    var nodeInfo = ref.watch(nodeInfoProvider);
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
            },
            displayMode: PaneDisplayMode.compact,
            items: [
              PaneItem(
                icon: const Icon(FluentIcons.home_solid),
                title: const Text('Dashboard'),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const Text("Welcome to Pactus", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    const Text("Your one stop shop for all your crypto needs", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                    const SizedBox(height: 20),
                    const Text("Get started by creating a new wallet or importing an existing one", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                    const SizedBox(height: 20),
                    const Text("You can also view your transactions and manage your wallet", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                    const SizedBox(height: 20),
                    const Text("If you need help, check out the FAQs or reach out to us", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                    const SizedBox(height: 20),
                    network.when(
                      data: (networkInfo) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Connected Peers: ${networkInfo.connectedPeersCount}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                            gapH16,
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: networkInfo.connectedPeers.length,
                                itemBuilder: (ctx, index) {
                                  return Text("Peer $index: ${networkInfo.connectedPeers[index].address}", textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300));
                                }),
                          ],
                        );
                      },
                      loading: () => const ProgressRing(),
                      error: (e, s) => Text("Error: $e"),
                    ),
                  ],
                ),
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
            ],
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

  void _restartDaemon() async {
    final prefs = await SharedPreferences.getInstance();
    final daemonPath = prefs.getString(Constants.daemonPath);
    final dataDirPath = prefs.getString(Constants.dataDirPath);
    if (daemonPath != null && dataDirPath != null) {
      if (Platform.isLinux || Platform.isMacOS) {
        List<String> param = ["-w", dataDirPath];
         Process? res = await Process.start(daemonPath, ["start", ...param]);
        int pid = res.pid;
        ref.read(pidProvider.notifier).state = pid;
        ref.read(processProvider.notifier).state = res;
      } else {
        Directory directoryExe = Directory(daemonPath);
        List<FileSystemEntity> files = directoryExe.listSync();
        Process? res;
        for (FileSystemEntity file in files) {
          if (file.path.contains("pactus-daemon.exe")) {
            List<String> param = ["-w", dataDirPath];
            res = await Process.start(file.path, ["start", ...param]);
            int pid = res.pid;
            ref.read(pidProvider.notifier).state = pid;
            ref.read(processProvider.notifier).state = res;
          }
        }
      }
    }
  }
}
