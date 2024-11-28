import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gui/src/features/main/language/data/language_model.dart';
part 'language_event.dart';
part 'language_state.dart';

const languagePrefsKey = 'languagePrefs';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState()) {
    on<ChangeLanguage>(onChangeLanguage);
  }
  Future<void> onChangeLanguage(
    ChangeLanguage event,
    Emitter<LanguageState> emit,
  ) async {
    emit(state.copyWith(selectedLanguage: event.selectedLanguage));
  }
}
