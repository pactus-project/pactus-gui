import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pactus/provider/theme_provider.dart';

import '../provider/button_control_provider.dart';
import '../support/app_sizes.dart';

class InitializeModeSlide extends ConsumerStatefulWidget {
  const InitializeModeSlide({super.key});

  @override
  ConsumerState<InitializeModeSlide> createState() => _InitializeModeState();
}

class _InitializeModeState extends ConsumerState<InitializeModeSlide> {
  List<bool> radioValues = [true, false];
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "How to create you wallet?",
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
        ),
        gapH8,
        Text(
          "If you running a node for first time, choose the first options",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300, color: theme.textColor.withOpacity(0.5)),
        ),
        gapH32,
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
                      ref.read(radioButtonProvider.notifier).state = 0;
                    });
                  },
                ),
                gapW12,
                GestureDetector(
                    onTap: () {
                      setState(() {
                        radioValues = [true, false];
                        ref.read(radioButtonProvider.notifier).state = 0;
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
                      ref.read(radioButtonProvider.notifier).state = 1;
                    });
                  },
                ),
                gapW12,
                GestureDetector(
                    onTap: () {
                      setState(() {
                        radioValues = [false, true];
                        ref.read(radioButtonProvider.notifier).state = 1;
                      });
                    },
                    child: Text("Restore a wallet from seed phrase", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300)))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
