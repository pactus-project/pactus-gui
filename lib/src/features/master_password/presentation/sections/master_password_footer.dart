import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/features/main/radio_button_cubit/presentation/radio_button_cubit.dart';
import 'package:gui/src/features/master_password/presentation/widgets/master_password_action_button.dart';
import 'package:gui/src/features/master_password/presentation/widgets/master_password_back_button.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class MasterPasswordFooter extends StatelessWidget {

  const MasterPasswordFooter({super.key, required this.selectedIndex});
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 89,
      color: AppTheme.of(context).extension<LightPallet>()!.light900,
      padding: const EdgeInsets.only(right: 46),
      child: Align(
        alignment: Alignment.centerRight,
        child: BlocBuilder<RadioButtonCubit, int>(
          builder: (context, selectedValue) {
            return Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MasterPasswordBackButtonWidget(selectedIndex: selectedIndex),
                  MasterPasswordActionButtonWidget(selectedIndex: selectedIndex),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
