import 'package:bip39_mnemonic/bip39_mnemonic.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pactus/provider/seed_provider.dart';
import 'package:pactus/provider/theme_provider.dart';
import 'package:pactus/support/app_sizes.dart';
import 'package:pactus/support/extensions.dart';

class WalletSeedSlide extends ConsumerStatefulWidget {
  const WalletSeedSlide({super.key});

  @override
  ConsumerState<WalletSeedSlide> createState() => _WalletSeedSlideState();
}

class _WalletSeedSlideState extends ConsumerState<WalletSeedSlide> {
  List<String> mnemonic = [];
  String mnemonicString = '';
  List<int> dropDown = [24, 12];
  int defaultDropDown = 24;

  @override
  void initState() {
    super.initState();
    context.afterBuild(() {
      _generateWords(24);
    });
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
                  'Your wallet generation seed',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
                gapH8,
                Text(
                  'Initialize Your Cryptographic journey with confidence',
                  style: TextStyle(
                    fontSize: 14.sp,
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
                            color: theme.textColor.withOpacity(
                              0.4,
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            defaultDropDown = e;
                            _generateWords(e);
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
          height: mnemonic.length == 12 ? 120.h : 200.h,
          margin: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 6.0.h),
          padding: EdgeInsets.all(12.0.sp),
          decoration: BoxDecoration(
            color: theme.fieldBackground,
            borderRadius: BorderRadius.circular(8.0.r),
          ),
          width: MediaQuery.sizeOf(context).width,
          child: Center(
            child: GridView.builder(
              itemCount: mnemonic.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6, // number of items in each row
                mainAxisSpacing: 17.h, // spacing between rows
                crossAxisSpacing: 4.0.w, // spacing between columns
                mainAxisExtent: 30.0.h, // row height
              ),
              itemBuilder: (ctx, index) {
                return Container(
                  key: Key(mnemonic[index]),
                  padding: const EdgeInsets.only(
                    left: 8,
                  ),
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
                        color: theme.mnemonicWords,
                        borderRadius: BorderRadius.circular(32.0.r),
                      ),
                      child: FittedBox(
                        child: Text(
                          '${index + 1}. ${mnemonic[index]}',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: theme.mnemonicText,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        gapH8,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  final data = ClipboardData(text: mnemonicString);
                  Clipboard.setData(data);
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/clipboard.png',
                      height: 24.h,
                      width: 24.w,
                      filterQuality: FilterQuality.high,
                      color: theme.clipBoardText,
                    ),
                    gapW8,
                    Text(
                      'Copy to clipboard',
                      style: TextStyle(
                        color: theme.clipBoardText,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            gapW12,
          ],
        ),
        const Spacer(),
        Flexible(
          child: Container(width: double.infinity,
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Please write these $defaultDropDown words on paper',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: theme.textColor.withOpacity(0.5),
                    ),
                  ),
                  gapH4,
                  Text(
                    'This seed will allow you to recover your wallet in case of computer failure',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: theme.textColor.withOpacity(0.5),
                    ),
                  ),
                  gapH16,
                  Text(
                    'Warning',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w900,
                      color: theme.textColor.withOpacity(0.8),
                    ),
                  ),
                  gapH4,
                  Text(
                    '- Never disclose your seed',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: theme.textColor.withOpacity(0.5),
                    ),
                  ),
                  gapH4,
                  Text(
                    '- Never type it on website',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: theme.textColor.withOpacity(0.5),
                    ),
                  ),
                  gapH4,
                  Text(
                    '- Do not store electronically',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: theme.textColor.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _generateWords(int length) {
    final m = Mnemonic.generate(
      Language.english,
      passphrase: 'yrGG=T3Yy}-vqJpW',
      entropyLength: length == 24 ? 256 : 128, //24 words
    );
    mnemonic = m.words;
    mnemonicString = m.sentence;

    context.afterBuild(() {
      ref.read(seedProvider.notifier).state = mnemonic;
      setState(() {});
    });
  }
}
