import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/widgets/adaptive_filled_button.dart';
import 'package:gui/src/core/common/widgets/adaptive_text_button.dart';
import 'package:gui/src/core/utils/daemon_manager/node_config_data.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';

class MasterPasswordActionButtonWidget extends StatelessWidget {

  const MasterPasswordActionButtonWidget({super.key, required this.selectedIndex});
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AdaptiveTextButton(
          text: context.tr(LocaleKeys.skip),
          onPressed: () {
            context.read<NavigationPaneCubit>().setSelectedIndex(selectedIndex + 1);
          },
          padding: const EdgeInsets.symmetric(horizontal: 16),
          textColor: AppColors.inputActiveColor,
        ),
        AdaptiveFilledButton(
          text: context.tr(LocaleKeys.next),
          onPressed: () {
            final passwordController = TextEditingController();
            final confirmPasswordController = TextEditingController();
            if (passwordController.text == confirmPasswordController.text) {
              NodeConfigData.instance.password = passwordController.text;
              context.read<NavigationPaneCubit>().setSelectedIndex(selectedIndex + 1);
            }
          },
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              AppColors.radioButtonActiveColor,
            ),
            padding: WidgetStatePropertyAll(
              const EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
      ],
    );
  }
}
