import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pactus_gui/src/core/constants/storage_keys.dart';
import 'package:pactus_gui/src/core/utils/storage_utils.dart';
import 'package:pactus_gui/src/features/main/language/core/language_constants.dart';
import 'package:pactus_gui/src/features/main/language/data/language_case.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    on<ChangeLanguage>(onChangeLanguage);
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    final savedLanguage =
        StorageUtils.getData<String>(StorageKeys.savedLanguage);
    if (savedLanguage != null) {
      final parts = savedLanguage.split('_');
      if (parts.length == 2) {
        add(
          ChangeLanguage(
            selectedLanguage: LanguageCase(
              name: savedLanguage,
              language: parts[0],
              country: parts[1],
            ),
          ),
        );
      }
    }
  }

  Future<void> onChangeLanguage(
    ChangeLanguage event,
    Emitter<LanguageState> emit,
  ) async {
    // Save to local storage in format "en_US"
    StorageUtils.saveData(
      StorageKeys.savedLanguage,
      '${event.selectedLanguage.language}_${event.selectedLanguage.country}',
    );

    emit(state.copyWith(selectedLanguage: event.selectedLanguage));
  }
}
