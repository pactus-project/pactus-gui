import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/common/colors/app_colors.dart';
import 'package:gui/src/core/common/widgets/custom_expandable_widget.dart';
import 'package:gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:gui/src/features/generation_seed/core/constants/enums/seed_type_enum.dart';
import 'package:gui/src/features/generation_seed/presentation/cubits/seed_type_cubit.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class AuthMethodComponent extends StatelessWidget {
  const AuthMethodComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 33,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.auth_method,
          style: InterTextStyles.captionMedium.copyWith(
            color: AppColors.primaryGray,
          ),
        ),
        BlocProvider(
          create: (context) => DropdownCubit<SeedTypeEnum>(SeedTypeEnum.twelve),
          child: CustomDropdownWidget<SeedTypeEnum>(
            items: SeedTypeEnum.values,
            itemLabel: (item) => item.name,
          ),
        ),
      ],
    );
  }
}
