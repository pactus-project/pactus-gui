import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pactus/provider/daemon_path_provider.dart';
import 'package:pactus/provider/password_provider.dart';
import 'package:pactus/provider/seed_provider.dart';
import 'package:pactus/provider/slides_provider.dart';
import 'package:pactus/provider/theme_provider.dart';
import 'package:pactus/provider/validator_provider.dart';
import 'package:pactus/support/app_sizes.dart';
import 'package:pactus/support/extensions.dart';

class InitializingSlide extends ConsumerStatefulWidget {
  const InitializingSlide({super.key});

  @override
  ConsumerState<InitializingSlide> createState() => _InitializingSlide();
}

class _InitializingSlide extends ConsumerState<InitializingSlide> {

  @override
  void initState() {
    super.initState();
    context.afterBuild(() {
      if (Platform.isMacOS) {
        _runDaemonMac();
      } else if (Platform.isWindows) {
        _runDaemonWindows();
      }
    });
  }

  List<String> _paramBuilder() {
    String? password = ref.read(confirmPasswordProvider.notifier).state;
    List<String> seed = ref.read(seedProvider.notifier).state;
    List<String> passParam = password != null ? ["-p", password] : ["-p", " "];
    List<String> seedParam = ["--restore", seed.join(" ")];
    String path = Platform.isMacOS ? "${Platform.environment['HOME']!}/wallet" : ref.read(dataPathProvider.notifier).state ?? "";
    List<String> validatorParam = ["--val-num", ref.read(validatorProvider.notifier).state.toString()];
    return ["-w", path, ...passParam, ...seedParam, ...validatorParam];
  }

  _runDaemonMac() async {
    String mainPath = Platform.resolvedExecutable;
    mainPath = mainPath.substring(0, mainPath.lastIndexOf("/"));
    mainPath = mainPath.substring(0, mainPath.lastIndexOf("/"));
    mainPath = "$mainPath/Resources";
    Directory directoryExe = Directory(mainPath);
    List<FileSystemEntity> files = directoryExe.listSync();
    ProcessResult? res;
    for (FileSystemEntity file in files) {
      if (file.path.contains("pactus-daemon")) {
        res = await Process.run(file.path, ["init", ..._paramBuilder()]);
        ref.read(daemonPathProvider.notifier).state = file.path;
        break;
      }
    }

    Future.delayed(const Duration(seconds: 5), () {
      try {
        if (res != null) {
          int pid = int.parse(res.pid.toString());
          Process.killPid(pid);
          ref.read(nextSlideProvider.notifier).state = 1;
        }else{
          var alert = ContentDialog(
            title: const Text("Daemon Not Found"),
            content: const Text("The daemon was not found, please try again"),
            actions: [
              Button(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              )
            ],
          );
          showDialog(context: context, builder: (context) => alert);
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    });
  }

  _runDaemonWindows() async {
    String mainPath = Platform.resolvedExecutable;
    mainPath = mainPath.substring(0, mainPath.lastIndexOf("\\"));
    Directory directoryExe = Directory(mainPath);
    List<FileSystemEntity> files = directoryExe.listSync();
    ProcessResult? res;
    String? path;
    for (FileSystemEntity file in files) {
      if (file.path.contains("pactus-daemon.exe")) {
        path = file.path;
        ref.read(daemonPathProvider.notifier).state = file.path;
        break;
      }
    }
    if (path == null) {
      var alert = ContentDialog(
        title: const Text("Daemon Not Found"),
        content: const Text("The daemon was not found, please make sure the daemon is in the same directory as the wallet"),
        actions: [
          Button(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("OK"),
          )
        ],
      );
      showDialog(context: context, builder: (context) => alert);
      return;
    }


    Directory walletDir = Directory(ref.read(dataPathProvider.notifier).state ?? "${Platform.environment['USERPROFILE']!}/pactus-wallet");
    bool exists = walletDir.existsSync();
    if (!exists) {
      walletDir.createSync();
      res = await Process.run(path, ["init", ..._paramBuilder()]);
    } else {
      var alert = ContentDialog(
        title: const Text("Wallet Directory Exists"),
        content: const Text("The wallet directory already exists, please choose another directory"),
        actions: [
          Button(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("OK"),
          )
        ],
      );
      showDialog(context: context, builder: (context) => alert);
    }

    Future.delayed(const Duration(seconds: 5), () {
      try {
        int pid = int.parse(res!.pid.toString());
        Process.killPid(pid);
        ref.read(nextSlideProvider.notifier).state = 1;
      } catch (e) {
        debugPrint(e.toString());
      }
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
          "Initializing",
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
        ),
        gapH8,
        Text(
          "Node Activation, Powering the Pulse of the Blockchain",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300, color: theme.textColor.withOpacity(0.5)),
        ),
        gapH32,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height * 0.4,
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Image.asset("assets/images/gears.png", filterQuality: FilterQuality.high, fit: BoxFit.fitHeight,),
                ],),
              ),
              gapH32,
              gapH16,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * 0.6,
                    child: const ProgressBar(
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
