import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/features/main/language/core/language_constants.dart';
import 'package:gui/src/features/main/language/presentation/bloc/language_bloc.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Button(
          onPressed: () {
            context.read<LanguageBloc>().add(
                  ChangeLanguage(selectedLanguage: LanguageConstants.enUS),
                );
          },
          child: const Text('English'),
        ),
        const SizedBox(width: 8),
        Button(
          onPressed: () {
            context.read<LanguageBloc>().add(
                  ChangeLanguage(selectedLanguage: LanguageConstants.esES),
                );
          },
          child: const Text('Español'),
        ),
        const SizedBox(width: 8),
        Button(
          onPressed: () {
            context.read<LanguageBloc>().add(
                  ChangeLanguage(selectedLanguage: LanguageConstants.frFR),
                );
          },
          child: const Text('Français'),
        ),
      ],
    );
  }
}
