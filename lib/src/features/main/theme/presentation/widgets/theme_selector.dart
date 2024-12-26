import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/features/main/theme/bloc/theme_bloc.dart';
import 'package:gui/src/features/main/theme/bloc/theme_state.dart';
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
                  ChangeTheme(
                    isLightTheme ? ThemeState.darkTheme : ThemeState.lightTheme,
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
