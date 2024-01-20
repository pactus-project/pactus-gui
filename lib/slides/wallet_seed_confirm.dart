import 'dart:math';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pactus/provider/button_control_provider.dart';
import 'package:pactus/provider/seed_provider.dart';
import 'package:pactus/provider/theme_provider.dart';
import 'package:pactus/support/app_sizes.dart';
import 'package:pactus/support/extensions.dart';

class WalletSeedConfirmSlide extends ConsumerStatefulWidget {
  const WalletSeedConfirmSlide({super.key});

  @override
  ConsumerState<WalletSeedConfirmSlide> createState() => _WalletSeedConfirmSlide();
}

class _WalletSeedConfirmSlide extends ConsumerState<WalletSeedConfirmSlide> {
  List<String> words = [];
  String mnemonicString = "";
  List<FocusNode> focusNodes = [];
  int focusIndex = 0;
  var error = false;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  void dispose() {
    for (var element in focusNodes) {
      try {
        element.dispose();
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final seed = ref.watch(seedProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Confirm your wallet generation seed",
                  style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
                ),
                gapH8,
                Text(
                  "Embark with Assurance, your gateway to secure seed generation",
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300, color: theme.textColor.withOpacity(0.5)),
                ),
              ],
            ),
          ],
        ),
        gapH32,
        Container(
          height: 250.h,
          margin: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 6.0.h),
          padding: EdgeInsets.all(12.0.sp),
          decoration: BoxDecoration(
            color: theme.fieldBackground,
            borderRadius: BorderRadius.circular(8.0.r),
          ),
          width: MediaQuery.sizeOf(context).width,
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: words.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6, // number of items in each row
                mainAxisSpacing: 17.h, // spacing between rows
                crossAxisSpacing: 4.0.w, // spacing between columns
                mainAxisExtent: 30.0.h, // row height
              ),
              itemBuilder: (ctx, index) {
                if (words[index] == "") {
                  var node = FocusNode();
                  focusNodes.add(node);
                  // focusIndex++;
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: theme.mnemonicWords,
                      borderRadius: BorderRadius.circular(32.0.r),
                    ),
                    child: Row(
                      children: [
                        Text("${index + 1}. ", style: TextStyle(color: theme.mnemonicText, fontSize: 20.sp, fontWeight: FontWeight.w900)),
                        gapW4,
                        Expanded(
                          child: TextBox(
                            focusNode: node,
                            highlightColor: Colors.transparent,
                            style: TextStyle(color: theme.mnemonicText, fontSize: 18.sp, fontWeight: FontWeight.w900),
                            controller: TextEditingController(text: ""),
                            onChanged: (text) {
                              if (text.length > 3 && (text.endsWith(' ') || text.endsWith('\n'))) {
                                var nulls = words.where((element) => element == "").toList();
                                if (nulls.length == 1) {
                                  _checkMnemonic(seed, words);
                                } else {
                                  setState(() {
                                    words[index] = text.trim();
                                    focusNodes[focusIndex].dispose();
                                    focusIndex++;
                                    focusNodes[focusIndex].requestFocus();
                                  });
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                      padding: const EdgeInsets.only(left: 8.0),
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                color: theme.mnemonicWords,
                                borderRadius: BorderRadius.circular(32.0.r),
                              ),
                              child: Text(
                                "${index + 1}. ${words[index]}",
                                textAlign: TextAlign.start,
                                style: TextStyle(color: theme.mnemonicText, fontSize: 20.sp, fontWeight: FontWeight.w900),
                              ))));
                }
              }),
        ),
        gapH8,
        Visibility(
          visible: error,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0.w),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      ClipboardData data = ClipboardData(text: mnemonicString);
                      Clipboard.setData(data);
                    },
                    child: Row(
                      children: [
                        Icon(FluentIcons.error, color: Colors.red.light,),
                        gapW4,
                        Text(
                          "Seed is incorrect".hardcoded,
                          style: TextStyle(color: Colors.red.light, fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        gapW12,
        const Spacer(),
      ],
    );
  }

  void _checkMnemonic(List<String> ogSeed, newSeed) {
    //compare the two seeds
    // ref.read(nextButtonDisableProvider.notifier).state = false; //TODO: remove this
    if (ogSeed == newSeed) {
      ref.read(nextButtonDisableProvider.notifier).state = false;
    } else {
      _refresh();
      setState(() {
        error = true;
      });
    }
  }

  void _refresh() {
    context.afterBuild(() {
      words.clear();
      focusNodes.clear();
      ref.read(nextButtonDisableProvider.notifier).state = true;
      var stuff = ref.read(seedProvider.notifier).state;
      final random = Random();
      final indicesToHide = <int>{};
      for (int i = 0; i < stuff.length; i++) {
        words.add(stuff[i]);
      }
      while (indicesToHide.length < 8) {
        int index = random.nextInt(stuff.length);
        indicesToHide.add(index);
      }

      for (int index in indicesToHide) {
        words[index] = "";
      }
      setState(() {});
      Future.delayed(const Duration(milliseconds: 100), () => focusNodes[0].requestFocus());
      // focusNodes[0].requestFocus();
    });
  }
}
