import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gui/src/features/main/language/data/language_model.dart';
import '../../../../../core/services/shared_preferences_service.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc(this._sharedPreferencesService) : super(const LanguageState()) {
    on<InitializeLanguageEvent>(_onInitializeLanguage);
    on<ChangeLanguage>(_onChangeLanguage);
    add(InitializeLanguageEvent()); // Trigger initialization on creation
  }

  final SharedPreferencesService _sharedPreferencesService;

  Future<void> _onInitializeLanguage(
    InitializeLanguageEvent event,
    Emitter<LanguageState> emit,
  ) async {
    final languageCode = _sharedPreferencesService.getSelectedLanguage();

    final language = languageCode.isNotEmpty
        ? Language.values.firstWhere(
            (lang) => lang.code == languageCode,
            orElse: () => Language.english,
          )
        : Language.english;

    await _sharedPreferencesService.saveSelectedLanguage(
      language.code,
    );
    emit(state.copyWith(selectedLanguage: language));
  }

  Future<void> _onChangeLanguage(
    ChangeLanguage event,
    Emitter<LanguageState> emit,
  ) async {
    await _sharedPreferencesService.saveSelectedLanguage(
      event.selectedLanguage.code,
    );

    emit(state.copyWith(selectedLanguage: event.selectedLanguage));
  }
}
