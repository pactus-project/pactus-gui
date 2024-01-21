import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pactus/provider/button_control_provider.dart';
import 'package:pactus/provider/password_provider.dart';
import 'package:pactus/provider/theme_provider.dart';
import 'package:pactus/support/app_sizes.dart';
import 'package:pactus/support/extensions.dart';

class MasterPasswordSlide extends ConsumerStatefulWidget {
  const MasterPasswordSlide({super.key});

  @override
  ConsumerState<MasterPasswordSlide> createState() => _MasterPasswordSlideState();
}

class _MasterPasswordSlideState extends ConsumerState<MasterPasswordSlide> {
  @override
  void initState() {
    super.initState();
    context.afterBuild(() {
      ref.read(nextButtonDisableProvider.notifier).state = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final theme = ref.watch(appThemeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Master Password",
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
        ),
        gapH8,
        Text(
          "Your Keystone to Cryptographic Security, this password make your node secure",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300, color: theme.textColor.withOpacity(0.5)),
        ),
        Expanded(
          child: Center(
              child: Image.asset(
            "assets/images/master_password.png",
            filterQuality: FilterQuality.high,
            fit: BoxFit.fitHeight,
          )),
        ),
        gapH32,
        SizedBox(
            width: width,
            child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 400.w,
                  child: PasswordBox(
                    placeholder: "Enter password",
                    revealMode: PasswordRevealMode.peek,
                    onChanged: (value) {
                      ref.read(passwordProvider.notifier).state = value;
                    },
                  ),
                ))),
        gapH16,
        SizedBox(
            width: width,
            child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 400.w,
                  child: PasswordBox(
                    placeholder: "Confirm password",
                    revealMode: PasswordRevealMode.peek,
                    onChanged: (value) {
                      ref.read(confirmPasswordProvider.notifier).state = value;
                      if (ref.read(passwordProvider.notifier).state == ref.read(confirmPasswordProvider.notifier).state) {
                        ref.read(nextButtonDisableProvider.notifier).state = false;
                      }
                    },
                  ),
                ))),
      ],
    );
  }
}
