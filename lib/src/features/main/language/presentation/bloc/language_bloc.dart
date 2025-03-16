import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gui/src/features/main/language/core/language_constants.dart';
import 'package:gui/src/features/main/language/data/language_case.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    on<ChangeLanguage>(onChangeLanguage);
  }
  Future<void> onChangeLanguage(
    ChangeLanguage event,
    Emitter<LanguageState> emit,
  ) async {
    emit(state.copyWith(selectedLanguage: event.selectedLanguage));
  }
}
