import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pactus/provider/theme_provider.dart';
import 'package:pactus/screens/dashboard_wrapper.dart';
import 'package:pactus/support/app_sizes.dart';

class FinishSlide extends ConsumerStatefulWidget {
  const FinishSlide({super.key});

  @override
  ConsumerState<FinishSlide> createState() => _FinishSlide();
}

class _FinishSlide extends ConsumerState<FinishSlide> {
  final controller = TextEditingController();
  List<int> dropDown = [7, 10, 15, 20, 25, 32];
  int defaultDropDown = 7;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    return Padding(
      padding: EdgeInsets.only(top: 40.0.h),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        child: SingleChildScrollView(
          child: Flex(
            direction: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Journey Finalized, Your Success on the Horizon',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: theme.textColor.withOpacity(0.7),
                      ),
                    ),
                    gapH16,
                    Text(
                      '''Venturing into the realm of blockchain technology, Pactus heralds an era of uncompromised decentralization that stands in contrast to its contemporaries. It eschews traditional power hierarchies, parting ways with delegated proof-of-stake systems and mining operations that could lead to power concentration. By doing so, Pactus lowers its ramparts, inviting participants from all walks of life to join as equals in maintaining the network. Within this communal tapestry, every user has the opportunity to operate as a validator client, contributing to the network’s invulnerability to control or censorship, ensuring the platform’s integrity and autonomy. Pactus isn’t just revolutionizing the structure of blockchain governance; it’s also remapping the user experience. Crafted with the conviction that blockchain should be accessible to all, thePactus chain boasts a simple yet sophisticated graphical user interface (GUI) that demystifies the process of running a node. The elegance lies in its simplicity - a clear, approachable design that veils the robust and intricate mechanics beneath, allowing users, regardless of their technical prowess, to participate as validator clients. This move towards inclusivity transforms users from mere participants to guardians of the blockchain, an essential facet of the Pactus ecosystem.''',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: theme.textColor.withOpacity(0.6),
                        fontWeight: FontWeight.w400,
                        height: 1.5.sp,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    gapH64,
                    Center(
                      child: Button(
                        style: ButtonStyle(
                          padding: ButtonState.all(
                            EdgeInsets.symmetric(
                              horizontal: 20.0.w,
                              vertical: 6.0.h,
                            ),
                          ),
                          backgroundColor: ButtonState.resolveWith((states) {
                            if (states.contains(ButtonStates.hovering)) {
                              return Colors.blue.withOpacity(0.8);
                            }
                            return const Color(0xFF0066B4);
                          }),
                        ),
                        child: Text(
                          'Go to dashboard',
                          style: TextStyle(
                            color: theme.isLightTheme(context)
                                ? Colors.black
                                : Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                        onPressed: () {
                          context.go(DashboardScreenWrapper.route);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(top: 60.0.h),
                  child: Image.asset(
                    'assets/images/gift.png',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
