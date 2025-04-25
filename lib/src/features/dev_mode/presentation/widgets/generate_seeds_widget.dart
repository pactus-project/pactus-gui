import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/utils/daemon_manager/seed_generator.dart';
import 'package:pactus_gui/src/features/dev_mode/presentation/bloc/environment_selection_cubit.dart';
import 'package:pactus_gui/src/features/dev_mode/presentation/bloc/environment_selection_state.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

class GenerateSeedsWidget extends StatelessWidget {
  const GenerateSeedsWidget({
    super.key,
    required this.textStyle,
  });

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Generate seed',
          style: textStyle,
        ),
        const SizedBox(width: 16),
        BlocBuilder<EnvironmentSelectionCubit, EnvironmentSelectionState>(
          builder: (context, state) {
            return Expanded(
              child: ExcludeSemantics(
                child: TextBox(
                  placeholder: 'Seed will appear here',
                  readOnly: true,
                  controller: TextEditingController(
                    text: state.seeds,
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 16),
        FilledButton(
          child: Text(
            'Generate',
            style: TextStyle(
              color: AppTheme.of(context)
                  .extension<OnAccentPallet>()!
                  .onAccentColor,
            ),
          ),
          onPressed: () {
            final generateSeed = SeedGenerator().generateSeed(12)!.sentence;
            context.read<EnvironmentSelectionCubit>().setSeeds(generateSeed);
          },
        ),
      ],
    );
  }
}
