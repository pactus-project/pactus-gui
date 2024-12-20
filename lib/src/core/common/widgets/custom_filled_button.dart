import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.backgroundColor,
      this.textColor,
      required this.borderRadius,
      required this.elevation,
      required this.padding,
      this.icon});
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;
  final double elevation;
  final EdgeInsets padding;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        foregroundColor: textColor ?? Colors.white,
        padding: padding,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, color: textColor ?? Colors.white),
            const SizedBox(width: 8),
          ],
          Text(
            label,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
