import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/widgets/customized_appbar.dart';
import 'package:gui/src/features/main/theme/bloc/theme_bloc.dart';

/// A layout widget that provides consistent structure for all app screens
/// including the custom app bar
class AppLayout extends StatelessWidget {
  /// Creates an app layout with the custom app bar
  ///
  /// The [content] parameter is required and contains the main content
  /// of the screen.
  const AppLayout({
    super.key,
    required this.content,
  });

  /// The main content of the screen displayed below the app bar
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // App bar at the top
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: BlocBuilder<AppThemeCubit, bool>(
            builder: (context, isDarkTheme) {
              return const CustomAppBar();
            },
          ),
        ),
        // Content below the app bar
        Positioned(
          top: 48, // Height of the app bar
          left: 0,
          right: 0,
          bottom: 0,
          child: content,
        ),
      ],
    );
  }
}
