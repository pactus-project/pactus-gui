import 'package:gui/src/core/constants/app_constants.dart';

enum LanguageEnum {
  english(1, AppConstants.english),
  french(2, AppConstants.french),
  spanish(3, AppConstants.spanish);

  const LanguageEnum(
      this.id,
      this.text,
      );
  final int id;
  final String text;
}
