import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:window_manager/window_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  Widget build(BuildContext context) {
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
                child:  SvgPicture.asset(
                  Assets.icons.icLogoLight,
                ),
              ),
            ),
            Row(
              children: [
                _FluentAppBarButton(
                  icon: "Assets.icons.icClose",
                  onPressed: () async {
                    await windowManager.minimize();
                  },
                ),
                _FluentAppBarButton(
                  icon: 'FluentIcons.chrome_restore',
                  onPressed: () async {
                    final isMaximized = await windowManager.isMaximized();
                    if (isMaximized) {
                      await windowManager.unmaximize();
                    } else {
                      await windowManager.maximize();
                    }
                  },
                ),
                _FluentAppBarButton(
                  icon: 'FluentIcons.chrome_close',
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

class _FluentAppBarButton extends StatelessWidget {
  const _FluentAppBarButton({
    required this.icon,
    required this.onPressed,
  });

  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: HoverButton(
        onPressed: onPressed,
        builder: (context, states) {
          final color = states.isHovered
              ? Colors.red
              : Colors.transparent;
          return Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
            child: SvgPicture.asset(icon,),
          );
        },
      ),
    );
  }
}

