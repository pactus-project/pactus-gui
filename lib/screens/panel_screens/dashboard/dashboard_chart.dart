import 'dart:async';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:fluent_ui/fluent_ui.dart' as fi;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pactus/provider/process_provider.dart';
import 'package:pactus/provider/rpc_api/blockchain_grpc_api.dart';
import 'package:pactus/support/extensions.dart';

class DashboardChart extends ConsumerStatefulWidget {
  bool isDark;
  DashboardChart({super.key, required this.isDark});

  @override
  ConsumerState<DashboardChart> createState() => _DashboardChartState();
}

class _DashboardChartState extends ConsumerState<DashboardChart> {
  bool isloading = true;
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
    await ref.read(blockchainInfoProvider.notifier).fetchBlockchainInfo();
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
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
    late LineChartData firstData;
    final blockchain = ref.watch(blockchainInfoProvider);

    FlTitlesData firstTitles = const FlTitlesData(
      leftTitles: AxisTitles(),
      topTitles: AxisTitles(),
      rightTitles: AxisTitles(),
      bottomTitles: AxisTitles(),
    );

    List<FlSpot> flfirstList = [];
    List<double> minBondingHeight = [];
    int committeeValidatorsNum = 0;

    LineChartBarData firstLineBarsData1 = LineChartBarData(
      isCurved: true,
      isStrokeCapRound: true,

      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        color: Color.fromARGB(255, 82, 255, 252).withOpacity(0.05),
      ),
      // color: Color.fromARGB(255, 255, 174, 0),
      barWidth: 1.5,
      // preventCurveOverShooting: true,
      spots: flfirstList,
    );

    // LineChartBarData firstLineBarsData2 = LineChartBarData(
    //   isCurved: true,
    //   isStrokeCapRound: true,
    //   dotData: const FlDotData(show: false),
    //   belowBarData: BarAreaData(
    //     show: true,
    //     color: Color.fromARGB(255, 254, 90, 25).withOpacity(0.05),
    //   ),
    //   color: Color(7314ED),
    //   barWidth: 1.5,
    //   spots: [],
    // );

    List<LineChartBarData> firstLineBarsData = [
      firstLineBarsData1,
      // firstLineBarsData2,
    ];

    blockchain.when(
      data: (data) {
        data.committeeValidators.forEach((e) {
          setState(() {
            minBondingHeight.add(e.lastBondingHeight.toDouble());
            flfirstList.add(
              FlSpot(
                data.committeeValidators.indexOf(e).toDouble(),
                e.lastBondingHeight.toDouble(),
              ),
            );
            committeeValidatorsNum = data.committeeValidators.length;
          });
          minBondingHeight.sort();
        });

        setState(() {
          firstData = LineChartData(
            titlesData: firstTitles,
            lineBarsData: firstLineBarsData,
            borderData: FlBorderData(show: false),
            gridData: const FlGridData(show: false),
            minX: 0,
            lineTouchData: LineTouchData(
              enabled: true,
              touchTooltipData: LineTouchTooltipData(
                  fitInsideHorizontally: true,
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((e) {
                      return LineTooltipItem(
                        flfirstList[e.x.toInt()].y.toString(),
                        GoogleFonts.lexend(fontSize: 11.sp),
                      );
                    }).toList();
                  },
                  getTooltipColor: (touchedSpot) {
                    if (isDarkModelEnabled) {
                      return Colors.white.withOpacity(0.05);
                    } else {
                      return Colors.white70;
                    }
                  },
                  tooltipBorder: BorderSide(
                    color: isDarkModelEnabled
                        ? Colors.white.withOpacity(0.5)
                        : Colors.black.withOpacity(0.5),
                  ),
                  tooltipRoundedRadius: 15.sp),
            ),
            minY: minBondingHeight.reduce(min).toDouble(),
            maxX: committeeValidatorsNum.toDouble(),
            maxY: (minBondingHeight.last + 1200.0).toDouble(),
          );
          isloading = false;
        });
      },
      error: (error, stackTrace) {
        debugPrint(error.toString());
      },
      loading: () {},
    );
    // someData();
    return Container(
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 30.sp),
      decoration: BoxDecoration(
        color: widget.isDark
       ? Colors.white.withOpacity(0.05)
            : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: isloading
          ? const Center(child: CircularProgressIndicator())
          : LineChart(
              firstData,
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 250),
            ),
    );
  }
}
