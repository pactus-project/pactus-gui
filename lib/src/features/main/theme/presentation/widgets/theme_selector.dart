import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/enums/theme_modes.dart';
import 'package:gui/src/features/main/theme/bloc/theme_bloc.dart';
import 'package:gui/src/features/main/theme/theme_data/pallets/on_surface_pallet.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLightTheme = theme.brightness == Brightness.light;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            context.read<ThemeBloc>().add(
                  ThemeChanged(
                    theme: isLightTheme ? ThemeModes.dark : ThemeModes.light,
                  ),
                );
          },
          child: Icon(
            isLightTheme ? Icons.nightlight_round_rounded : Icons.sunny,
            color: theme.extension<OnSurfacePallet>()!.onSurface3,
          ),
        ),
      ],
    );
  }
}
