import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pactus/provider/password_provider.dart';
import 'package:pactus/provider/process_provider.dart';
import 'package:pactus/screen_wrapper/wrapper_screen.dart';
import 'package:pactus/screens/dashboard_wrapper.dart';
import 'package:pactus/support/app_sizes.dart';

class UnlockScreen extends ConsumerStatefulWidget {
  const UnlockScreen({super.key});

  static const String route = '/unlock';

  @override
  ConsumerState<UnlockScreen> createState() => _UnlockScreenState();
}

class _UnlockScreenState extends ConsumerState<UnlockScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return WrapperPage(
      content: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/master_password.png',
                filterQuality: FilterQuality.high,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          gapH32,
          Image.asset('assets/icons/lock.png', height: 50.h, width: 50.w),
          gapH8,
          const Text(
            'Enter the master password to unlock',
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          gapH16,
          SizedBox(
            width: width,
            child: Align(
              child: SizedBox(
                width: 400.w,
                child: PasswordBox(
                  onChanged: (value) {
                    ref.read(passwordProvider.notifier).state = value;
                  },
                ),
              ),
            ),
          ),
          gapH16,
          SizedBox(
            width: 200.w,
            child: Button(
              style: ButtonStyle(
                backgroundColor: ButtonState.resolveWith((states) {
                  if (states.contains(ButtonStates.hovering)) {
                    return Colors.blue.lightest;
                  }
                  return Colors.blue;
                }),
              ),
              onPressed: () async {
                final password = ref.read(passwordProvider.notifier).state;
                if (password != null && password.isNotEmpty) {
                  try {
                    await ref
                        .read(processManagerProvider.notifier)
                        .startDaemonWithPassword(password);
                    if (context.mounted) {
                      context.go(DashboardScreenWrapper.route);
                    }
                  } on Exception catch (e) {
                    // Handle errors, e.g., invalid password or daemon not found
                    // Show appropriate dialog based on the exception
                    if (context.mounted) {
                      _showErrorDialog(context, e.toString());
                    }
                  }
                }
              },
              child: Text(
                'Unlock',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          gapH48,
        ],
      ),
      title: '',
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    final alert = ContentDialog(
      title: const Text('Password Invalid'),
      content: const Text(
        'The password you entered is invalid, please try again',
      ),
      actions: [
        Button(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alert);
  }
}
