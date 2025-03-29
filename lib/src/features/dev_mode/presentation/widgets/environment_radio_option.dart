import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui/src/core/enums/app_environment.dart';
import 'package:gui/src/features/dev_mode/presentation/bloc/environment_selection_cubit.dart';
import 'package:gui/src/features/dev_mode/presentation/bloc/environment_selection_state.dart';

class EnvironmentRadioOption extends StatelessWidget {
  const EnvironmentRadioOption({
    super.key,
    required this.environment,
    required this.textStyle,
    this.isEnabled = true,
    this.disabledMessage,
  });
  final AppEnvironment environment;
  final TextStyle textStyle;
  final bool isEnabled;
  final String? disabledMessage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnvironmentSelectionCubit, EnvironmentSelectionState>(
      builder: (context, state) {
        final isSelected = state.selectedEnvironment == environment;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 36,
                  child: RadioButton(
                    checked: isSelected && isEnabled,
                    onChanged: isEnabled
                        ? (checked) {
                            if (checked) {
                              context
                                  .read<EnvironmentSelectionCubit>()
                                  .selectEnvironment(environment);
                            }
                          }
                        : null,
                    content: Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Text(environment.name, style: textStyle),
                    ),
                  ),
                ),
                if (!isEnabled && disabledMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      disabledMessage!,
                      style: textStyle.copyWith(color: Colors.teal),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        );
      },
    );
  }
}
