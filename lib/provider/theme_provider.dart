import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme.dart';

final appThemeProvider = ChangeNotifierProvider<AppTheme>((ref) {
  return AppTheme(); // Replace with your AppTheme initialization logic
});
