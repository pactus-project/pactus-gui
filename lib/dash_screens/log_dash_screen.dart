import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pactus/provider/process_provider.dart';

class LogDashScreen extends ConsumerWidget {
  const LogDashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final process = ref.watch(processManagerProvider.notifier);
    bool hasData = false;
    var streamData = StreamBuilder(
      stream: process.output,
      builder: (context, snapshot) {
        // print(snapshot.data.toString());
        if (snapshot.hasData) {
          hasData = true;
          return Text(snapshot.data ?? 'errr');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Node Logs',
              textAlign: TextAlign.left,
              style: GoogleFonts.lexend(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 15.sp),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    hasData ? streamData : Center(child: Text("Fetching Data"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
