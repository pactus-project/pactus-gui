import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 8),
      child: HoverButton(
        cursor: SystemMouseCursors.click,
        onPressed: () {
          context.read<NavigationPaneCubit>().toggleMenu();
        },
        builder: (context, states) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(material.Icons.menu),
          );
        },
      ),
    );
  }
}
