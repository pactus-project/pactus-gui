import 'package:bip39_mnemonic/bip39_mnemonic.dart';
import 'package:collection/collection.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pactus/provider/button_control_provider.dart';
import 'package:pactus/provider/theme_provider.dart';
import 'package:pactus/support/app_sizes.dart';
import 'package:pactus/support/extensions.dart';

class WalletSeedRestoreSlide extends ConsumerStatefulWidget {
  const WalletSeedRestoreSlide({super.key});

  @override
  ConsumerState<WalletSeedRestoreSlide> createState() =>
      _WalletSeedRestoreSlide();
}

class _WalletSeedRestoreSlide extends ConsumerState<WalletSeedRestoreSlide> {
  List<String> words = [];
  String mnemonicString = '';
  List<FocusNode?> focusNodes = [];
  List<TextEditingController> controllers = [];
  List<int> focusNodeSet = [];
  List<bool> errorNodes = [];
  List<bool> failNodes = [];
  int focusIndex = 0;
  bool error = false;

  List<int> dropDown = [24, 12];
  int defaultDropDown = 24;

  @override
  void initState() {
    super.initState();
    _refresh(24);
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
    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: MediaQuery.of(context).size.height,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Restoration Seed',
                      style: TextStyle(
                          fontSize: 22.sp, fontWeight: FontWeight.w600),
                    ),
                    gapH8,
                    Text(
                      'Restoration Seed, Your Key to Digital Resilience and Recovery',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300,
                        color: theme.textColor.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: DropDownButton(
                    closeAfterClick: false,
                    title: Text(
                      '$defaultDropDown words',
                      style: TextStyle(color: theme.textColor.withOpacity(0.4)),
                    ),
                    items: dropDown
                        .map(
                          (e) => MenuFlyoutItem(
                            text: Text(
                              '${e}word',
                              style: TextStyle(
                                color: theme.textColor.withOpacity(0.4),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                defaultDropDown = e;
                                _refresh(e);
                              });
                            },
                          ),
                        )
                        .toList(),
                  ),
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
                            horizontal: 16.0.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: errorNodes[index]
                              ? Colors.red.withOpacity(0.5)
                              : theme.mnemonicWords,
                          borderRadius: BorderRadius.circular(32.0.r),
                        ),
                        child: Row(
                          children: [
                            FittedBox(
                              child: Text(
                                '${index + 1}. ',
                                style: TextStyle(
                                  color: theme.mnemonicText,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            gapW4,
                            Expanded(
                              child: Align(
                                child: Flexible(
                                  child: EditableText(
                                    focusNode: focusNodes[index]!,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp('[a-z A-Z \n \t \v]'),
                                      ),
                                    ],
                                    // enabled: failNodes[index],
                                    expands: true,
                                    maxLines: null,
                                    // highlightColor: Colors.transparent,
                                    style: TextStyle(
                                      color: theme.mnemonicText,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
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
                                    cursorColor: theme.cursorColor,
                                    backgroundCursorColor:
                                        Colors.grey.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            // errorNodes[index] = true;
                            failNodes[index] = true;
                          });
                          controllers[index].clear();
                          words[index] = '';
                          focusNodeSet.add(index);
                          focusNodes[index]?.requestFocus();
                        },
                        child: Container(
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
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w900,
                                  ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.0.w),
                  child: Text(
                    'Please confirm your entry by pressing enter or spacebar'
                        .hardcoded,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: theme.textColor.withOpacity(0.5),
                    ),
                  ),
                ),
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
                              final data = ClipboardData(text: mnemonicString);
                              Clipboard.setData(data);
                            },
                            child: Row(
                              children: [
                                Icon(
                                  FluentIcons.error,
                                  color: Colors.red.light,
                                ),
                                gapW4,
                                Text(
                                  'Seed is incorrect'.hardcoded,
                                  style: TextStyle(
                                    color: Colors.red.light,
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
              ],
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
        ),
      ),
    );
  }

  void _confirmMnemonic(List<String> seed) {
    try {
      Mnemonic.fromSentence(seed.join(' '), Language.english);
      ref.read(nextButtonDisableProvider.notifier).state = false;
    } on Exception catch (_) {
      setState(() {
        error = true;
      });
    }
  }

  void validateInput(int index) {
    setState(() {
      errorNodes[index] = false;
      failNodes[index] = false;
      error = false;
    });
    words[index] = controllers[index].text.trim();
    final nulls = words.where((element) => element == '').toList();
    if (nulls.isEmpty) {
      _confirmMnemonic(words);
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

  void _refresh(int length) {
    context.afterBuild(() {
      words.clear();
      for (final element in focusNodes) {
        element?.dispose();
      }
      focusNodes.clear();
      for (final element in controllers) {
        element.dispose();
      }
      controllers.clear();
      ref.read(nextButtonDisableProvider.notifier).state = true;
      final stuff = List<String>.generate(length, (index) => '');
      for (var i = 0; i < stuff.length; i++) {
        words.add(stuff[i]);
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
