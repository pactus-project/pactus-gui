import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';

import '../../../../core/common/widgets/custom_filled_button.dart';
import '../../../../core/utils/gen/assets/assets.gen.dart';
import '../../../../core/utils/gen/localization/locale_keys.dart';

class FinishPage extends StatelessWidget {
  const FinishPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return NavigationView(
      content: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              flex: 6, // 60% of the width
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Your journey finalized, your success on the horizon',
                    style: FluentTheme.of(context).typography.title,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Venturing into the realm of blockchain technology, Pactus heralds an era of uncompromised decentralization that stands in contrast to its contemporaries...',
                    style: FluentTheme.of(context).typography.body,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 20),
                  _buildUnlockButton(),
                ],
              ),
            ),
            Expanded(
              flex: 4, // 40% of the width
              child: Center(
                child: SvgPicture.asset(
                  isDark
                      ? Assets.images.bgFinishDark
                      : Assets.images.bgFinishLight,
                  height: 400,
                  width: 400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUnlockButton() {
    return CustomFilledButton(
      text: LocaleKeys.auth_method,
      onPressed: () {
        // Add your navigation logic here
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsDirectional?>(
          EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 4),
        ),
        backgroundColor: WidgetStateProperty.all(Color(0xFF0066B4)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
