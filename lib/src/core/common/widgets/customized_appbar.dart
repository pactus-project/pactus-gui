import 'package:flutter/material.dart';
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
          color: Colors.grey[900],
        ),
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'Linux-like AppBar',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            Row(
              children: [
                _AppBarButton(
                  icon: Icons.remove,
                  color: Colors.yellow,
                  onPressed: () async {
                    await windowManager.minimize();
                  },
                ),
                _AppBarButton(
                  icon: Icons.crop_square,
                  color: Colors.green,
                  onPressed: () async {
                    final isMaximized = await windowManager.isMaximized();
                    if (isMaximized) {
                      await windowManager.unmaximize();
                    } else {
                      await windowManager.maximize();
                    }
                  },
                ),
                _AppBarButton(
                  icon: Icons.close,
                  color: Colors.red,
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

class _AppBarButton extends StatelessWidget {
  const _AppBarButton({
    required this.icon,
    required this.color,
    required this.onPressed,
  });
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, size: 16),
      color: color,
      onPressed: onPressed,
      splashRadius: 20,
    );
  }
}
