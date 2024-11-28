import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/features/main/language/data/language_model.dart';
import 'package:gui/src/features/main/language/presentation/bloc/language_bloc.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            context.read<LanguageBloc>().add(
                  ChangeLanguage(selectedLanguage: Language.english),
                );
          },
          child: const Text('English'),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            context.read<LanguageBloc>().add(
                  ChangeLanguage(selectedLanguage: Language.spanish),
                );
          },
          child: const Text('Español'),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            context.read<LanguageBloc>().add(
                  ChangeLanguage(selectedLanguage: Language.french),
                );
          },
          child: const Text('Français'),
        ),
      ],
    );
  }
}
