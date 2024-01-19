import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pactus/provider/slides_provider.dart';
import 'package:pactus/provider/theme_provider.dart';
import 'package:pactus/slides/initialize_mode.dart';
import 'package:pactus/slides/wallet_seed.dart';

import '../screen_wrapper/wrapper_screen.dart';

class InitialScreen extends ConsumerStatefulWidget {
  static const String route = '/init';

  const InitialScreen({super.key});

  @override
  ConsumerState<InitialScreen> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<InitialScreen> {
  final List<String> listEntries = <String>['Initialize mode', 'Wallet seed', 'Confirm seed', 'Wallet seed restore', 'Wallet password', 'Number of validators', 'Node info', 'Finish'];

  List<Widget> slides = [
    const InitializeModeSlide(key: ValueKey<String>('Initialize mode'),),
    const WalletSeedSlide(key: ValueKey<String>('Wallet seed'),),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final theme = ref.watch(appThemeProvider);
    var slideIndex = ref.watch(slideProvider);
    return WrapperPage(
        title: "Pactus",
        content: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                //list
                Container(
                  width: 280.w,
                  // color: const Color(0xFF252F45),
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 24.0, vertical: 24.0),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: listEntries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListEntry(
                        title: listEntries[index],
                        selected: index <= slideIndex,
                      );
                    },
                  ),
                ),
                Container(
                  height: height,
                  width: 1,
                  color: theme.separator,
                ),
                // Content
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding:  EdgeInsetsDirectional.symmetric(horizontal: 30.0.w, vertical: 30.0.h),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500), // Set your desired animation duration
                            transitionBuilder: (Widget child, Animation<double> animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            child: slides[slideIndex], // Your slide widget here
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: double.infinity,
                            height: 80.h,
                            color: theme.buttonBar,
                            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20.0, vertical: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Button(
                                  child: Text(slideIndex == 0 ? 'Cancel' : 'Back'),
                                  onPressed: () {
                                    if (slideIndex == 0) {
                                      // context.go(WrapperPage.routeName);
                                      //quit the app
                                    } else {
                                      setState(() {
                                        ref.read(slideProvider.notifier).state = (slideIndex - 1) % slides.length;
                                      });
                                    }
                                  },
                                ),
                                Button(
                                  child: const Text('Next'),
                                  onPressed: () {
                                    setState(() {
                                      ref.read(slideProvider.notifier).state = (slideIndex + 1) % slides.length;
                                    });
                                  },
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                  // Your buttons or gestures to change the slide index
                )
              ],
            ))
          ],
        ));
  }
}

class ListEntry extends StatelessWidget {
  final String title;
  final bool selected;

  const ListEntry({super.key, required this.title, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Opacity(opacity: selected ? 1.0 : 0.2, child: Text(title, style: FluentTheme.of(context).typography.body!.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w300))),
      ),
    );
  }
}
