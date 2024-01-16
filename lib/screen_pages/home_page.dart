import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pactus/provider/theme_provider.dart';
import 'package:pactus/screens/wrapper_screen.dart';
import 'package:pactus/support/app_sizes.dart';

class HomePage extends ConsumerStatefulWidget {
  static const String route = '/';

  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final List<String> listEntries = <String>['Initialize mode', 'Wallet seed', 'Confirm seed', 'Wallet seed restore', 'Wallet password', 'Number of validators', 'Node info', 'Finish'];
  List<bool> radioValues = [true, false];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final theme = ref.watch(appThemeProvider);
    return WrapperPage(
        title: "Pactus",
        content: Column(
          children: [
            gapH32,
            Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: EdgeInsets.only(left: 45.0.w),
                  child: Text(
                    "Setup Pactus",
                    style: FluentTheme.of(context).typography.bodyLarge!.copyWith(fontSize: 24.sp, fontWeight: FontWeight.w600),
                  ),
                )),
            gapH16,
            Container(
              height: 1,
              width: width,
              color: theme.separator,
            ),
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
                        selected: index == 0,
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
                      children: [
                        Padding(
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 50.0, vertical: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "How to create you wallet?",
                            style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
                          ),
                          gapH8,
                          Text(
                            "If you running a node for first time, choose the first options",
                            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300),
                          ),
                          gapH32,
                          gapH8,
                          Padding(
                            padding: EdgeInsets.only(left: 12.0.w),
                            child: SizedBox(
                              height: 22.sp,
                              child: Row(
                                children: [
                                  RadioButton(
                                    checked: radioValues[0],
                                    onChanged: (state) {
                                      setState(() {
                                        radioValues = [true, false];
                                      });
                                    },
                                  ),
                                  gapW12,
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          radioValues = [true, false];
                                        });
                                      },
                                      child: Text("Create new wallet from scratch", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300)))
                                ],
                              ),
                            ),
                          ),
                          gapH24,
                          Padding(
                            padding: EdgeInsets.only(left: 12.0.w),
                            child: SizedBox(
                              height: 22.sp,
                              child: Row(
                                children: [
                                  RadioButton(
                                    checked: radioValues[1],
                                    onChanged: (state) {
                                      setState(() {
                                        radioValues = [false, true];
                                      });
                                    },
                                  ),
                                  gapW12,
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          radioValues = [false, true];
                                        });
                                      },
                                      child: Text("Restore a wallet from seed phrase", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300)))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Align(
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
                                    child: const Text('Cancel'),
                                    onPressed: () {},
                                  ),
                                  Button(
                                    child: const Text('Next'),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ))),
                  ],
                    ))
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
