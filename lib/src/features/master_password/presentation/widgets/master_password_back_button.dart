import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/widgets/custom_outlined_button.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/main/language/core/localization_extension.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';

class MasterPasswordBackButtonWidget extends StatelessWidget {

  const MasterPasswordBackButtonWidget({super.key, required this.selectedIndex});
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
      text: context.tr(LocaleKeys.back),
      onPressed: () {
        context.read<NavigationPaneCubit>().setSelectedIndex(selectedIndex - 1);
      },
      borderColor: AppColors.buttonBorderColor,
    );
  }
}
