import 'dart:async';
import 'package:fluent_ui/fluent_ui.dart' as fi;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pactus/grpc_gen/network.pb.dart';
import 'package:pactus/provider/process_provider.dart';
import 'package:pactus/provider/rpc_api/blockchain_grpc_api.dart';
import 'package:pactus/provider/rpc_api/network_grpc_api.dart';
import 'package:pactus/screens/panel_screens/dashboard/dashboard_chart.dart';
import 'package:pactus/screens/panel_screens/dashboard/top_card.dart';
import 'package:pactus/support/extensions.dart';

class DashBoardScreen extends ConsumerStatefulWidget {
  const DashBoardScreen({super.key});

  @override
  ConsumerState<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends ConsumerState<DashBoardScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    context.afterBuild(() async {
      ref.read(processManagerProvider.notifier).isRunning(); //TODO
      unawaited(_init());
    });
  }

  Future<void> _init() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    await ref.read(networkInfoProvider.notifier).fetchNetworkInfo();
    await ref.read(nodeInfoProvider.notifier).fetchData();
    await ref.read(blockchainInfoProvider.notifier).fetchBlockchainInfo();
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      ref.read(networkInfoProvider.notifier).fetchNetworkInfo();
      ref.read(nodeInfoProvider.notifier).fetchData();
      ref.read(blockchainInfoProvider.notifier).fetchBlockchainInfo();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkModelEnabled = fi.FluentTheme.of(context).brightness.isDark;
    final network = ref.watch(networkInfoProvider);
    final node = ref.watch(nodeInfoProvider);
    final blockchain = ref.watch(blockchainInfoProvider);
    TextStyle headerTextStyle =
        GoogleFonts.lexend(fontSize: 12.spMin, fontWeight: FontWeight.w600);
    TextStyle rowTextStyle =
        GoogleFonts.lexend(fontSize: 11.spMin, fontWeight: FontWeight.w400);
    GetNetworkInfoResponse getNetworkInfoResponse = network.isLoading
        ? GetNetworkInfoResponse()
        : network.value! as GetNetworkInfoResponse;
    return Scaffold(
      backgroundColor:
          isDarkModelEnabled ? const Color(0xFF0F1012) : Colors.white,
      // backgroundColor: Color(0xFF1D1E20),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              blockchain.when(
                data: (data) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TopCard(
                        isDark: isDarkModelEnabled,
                        title: "Committee Validators",
                        subtitle: data.committeeValidators.length,
                        iconData: Iconsax.people,
                      ),
                      // ),
                      TopCard(
                        isDark: isDarkModelEnabled,
                        title: "Total Validators",
                        subtitle: data.totalValidators,
                        iconData: Iconsax.category_2,
                      ),
                      TopCard(
                        isDark: isDarkModelEnabled,
                        title: "Committee Power",
                        subtitle: data.committeePower,
                        iconData: Iconsax.box_2,
                      ),
                      TopCard(
                        isDark: isDarkModelEnabled,
                        title: "Total Power",
                        subtitle: data.totalPower,
                        iconData: Iconsax.crown_1,
                      ),
                    ],
                  );
                },
                error: (obj, sTrace) {
                  return fi.ContentDialog(
                    title: const Text('error occured'),
                    content: Text(obj.toString()),
                  );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              SizedBox(
                height: 40.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Flexible(child: Container()),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(right: 10.sp),
                      height: 400.sp,
                      padding: EdgeInsets.all(20.sp),
                      decoration: BoxDecoration(
                        color: isDarkModelEnabled
                            ? Colors.white.withOpacity(0.05)
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            node.when(
                              data: (d) {
                                var data = d as GetNodeInfoResponse;
                                var nodeStartedAt =
                                    DateTime.fromMillisecondsSinceEpoch(
                                        data.startedAt.toInt() * 1000);
                                var nodeAgent = data.agent.split('/');
                                return DataTable(
                                  columns: const [
                                    DataColumn(label: Text('Node Info')),
                                    DataColumn(label: Text('')),
                                  ],
                                  horizontalMargin: 10,
                                  border: TableBorder(
                                    horizontalInside: BorderSide(
                                      width: 0.5,
                                      color: isDarkModelEnabled
                                          ? Colors.white.withOpacity(0.05)
                                          : Colors.grey.shade200,
                                    ),
                                  ),
                                  columnSpacing: 5,
                                  dataTextStyle: rowTextStyle,
                                  headingTextStyle: headerTextStyle,
                                  rows: [
                                    DataRow(
                                      cells: [
                                        DataCell(Text('Moniker')),
                                        DataCell(Text(data.moniker))
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        DataCell(Text('Agent')),
                                        DataCell(
                                            Text(nodeAgent[0].split('=')[1]))
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        DataCell(Text("Network")),
                                        DataCell(
                                          Text(getNetworkInfoResponse
                                              .networkName
                                              .toString()),
                                        ),
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        const DataCell(Text('Node Started At')),
                                        DataCell(
                                          Text(nodeStartedAt.toString()),
                                        )
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        DataCell(Text('Node Version')),
                                        DataCell(
                                          Text(nodeAgent[1].split('=')[1]),
                                        )
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        DataCell(Text('Protocol Version')),
                                        DataCell(
                                          Text(nodeAgent[2].split('=')[1]),
                                        )
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        DataCell(Text('OS')),
                                        DataCell(
                                          Text(nodeAgent[3].split('=')[1]),
                                        )
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        DataCell(Text('Architecture')),
                                        DataCell(
                                          Text(nodeAgent[4].split('=')[1]),
                                        )
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        DataCell(
                                          Text("Connected Peers"),
                                        ),
                                        DataCell(
                                          Text(getNetworkInfoResponse
                                              .connectedPeers.length
                                              .toString()),
                                        )
                                      ],
                                    ),
                                  ],
                                );
                              },
                              error: (obj, sTrace) {
                                return fi.ContentDialog(
                                  title: const Text('error occured'),
                                  content: Text(obj.toString()),
                                );
                              },
                              loading: () {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Flexible(flex:1,child: Container()),
                  Expanded(
                    flex: 5,
                    child: Container(
                        margin: EdgeInsets.only(left: 10.sp),
                        height: 400.sp,
                        padding: EdgeInsets.all(15.sp),
                        decoration: BoxDecoration(
                          color: isDarkModelEnabled
                              ? Colors.white.withOpacity(0.05)
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: blockchain.when(
                          data: (data) {
                            return SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: DataTable(
                                  horizontalMargin: 10,
                                  columnSpacing: 30,
                                  border: TableBorder(
                                      horizontalInside: BorderSide(
                                    width: 0.5,
                                    color: isDarkModelEnabled
                                        ? Colors.grey.shade900
                                        : Colors.grey.shade500,
                                  )),
                                  columns: [
                                    DataColumn(
                                      label: Text("Validator Address",
                                          style: headerTextStyle),
                                    ),
                                    DataColumn(
                                      numeric: true,
                                      label:
                                          Text("Stake", style: headerTextStyle),
                                    ),
                                    DataColumn(
                                      numeric: true,
                                      label: Text("Availability",
                                          style: headerTextStyle),
                                    ),
                                  ],
                                  rows: data.committeeValidators
                                      .map(
                                        (e) => DataRow(
                                          cells: [
                                            DataCell(
                                              Text(
                                                e.address.trim(),
                                                style: rowTextStyle,
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                e.stake
                                                    .toInt()
                                                    .ceil()
                                                    // .numberOfTrailingZeros()
                                                    .toString(),
                                                style: rowTextStyle,
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                e.availabilityScore
                                                    .toStringAsFixed(3)
                                                    .toString(),
                                                style: rowTextStyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                      // .toList()
                                      // .getRange(0, 10)
                                      .toList(),
                                ),
                              ),
                            );
                          },
                          error: (obj, sTrace) {
                            return fi.ContentDialog(
                              title: const Text('error occured'),
                              content: Text(obj.toString()),
                            );
                          },
                          loading: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        )),
                  ),
                  // Flexible(child: Container()),
                ],
              ),
              SizedBox(height: 20.sp),
              DashboardChart(
                isDark: isDarkModelEnabled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
