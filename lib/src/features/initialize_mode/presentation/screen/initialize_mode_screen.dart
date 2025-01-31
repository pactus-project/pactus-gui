import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/widgets/custom_expandable_widget.dart';
import 'package:gui/src/features/initialize_mode/presentation/widgets/custom_input_row.dart';
import 'package:gui/src/features/initialize_mode/presentation/widgets/radio_button_group_widget.dart';
import 'package:gui/src/features/main/navigation_pan_cubit/presentation/cubits/navigation_pan_cubit.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class InitializeModeScreen extends StatefulWidget {
  const InitializeModeScreen({super.key});

  @override
  State<InitializeModeScreen> createState() => _InitializeModeScreenState();
}

class _InitializeModeScreenState extends State<InitializeModeScreen> {
  final TextEditingController _remoteAddressController =
  TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPaneCubit, int>(builder: (context, selectedIndex) {
      return NavigationView(

        content: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(46),
                Text(
                  'Initiate your node',
                  style: InterTextStyles.bodyBold.copyWith(
                    color: AppColors.primaryDark,
                  ),
                ),
                const Gap(8),
                Text(
                  'Initiate your node for first time',
                  style: InterTextStyles.smallRegular.copyWith(
                    color: AppColors.primaryGray,
                  ),
                ),
                const Gap(24),
                RadioButtonGroup(
                  selectedValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
                const Gap(30),

                if (selectedValue == 2) ...[
                  CustomInputRow(
                    label: 'Remote Address',
                    controller: _remoteAddressController,
                    placeholder: 'pactus.example.com:1234',
                  ),
                  const Gap(28),
                  Row(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Auth Method',
                        style: InterTextStyles.captionMedium.copyWith(
                          color: AppColors.primaryGray,
                        ),
                      ),
                      CustomExpandableWidget(
                        header: 'Basic Auth',
                        body: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Item 1',
                              style: InterTextStyles.captionMedium.copyWith(
                                color: AppColors.primaryGray,
                              ),
                            ),
                            Text(
                              'Item 2',
                              style: InterTextStyles.captionMedium.copyWith(
                                color: AppColors.primaryGray,
                              ),
                            ),
                          ],
                        ),
                        headerColor: AppTheme.of(context)
                            .extension<SurfacePallet>()!
                            .surface3!,
                        expandedColor: AppTheme.of(context)
                            .extension<SurfacePallet>()!
                            .surface3!,
                        padding: EdgeInsets.all(8),
                        animationDuration: 400,
                        width: 125,
                        maxHeight: 200,
                      ),
                    ],
                  ),
                  const Gap(28),
                  CustomInputRow(
                    label: 'Username',
                    controller: _usernameController,
                    placeholder: 'pactus',
                  ),
                  const Gap(28),
                  CustomInputRow(
                    label: 'Password',
                    controller: _passwordController,
                    placeholder: '12345678',
                    obscureText: true,
                  ),
                ],

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (selectedIndex < 6)
                        Button(
                          child: const Text('Next'),
                          onPressed: () {
                            context
                                .read<NavigationPaneCubit>()
                                .setSelectedIndex(selectedIndex + 1);
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
