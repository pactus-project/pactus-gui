import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_svg/svg.dart';

class FluentAppBarButton extends StatelessWidget {
  const FluentAppBarButton({
    super.key,
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
          final color = states.isHovered ? Colors.red : Colors.transparent;
          return Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
            child: SvgPicture.asset(
              icon,
            ),
          );
        },
      ),
    );
  }
}
