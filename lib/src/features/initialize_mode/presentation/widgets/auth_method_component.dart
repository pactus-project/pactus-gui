import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/common/colors/app_colors.dart';
import 'package:pactus_gui/src/core/common/widgets/custom_expandable_widget.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/features/generation_seed/presentation/cubits/seed_type_cubit.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
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
          context.tr(LocaleKeys.auth_method),
          style: InterTextStyles.captionMedium.copyWith(
            color: AppColors.primaryGray,
          ),
        ),
        BlocProvider(
          create: (context) => DropdownCubit<String>('Basic Auth'),
          child: CustomDropdownWidget<String>(
            items: ['Basic Auth', 'No Auth'],
            itemLabel: (item) => item,
          ),
        ),
      ],
    );
  }
}
