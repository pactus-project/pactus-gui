import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pactus/provider/button_control_provider.dart';
import 'package:pactus/provider/theme_provider.dart';
import 'package:pactus/support/app_sizes.dart';

class InitializingSlide extends ConsumerStatefulWidget {
  const InitializingSlide({super.key});

  @override
  ConsumerState<InitializingSlide> createState() => _InitializingSlide();
}

class _InitializingSlide extends ConsumerState<InitializingSlide> {
  final controller = TextEditingController();
  List<int> dropDown = [7, 10, 15, 20, 25, 32];
  int defaultDropDown = 7;

  @override
  void initState() {
    super.initState();
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
