import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:gui/src/core/utils/paltform_detection.dart';

class TextFieldWrapper extends StatelessWidget {
  const TextFieldWrapper({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    if (Platform.isLinux) {
      return ExcludeSemantics(child: child);
    }
    return child;
  }
}