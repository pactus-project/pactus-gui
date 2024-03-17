import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pactus/provider/password_provider.dart';
import 'package:pactus/provider/pid_provider.dart';
import 'package:pactus/provider/validator_provider.dart';
import 'package:pactus/screen_wrapper/wrapper_screen.dart';
import 'package:pactus/screens/dashboard_screen.dart';
import 'package:pactus/support/app_sizes.dart';

class UnlockScreen extends ConsumerStatefulWidget {
  const UnlockScreen({super.key});

  static const String route = '/unlock';

  @override
  ConsumerState<UnlockScreen> createState() => _UnlockScreenState();
}

class _UnlockScreenState extends ConsumerState<UnlockScreen> {
  List<String> _paramBuilder(String password) {
    ref.read(confirmPasswordProvider.notifier).state = password;
    final passParam = <String>['-p', password];
    final path = Platform.isMacOS || Platform.isLinux
        ? ref.read(dataPathProvider.notifier).state ??
            "${Platform.environment['HOME']!}/wallet"
        : ref.read(dataPathProvider.notifier).state ??
            "${Platform.environment['USERPROFILE']!}/pactus-wallet";
    return ['-w', path, ...passParam];
  }

  Future<void> _runDaemonMac(String pass) async {
    try {
      var mainPath = Platform.resolvedExecutable;
      mainPath = mainPath.substring(0, mainPath.lastIndexOf('/'));
      mainPath = mainPath.substring(0, mainPath.lastIndexOf('/'));
      mainPath = Platform.isMacOS ? '$mainPath/Resources' : '$mainPath/bundle';
      final directoryExe = Directory(mainPath);
      final files = directoryExe.listSync();
      Process? res;
      for (final file in files) {
        if (file.path.contains('pactus-daemon')) {
          final param = _paramBuilder(pass);
          res = await Process.start(file.path, ['start', ...param]);
          final pid = res.pid;
          await _readFromProcess(res).then((value) {
            if (_checkForInvalid(value, pid)) {
              ref.read(pidProvider.notifier).state = pid;
              ref.read(processProvider.notifier).state = res;
              context.go(DashboardScreen.route);
            } else {
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
          });
          break;
        }
      }
    } on Exception catch (e) {
      final alert = ContentDialog(
        title: const Text('Daemon Not Found'),
        content: Text('There was an error starting daemon$e'),
        actions: [
          Button(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      );
      await showDialog(context: context, builder: (context) => alert);
    }
  }

  Future<void> _runDaemonWin(String pass) async {
    var mainPath = Platform.resolvedExecutable;
    mainPath = mainPath.substring(0, mainPath.lastIndexOf('\\'));
    final directoryExe = Directory(mainPath);
    final files = directoryExe.listSync();
    Process? res;
    for (final file in files) {
      if (file.path.contains('pactus-daemon.exe')) {
        final param = _paramBuilder(pass);
        res = await Process.start(file.path, ['start', ...param]);
        final pid = res.pid;
        await _readFromProcess(res).then((value) {
          if (_checkForInvalid(value, pid)) {
            ref.read(pidProvider.notifier).state = pid;
            ref.read(processProvider.notifier).state = res;
            context.go(DashboardScreen.route);
          } else {
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
        });
        break;
      }
    }
  }

  Future<String> _readFromProcess(Process process) async {
    final completer = Completer<String>();
    final subscription = process.stdout.transform(utf8.decoder).listen((data) {
      if (!completer.isCompleted) {
        completer
            .complete(data); // Complete with the first chunk of data received
      }
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (!completer.isCompleted) {
        completer.complete(''); // Complete with empty string after 1 second
      }
    });
    final output = await completer.future;
    await subscription.cancel();
    return output;
  }

  bool _checkForInvalid(String stdout, int pid) {
    if (stdout.trim() == 'invalid password') {
      Process.killPid(pid);
      final alert = ContentDialog(
        title: const Text('Invalid Password'),
        content:
            const Text('The password you entered is invalid, please try again'),
        actions: [
          Button(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      );
      if (context.mounted) {
        showDialog(context: context, builder: (context) => alert);
      }
      return false;
    } else {
      return true;
    }
  }

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
              onPressed: () {
                final pass = ref.read(passwordProvider.notifier).state;
                if (pass != null && pass.isNotEmpty) {
                  if (Platform.isMacOS || Platform.isLinux) {
                    _runDaemonMac(pass);
                  } else {
                    _runDaemonWin(pass);
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
}
