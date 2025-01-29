import 'package:fluent_ui/fluent_ui.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class CustomFilledButton extends StatelessWidget {

  const CustomFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.style,
    this.icon,
    this.autofocus = false,
    this.focusNode,
    this.padding,
  });
  final String text;
  final VoidCallback onPressed;
  final ButtonStyle? style;
  final Widget? icon;
  final bool autofocus;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      autofocus: autofocus,
      focusNode: focusNode,
      style: style ?? ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsDirectional?>(
          const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 4),
        ),
        backgroundColor: WidgetStateProperty.all(const Color(0xFF0066B4)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
      child: Padding(
        padding: padding ??
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) icon!,
            if (icon != null) const SizedBox(width: 8),
            Text(
              context.tr(text),
              style: InterTextStyles.bodyBold.copyWith(
                color: AppColors.primaryLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
