import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/constants/app_constants.dart';
import 'package:gui/src/core/enums/language_enum.dart';
import 'package:gui/src/features/generation_seed/presentation/cubits/seed_type_cubit.dart';
import 'package:gui/src/features/main/language/presentation/bloc/language_bloc.dart';
import 'package:gui/src/features/settings/presentation/sections/settings_section.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final currentLanguage =
            context.read<LanguageBloc>().state.selectedLanguage!.name;
        final selected = switch (currentLanguage) {
          AppConstants.english => LanguageEnum.english,
          AppConstants.french => LanguageEnum.french,
          _ => LanguageEnum.spanish,
        };

        return BlocProvider(
          create: (context) => DropdownCubit<LanguageEnum>(selected),
          child: SettingsSection(),
        );
      },
    );
  }
}
