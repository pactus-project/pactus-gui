import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/common/widgets/custom_expandable_widget.dart';
import 'package:pactus_gui/src/core/enums/language_enum.dart';
import 'package:pactus_gui/src/features/generation_seed/presentation/cubits/seed_type_cubit.dart';
import 'package:pactus_gui/src/features/main/language/core/language_constants.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui/src/features/main/language/presentation/bloc/language_bloc.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<DropdownCubit<LanguageEnum>, LanguageEnum>(
          builder: (context, state) {
            switch (state) {
              case LanguageEnum.english:
                context.read<LanguageBloc>().add(
                  ChangeLanguage(selectedLanguage: LanguageConstants.enUS),
                );
              case LanguageEnum.french:
                context.read<LanguageBloc>().add(
                  ChangeLanguage(selectedLanguage: LanguageConstants.frFR),
                );
              case LanguageEnum.spanish:
                context.read<LanguageBloc>().add(
                  ChangeLanguage(selectedLanguage: LanguageConstants.esES),
                );
            }
            return CustomDropdownWidget<LanguageEnum>(
              items: LanguageEnum.values,
              itemLabel: (item) => context.tr(item.text),
            );
          },
        ),
      ],
    );
  }
}
