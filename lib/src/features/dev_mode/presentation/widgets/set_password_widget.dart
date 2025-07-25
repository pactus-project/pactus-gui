import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pactus_gui/src/features/dev_mode/presentation/bloc/environment_selection_cubit.dart';

class SetPasswordWidget extends StatelessWidget {
  const SetPasswordWidget({super.key, required this.textStyle});

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Password', style: textStyle),
        const Gap(16),
        Expanded(
          child: ExcludeSemantics(
            child: PasswordBox(
              placeholder: 'Enter your password',
              onChanged: (value) {
                context.read<EnvironmentSelectionCubit>().setPassword(value);
              },
            ),
          ),
        ),
      ],
    );
  }
}
