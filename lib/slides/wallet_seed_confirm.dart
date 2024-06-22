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
  ConsumerState<WalletSeedConfirmSlide> createState() =>
      _WalletSeedConfirmSlide();
}

class _WalletSeedConfirmSlide extends ConsumerState<WalletSeedConfirmSlide> {
  List<String> words = [];
  String mnemonicString = '';
  List<FocusNode?> focusNodes = [];
  List<TextEditingController> controllers = [];
  List<int> focusNodeSet = [];
  List<bool> errorNodes = [];
  List<bool> failNodes = [];
  int focusIndex = 0;
  bool error = false;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  void dispose() {
    for (var i = 0; i < words.length; i++) {
      focusNodes[i]?.dispose();
      controllers[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
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
                  'Confirm your wallet generation seed',
                  style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
                ),
                gapH8,
                Text(
                  'Embark with Assurance, your gateway to secure seed generation',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                    color: theme.textColor.withOpacity(0.5),
                  ),
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
                if (words[index] == '') {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: errorNodes[index]
                          ? Colors.red.withOpacity(0.5)
                          : theme.mnemonicWords,
                      borderRadius: BorderRadius.circular(32.0.r),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '${index + 1}. ',
                          style: TextStyle(
                            color: theme.mnemonicText,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        gapW4,
                        Expanded(
                          child: Align(
                            child: EditableText(
                              contentInsertionConfiguration:
                                  ContentInsertionConfiguration(
                                onContentInserted: (text) {
                                  controllers[index].clear();
                                },
                              ),
                              cursorColor: theme.cursorColor,
                              backgroundCursorColor:
                                  Colors.grey.withOpacity(0.5),
                              focusNode: focusNodes[index]!,
                              minLines: 1,
                              style: TextStyle(
                                color: theme.mnemonicText,
                                fontSize: 13.h,
                                fontWeight: FontWeight.w500,
                              ),
                              controller: controllers[index],
                              onChanged: (text) {
                                if (text.length >= 3 &&
                                    (text.endsWith(' ') ||
                                        text.endsWith('\n'))) {
                                  validateInput(index);
                                  requestNextFocus(index);
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
                    padding: const EdgeInsets.only(left: 8),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: focusNodeSet.firstWhereOrNull(
                                        (i) => i == index,
                                      ) !=
                                      null &&
                                  !failNodes[index]
                              ? theme.successWords
                              : theme.mnemonicWords,
                          borderRadius: BorderRadius.circular(32.0.r),
                        ),
                        child: FittedBox(
                          child: Text(
                            '${index + 1}. ${words[index]}',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: theme.mnemonicText,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
        gapH8,
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
                      final data = ClipboardData(text: mnemonicString);
                      Clipboard.setData(data);
                    },
                    child: Row(
                      children: [
                        Icon(
                          FluentIcons.check_mark,
                          color: Colors.green.light,
                        ),
                        gapW4,
                        Text(
                          'Seed is correct'.hardcoded,
                          style: TextStyle(
                            color: Colors.green.light,
                            fontSize: 16.sp,
                          ),
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

  void validateInput(int index) {
    final seed = ref.watch(seedProvider);
    if (controllers[index].text.trim() != seed[index]) {
      setState(() {
        errorNodes[index] = true;
        error = true;
      });
    } else {
      setState(() {
        errorNodes[index] = false;
        failNodes[index] = false;
        error = false;
      });
      words[index] = controllers[index].text.trim();
      final nulls = words.where((element) => element == '').toList();
      if (nulls.isEmpty) {
        _checkMnemonic(seed, words);
      }
    }
  }

  void _checkMnemonic(List<String> ogSeed, List<String> newSeed) {
    const equality = DeepCollectionEquality();

    if (equality.equals(ogSeed, newSeed)) {
      ref.read(nextButtonDisableProvider.notifier).state = false;
    } else {
      setState(() {
        error = true;
      });
    }
  }

  void requestNextFocus(int currentIndex) {
    final nextIndex = focusNodeSet.firstWhereOrNull(
      (index) => index > currentIndex,
    );

    if (nextIndex != null && nextIndex < focusNodes.length) {
      FocusScope.of(context).requestFocus(focusNodes[nextIndex]);
    }
  }

  void _refresh() {
    context.afterBuild(() {
      ref.read(nextButtonDisableProvider.notifier).state = true;
      final stuff = ref.read(seedProvider.notifier).state;
      final random = Random();
      final indicesToHide = <int>{};
      for (var i = 0; i < stuff.length; i++) {
        words.add(stuff[i]);
      }
      final number = stuff.length == 12 ? 4 : 8;

      while (indicesToHide.length < number) {
        final index = random.nextInt(stuff.length);
        indicesToHide.add(index);
      }

      for (final index in indicesToHide) {
        words[index] = '';
      }

      for (var i = 0; i < words.length; i++) {
        final focusNode = FocusNode();
        focusNode.addListener(() {
          if (!focusNode.hasFocus) {
            validateInput(i);
          }
        });
        focusNodes.add(focusNode);
        controllers.add(TextEditingController());
        errorNodes.add(false);
        failNodes.add(true);
        if (words[i] == '') {
          focusNodeSet.add(i);
        }
      }
      setState(() {});
      focusNodes[focusNodeSet.first]?.requestFocus();
    });
  }
}
