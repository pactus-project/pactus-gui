import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:window_manager/window_manager.dart';

import 'app_bar_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final isLightTheme = theme.brightness == Brightness.light;
    return GestureDetector(
      onPanStart: (details) async {
        await windowManager.startDragging();
      },
      child: Container(
        height: preferredSize.height,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: SvgPicture.asset(
                  Assets.icons.icLogoLight,
                ),
              ),
            ),
            ToggleSwitch(
              checked: true,
              onChanged: (bool value) {
                // context.read<ThemeBloc>().add(
                //   ThemeChanged(
                //     theme: isLightTheme ? ThemeModes.dark : ThemeModes.light,
                //   ),
                // );
              },
            ),
            Row(
              children: [
                FluentAppBarButton(
                  icon: Assets.icons.icMinimize,
                  onPressed: () async {
                    await windowManager.minimize();
                  },
                ),
                FluentAppBarButton(
                  icon: Assets.icons.icMaximize,
                  onPressed: () async {
                    final isMaximized = await windowManager.isMaximized();
                    if (isMaximized) {
                      await windowManager.unmaximize();
                    } else {
                      await windowManager.maximize();
                    }
                  },
                ),
                FluentAppBarButton(
                  icon: Assets.icons.icClose,
                  onPressed: () async {
                    await windowManager.close();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
