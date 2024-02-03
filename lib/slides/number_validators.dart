import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pactus/provider/button_control_provider.dart';
import 'package:pactus/provider/theme_provider.dart';
import 'package:pactus/support/app_sizes.dart';
import 'package:pactus/support/extensions.dart';

class NumberValidatorsSlide extends ConsumerStatefulWidget {
  const NumberValidatorsSlide({super.key});

  @override
  ConsumerState<NumberValidatorsSlide> createState() => _NumberValidatorsSlide();
}

class _NumberValidatorsSlide extends ConsumerState<NumberValidatorsSlide> {
  final controller = TextEditingController();
  List<int> dropDown = [7, 10, 15, 20, 25, 32];
  int defaultDropDown = 7;

  @override
  void initState() {
    super.initState();
    controller.text = _homeDirectory() ?? "";
    context.afterBuild(() {
      ref.read(nextButtonDisableProvider.notifier).state = false;
    });
  }

  String? _homeDirectory() {
    switch (Platform.operatingSystem) {
      case 'linux':
      case 'macos':
        return Platform.environment['HOME'];
      case 'windows':
        return Platform.environment['USERPROFILE'];
      case 'android':
      // Probably want internal storage.
        return '/storage/sdcard0';
      case 'ios':
      // iOS doesn't really have a home directory.
        return null;
      case 'fuchsia':
      // I have no idea.
        return null;
      default:
        return null;
    }
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
          "Validator config",
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
        ),
        gapH8,
        Text(
          "Setting Your Path to Decentralized Consensus with Precision and Scalability",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300, color: theme.textColor.withOpacity(0.5)),
        ),
        if(!Platform.isMacOS)
        Column(
          children: [
            gapH32,
            Text(
              "Working directory",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: theme.textColor.withOpacity(0.5)),
            ),
            gapH8,
            Row(
              children: [
                Expanded(
                  child: TextBox(
                    controller: controller,
                    focusNode: FocusNode(),
                    style: const TextStyle(),
                    cursorColor: theme.isLightTheme(context) ? Colors.black : Colors.white,
                    // backgroundCursorColor: theme.isLightTheme(context) ? Colors.white : Colors.white
                  ),
                ),
                gapW8,
                Button(
                    style: ButtonStyle(
                      padding: ButtonState.all(EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 8.0.h)),
                      backgroundColor: ButtonState.resolveWith((states) {
                        // If the button is pressed, return size 40, otherwise 20
                        if (states.contains(ButtonStates.hovering)) {
                          return Colors.blue.withOpacity(0.8);
                        }
                        return Colors.blue;
                      }),
                      // padding: ButtonState.all(EdgeInsets.symmetric(horizontal: 32.0.w, vertical: 12.0.h)),
                    ),
                    child: Text(
                      'Select folder',
                      style: TextStyle(color: theme.isLightTheme(context) ? Colors.white : Colors.black, fontSize: 16.sp),
                    ),
                    onPressed: () async {
                      String? result = await FilePicker.platform.getDirectoryPath();

                      if (result != null) {
                        controller.text = result;
                      } else {
                        // Do something else...
                      }
                    }),
              ],
            ),
          ],
        ),
        gapH32,
        Row(
          children: [
            Text(
              "Number of validators",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: theme.textColor.withOpacity(0.5)),
            ),
            gapW12,
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: DropDownButton(
                  closeAfterClick: false,
                  title: Text(
                    "$defaultDropDown       ",
                    style: TextStyle(color: theme.textColor),
                    textAlign: TextAlign.start,
                  ),
                  items: dropDown
                      .map((e) => MenuFlyoutItem(
                          text: Text(
                            "$e       ",
                            style: TextStyle(color: theme.textColor),
                            textAlign: TextAlign.start,
                          ),
                          onPressed: () {
                            setState(() {
                              defaultDropDown = e;
                            });
                          }))
                      .toList()),
            ),
          ],
        ),
      ],
    );
  }
}
