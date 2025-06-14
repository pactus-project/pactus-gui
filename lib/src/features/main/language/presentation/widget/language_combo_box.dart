import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/features/main/language/core/language_constants.dart';
import 'package:pactus_gui/src/features/main/language/data/language_case.dart';
import 'package:pactus_gui/src/features/main/language/presentation/bloc/language_bloc.dart';

class ComboBoxLanguageSelector extends StatelessWidget {
  const ComboBoxLanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        final selectedLanguage = state.selectedLanguage;

        return ComboBox<LanguageCase>(
          value: selectedLanguage,
          items:
              [
                LanguageConstants.enUS,
                LanguageConstants.frFR,
                LanguageConstants.esES,
              ].map((lang) {
                return ComboBoxItem<LanguageCase>(
                  value: lang,
                  child: Text(lang.name),
                );
              }).toList(),
          onChanged: (LanguageCase? newLang) {
            if (newLang != null) {
              context.read<LanguageBloc>().add(
                ChangeLanguage(selectedLanguage: newLang),
              );
            }
          },
        );
      },
    );
  }
}
