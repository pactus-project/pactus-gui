import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/widgets/custom_filled_button.dart';
import 'package:gui/src/core/constants/inter_text_styles.dart';
import 'package:gui/src/core/router/route_name.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.g.dart';
import 'package:gui/src/features/password/presentation/widgets/master_password_text_form_field_widget.dart';

import '../../../../core/utils/assets/assets.gen.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key, required this.fromRegistrationRoute});
  final bool fromRegistrationRoute;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.icons.icMasterPassword,
            ),
            const Gap(20),
            SvgPicture.asset(Assets.icons.icLock),
            const Gap(10),
            Text(
              LocaleKeys.enter_master_password_to_unlock.tr(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: InterTextStyles.light15.copyWith(
                color: AppColors.primaryDark,
              ),
            ),
            const Gap(22),
            MasterPasswordTextFormFieldWidget(),
            const Gap(22),
            fromRegistrationRoute
                ? MaterialButton(
                    onPressed: () {
                      context.goNamed(AppRoute.dashboard.name);
                    },
                    child: Text(
                      'Navigate to ${AppRoute.dashboard.name}',
                    ),
                  )
                : MaterialButton(
                    onPressed: () {
                      context.goNamed(AppRoute.basicDashboard.name);
                    },
                    child: Text(
                      'Navigate to ${AppRoute.basicDashboard.name}',
                    ),
                  ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
