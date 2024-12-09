import 'package:bloc/bloc.dart';
import '../../../src/features/main/language/presentation/bloc/language_bloc.dart';

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
