import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gui/src/core/utils/gen/assets/assets.gen.dart';
import 'package:gui/src/features/main/theme/bloc/theme_bloc.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';


class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, bool>(
      builder: (context, isDarkMode) {
        const duration = Duration(milliseconds: 200);

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // آیکن حالت لایت
            AnimatedOpacity(
              curve: Curves.easeIn,
              opacity: isDarkMode ? 0.0 : 1.0,
              duration: duration,
              child: SvgPicture.asset(
                Assets.icons.icDarkMode,
              ),
            ),
            // سوئیچ
            GestureDetector(
              onTap: () {
                context.read<AppThemeCubit>().toggleTheme();
              },
              child: AnimatedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 40,
                height: 20,
                duration: duration * 2,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppTheme.of(context).extension<DarkPallet>()!.
                    dark900!,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 100),
                    alignment: isDarkMode
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: AppTheme.of(context).extension<DarkPallet>()!
                            .dark900,
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            AnimatedOpacity(
              curve: Curves.easeIn,
              opacity: isDarkMode ? 1.0 : 0.0,
              duration: duration,
              child: SvgPicture.asset(
                Assets.icons.icLightMode,
              ),
            ),
          ],
        );
      },
    );
  }
}
