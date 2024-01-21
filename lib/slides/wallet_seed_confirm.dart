import 'dart:math';

import 'package:collection/collection.dart';
import 'package:fluent_ui/fluent_ui.dart';
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
  List<FocusNode?> focusNodes = [];
  List<TextEditingController> controllers = [];
  List<int> focusNodeSet = [];
  List<bool> errorNodes = [];
  List<bool> failNodes = [];
  int focusIndex = 0;
  var error = false;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  void dispose() {
    for (int i = 0; i < words.length; i++) {
      focusNodes[i]?.dispose();
      controllers[i].dispose();
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
          height: words.length == 12 ? 120.h : 250.h,
          margin: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 6.0.h),
          padding: EdgeInsets.all(12.0.sp),
          decoration: BoxDecoration(
            color: theme.fieldBackground,
            borderRadius: BorderRadius.circular(8.0.r),
          ),
          width: MediaQuery.sizeOf(context).width,
          child: Center(
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: focusNodes.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6, // number of items in each row
                  mainAxisSpacing: 17.h, // spacing between rows
                  crossAxisSpacing: 4.0.w, // spacing between columns
                  mainAxisExtent: 30.0.h, // row height
                ),
                itemBuilder: (ctx, index) {
                  if (words[index] == "") {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: errorNodes[index] == true
                                ? Colors.red.withOpacity(0.5)
                                : theme.mnemonicWords,
                        borderRadius: BorderRadius.circular(32.0.r),
                      ),
                      child: Row(
                        children: [
                          Text("${index + 1}. ", style: TextStyle(color: theme.mnemonicText, fontSize: 18.sp, fontWeight: FontWeight.w900)),
                          gapW4,
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: TextBox(
                                padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 4.h),
                                focusNode: focusNodes[index],
                                enabled: failNodes[index],
                                expands: true,
                                minLines: null,
                                maxLines: null,
                                highlightColor: Colors.transparent,
                                style: TextStyle(color: theme.mnemonicText, fontSize: 13.h, fontWeight: FontWeight.w900),
                                controller: controllers[index],
                                onChanged: (text) {
                                  if (text.length >= 3 && (text.endsWith(' ') || text.endsWith('\n'))) {
                                    if (text.trim().compareTo(seed[index]) == 0) {
                                      setState(() {
                                        errorNodes[index] = false;
                                        failNodes[index] = false;
                                        error = false;
                                      });
                                      words[index] = text.trim();
                                      requestNextFocus(index);
                                    } else {
                                      controllers[index].clear();
                                      setState(() {
                                        errorNodes[index] = true;
                                        error = true;
                                      });
                                    }
                                    var nulls = words.where((element) => element == "").toList();
                                    if (nulls.isEmpty) {
                                      _checkMnemonic(seed, words);
                                    }
                                  }
                                },
                              ),
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
                                  color:  focusNodeSet.firstWhereOrNull(
                                        (i) => i == index,
                                  ) != null && failNodes[index] == false
                                      ? theme.successWords
                                      : theme.mnemonicWords,
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
        Visibility(
          visible: !ref.watch(nextButtonDisableProvider.notifier).state,
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
                        Icon(FluentIcons.check_mark, color: Colors.green.light,),
                        gapW4,
                        Text(
                          "Seed is correct".hardcoded,
                          style: TextStyle(color: Colors.green.light, fontSize: 16.sp),
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

  void _checkMnemonic(List<String> ogSeed, List<String> newSeed) {
    const DeepCollectionEquality equality = DeepCollectionEquality();

    if (equality.equals(ogSeed, newSeed)) {
      ref.read(nextButtonDisableProvider.notifier).state = false;
    } else {
      setState(() {
        error = true;
      });
    }
  }

  void requestNextFocus(int currentIndex) {
    int? nextIndex = focusNodeSet.firstWhereOrNull(
          (index) => index > currentIndex,
    );

    if (nextIndex != null && nextIndex < focusNodes.length) {
      FocusScope.of(context).requestFocus(focusNodes[nextIndex]);
    }
  }


  void _refresh() {
    context.afterBuild(() {
      ref.read(nextButtonDisableProvider.notifier).state = true;
      var stuff = ref.read(seedProvider.notifier).state;
      final random = Random();
      final indicesToHide = <int>{};
      for (int i = 0; i < stuff.length; i++) {
        words.add(stuff[i]);
      }
      var number = stuff.length == 12 ? 4 : 8;

      while (indicesToHide.length < number) {
        int index = random.nextInt(stuff.length);
        indicesToHide.add(index);
      }

      for (int index in indicesToHide) {
        words[index] = "";
      }

      for (int i = 0; i < words.length; i++) {
        focusNodes.add(FocusNode());
        controllers.add(TextEditingController());
        errorNodes.add(false);
        failNodes.add(true);
        if (words[i] == "") {
          focusNodeSet.add(i);
        }
      }
      setState(() {});
      focusNodes[focusNodeSet.first]?.requestFocus();
    });
  }
}
