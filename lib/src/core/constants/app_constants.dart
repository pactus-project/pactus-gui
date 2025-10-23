import 'package:fluent_ui/fluent_ui.dart' show Color;

class AppConstants {
  AppConstants._();

  // Number of Validators options
  static const String validators10 = '10';
  static const String validators15 = '15';
  static const String validators20 = '20';
  static const String validators25 = '25';
  static const String validators32 = '32';

  // max index of each panel
  static const int createLocalNodeMaxIndex = 5;
  static const int restoreNodeMaxIndex = 4;
  static const int remoteNodeMaxIndex = 1;

  // language
  static const String english = 'English';
  static const String spanish = 'Español';
  static const String french = 'Français';

  static const Color transactionBoxLight = Color(0xffF0F0F0);
  static const Color transactionBoxDark = Color(0xff202020);

  static const Color bgTransactionBoxLight = Color(0xffFFFFFF);
  static const Color bgTransactionBoxDark = Color(0xff2B2D30);
}
