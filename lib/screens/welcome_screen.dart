import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pactus/provider/validator_provider.dart';
import 'package:pactus/screen_wrapper/wrapper_screen.dart';
import 'package:pactus/screens/dashboard_wrapper.dart';
import 'package:pactus/screens/init_screen.dart';
import 'package:pactus/screens/unlock_screen.dart';
import 'package:pactus/support/app_sizes.dart';
import 'package:pactus/support/constants.dart';
import 'package:pactus/support/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  static const String route = '/';

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    context.afterBuild(() async {
      final prefs = await SharedPreferences.getInstance();
      final daemonPath = prefs.getString(Constants.daemonPath);
      if (daemonPath != null) {
        final dataDirPath = prefs.getString(Constants.dataDirPath);
        final directoryExe = Directory(dataDirPath!);
        if (!directoryExe.existsSync()) {
          await prefs.remove(Constants.daemonPath);
          await prefs.remove(Constants.dataDirPath);
          await prefs.remove(Constants.hasPassword);

          final alert = ContentDialog(
            title: const Text('Error'),
            content: const Text(
                'Data directory does not exist or has been deleted. Please reinitialize the application'),
            actions: [
              Button(
                onPressed: () {
                  context.go(InitialScreen.route);
                },
                child: const Text('OK'),
              ),
            ],
          );
          if (context.mounted) {
            await showDialog(
              context: context,
              builder: (BuildContext context) => alert,
            );
          }
        }
        ref.read(dataPathProvider.notifier).state = dataDirPath;
        final hasPassword = prefs.getBool(Constants.hasPassword);
        if (daemonPath.isNotEmpty && dataDirPath.isNotEmpty) {
          if (context.mounted) {
            if (hasPassword != null && hasPassword) {
              context.go(UnlockScreen.route);
            } else {
              context.go(DashboardScreenWrapper.route);
            }
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return WrapperPage(
      title: 'Pactus',
      content: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            gapH24,
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(right: 120.0.w),
              child: Image.asset(
                'assets/images/splash.png',
                filterQuality: FilterQuality.high,
                fit: BoxFit.fitWidth,
              ),
            )),
            gapH16,
            Text(
              'Welcome to the Future of Blockchain with Pactus!',
              style: FluentTheme.of(context).typography.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                  ),
            ),
            gapH24,
            Text(
              'Where the future of blockchain unfolds with trust and transparency in every transaction\n\nJoin us in shaping a decentralized revolution!',
              textAlign: TextAlign.center,
              style: FluentTheme.of(context)
                  .typography
                  .body!
                  .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w200),
            ),
            gapH24,
            SizedBox(
              width: 170.w,
              height: 35.h,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Button(
                  onPressed: () {
                    context.go(InitialScreen.route);
                  },
                  style: ButtonStyle(
                    backgroundColor: ButtonState.resolveWith((states) {
                      if (states.contains(ButtonStates.hovering)) {
                        return Colors.blue.withOpacity(0.9);
                      }
                      return Colors.blue;
                    }),
                  ),
                  child: Center(
                    child: Text(
                      'Get Started',
                      style: FluentTheme.of(context).typography.body!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ),
            ),
            gapH24,
          ],
        ),
      ),
    );
  }
}
