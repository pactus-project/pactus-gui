import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pactus/screen_wrapper/wrapper_screen.dart';
import 'package:pactus/screens/dashboard_screen.dart';
import 'package:pactus/screens/init_screen.dart';
import 'package:pactus/screens/unlock_screen.dart';
import 'package:pactus/support/app_sizes.dart';
import 'package:pactus/support/constants.dart';
import 'package:pactus/support/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  static const String route = '/';

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    context.afterBuild(() async {
      final prefs = await SharedPreferences.getInstance();
      final daemonPath = prefs.getString(Constants.daemonPath);
      final dataDirPath = prefs.getString(Constants.dataDirPath);
      final hasPassword = prefs.getBool(Constants.hasPassword);
      if (daemonPath != null && dataDirPath != null) {
        if (context.mounted) {
          if (hasPassword != null && hasPassword) {
            context.go(UnlockScreen.route);
          } else {
            context.go(DashboardScreen.route);
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
        title: "Pactus",
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
                  "assets/images/splash.png",
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fitWidth,
                ),
              )),
              gapH16,
              Text(
                "Welcome to the Future of Blockchain with Pactus!",
                style: FluentTheme.of(context).typography.bodyLarge!.copyWith(fontWeight: FontWeight.w900),
              ),
              gapH24,
              Text(
                "Where the future of blockchain unfolds with trust and transparency in every transaction\n\nJoin us in shaping a decentralized revolution!",
                textAlign: TextAlign.center,
                style: FluentTheme.of(context).typography.body!.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w200),
              ),
              gapH24,
              SizedBox(
                width: 200.w,
                height: 40.h,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Button(
                    onPressed: () {
                      context.go(InitialScreen.route);
                    },
                    style: ButtonStyle(
                      backgroundColor: ButtonState.resolveWith((states) {
                        // If the button is pressed, return size 40, otherwise 20
                        if (states.contains(ButtonStates.hovering)) {
                          return Colors.blue.withOpacity(0.9);
                        }
                        return Colors.blue;
                      }),
                      // padding: ButtonState.all(EdgeInsets.symmetric(horizontal: 32.0.w, vertical: 12.0.h)),
                    ),
                    child: Center(
                        child: Text(
                      "Get Started",
                      style: FluentTheme.of(context).typography.body!.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w800, color: Colors.white),
                    )),
                  ),
                ),
              ),
              gapH24,
            ],
          ),
        ));
  }
}
