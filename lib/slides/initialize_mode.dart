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
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How to create your wallet?',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        gapH8,
        Text(
          'If you running a node for first time, choose the first options',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w300,
            color: theme.textColor.withOpacity(0.5),
          ),
        ),
        gapH32,
        Padding(
          padding: EdgeInsets.only(left: 12.0.w),
          child: SizedBox(
            height: 22.sp,
            child: Row(
              children: [
                RadioButton(
                  checked: ref.read(radioButtonProvider.notifier).state == 0,
                  onChanged: (state) {
                    setState(() {
                      ref.read(radioButtonProvider.notifier).state = 0;
                    });
                  },
                ),
                gapW12,
                GestureDetector(
                  onTap: () {
                    setState(() {
                      ref.read(radioButtonProvider.notifier).state = 0;
                    });
                  },
                  child: Text(
                    'Create new wallet from scratch',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
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
                  checked: ref.read(radioButtonProvider.notifier).state == 1,
                  onChanged: (state) {
                    setState(() {
                      ref.read(radioButtonProvider.notifier).state = 1;
                    });
                  },
                ),
                gapW12,
                GestureDetector(
                  onTap: () {
                    setState(() {
                      ref.read(radioButtonProvider.notifier).state = 1;
                    });
                  },
                  child: Text(
                    'Restore a wallet from seed phrase',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
