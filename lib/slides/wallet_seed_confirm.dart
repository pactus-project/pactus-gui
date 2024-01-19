import 'package:fluent_ui/fluent_ui.dart';
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
  List<String> words = [""];
  String mnemonicString = "";
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    context.afterBuild(() {
      ref.read(nextButtonDisableProvider.notifier).state = true;
    });
  }

  @override
  void dispose() {
    myFocusNode.dispose();
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
          height: 200.h,
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
                var node = FocusNode();
                if (words[index] == "") {
                  node.requestFocus();
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: theme.mnemonicWords,
                      borderRadius: BorderRadius.circular(32.0.r),
                    ),
                    child: Row(
                      children: [
                        Text("$index. ", style: TextStyle(color: theme.mnemonicText, fontSize: 20.sp, fontWeight: FontWeight.w900)),
                        gapW4,
                        Expanded(
                          child: TextBox(
                            focusNode: node,
                            highlightColor: Colors.transparent,
                            style: TextStyle(color: theme.mnemonicText, fontSize: 18.sp, fontWeight: FontWeight.w900),
                            controller: TextEditingController(text: ""),
                            onChanged: (text) {
                              if (text.length > 3 && (text.endsWith(' ') || text.endsWith('\n'))) {
                                node.dispose();
                                if (words.length == seed.length) {
                                  _checkMnemonic(seed, words);
                                } else {
                                  setState(() {
                                    words[index] = text;
                                    words.add("");
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
                                "$index. ${words[index]}",
                                textAlign: TextAlign.start,
                                style: TextStyle(color: theme.mnemonicText, fontSize: 20.sp, fontWeight: FontWeight.w900),
                              ))));
                }
              }),
        ),
        const Spacer(),
      ],
    );
  }

  void _checkMnemonic(List<String> ogSeed, newSeed) {
    //compare the two seeds
    ref.read(nextButtonDisableProvider.notifier).state = false; //TODO: remove this
    if (ogSeed == newSeed) {
      ref.read(nextButtonDisableProvider.notifier).state = false;
    } else {
      showContentDialog(context: context, title: "Error", content: "The seed you entered does not match the seed generated. Please try again.");
      //if they are not the same, show an error
    }
  }

  void showContentDialog({required BuildContext context, required String title, required String content}) async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => ContentDialog(
        title: Text(title),
        content: Text(
          content,
        ),
        actions: [
          Button(
            child: const Text('Try Again'),
            onPressed: () {
              words = [""];
              Navigator.pop(context, 'User tried again');
              // Delete file here
            },
          ),
        ],
      ),
    );
    setState(() {});
  }
}
