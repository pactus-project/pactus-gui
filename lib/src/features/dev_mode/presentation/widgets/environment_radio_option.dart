import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pactus_gui/src/core/constants/storage_keys.dart';
import 'package:pactus_gui/src/core/enums/app_environment.dart';
import 'package:pactus_gui/src/core/router/route_name.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/core/utils/storage_utils.dart';
import 'package:pactus_gui/src/features/dev_mode/data/repositories/environment_repository.dart';
import 'package:pactus_gui/src/features/dev_mode/presentation/bloc/environment_selection_cubit.dart';
import 'package:pactus_gui/src/features/dev_mode/presentation/bloc/environment_selection_state.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart';

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
                    padding: const EdgeInsetsDirectional.only(
                      start: 8,
                      end: 8,
                      bottom: 10,
                    ),
                    child: Row(
                      spacing: 16,
                      children: [
                        Text(
                          disabledMessage!,
                          style: textStyle.copyWith(
                            color: AppTheme.of(
                              context,
                            ).extension<RedPallet>()!.red600,
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () async {
                            final repository = context
                                .read<EnvironmentRepository>();
                            final directory = await repository
                                .detectCurrentDirectoryForInitNode(
                                  latestPartOfPath: environment.name,
                                );
                            StorageUtils.saveData(
                              StorageKeys.nodeDirectory,
                              directory.path,
                            );

                            if (context.mounted) {
                              context.go(AppRoute.basicPassword.fullPath);
                            }
                          },
                          child: Row(
                            spacing: 8,
                            children: [
                              Icon(FluentIcons.icon_sets_flag),
                              Text(context.tr(LocaleKeys.startNode)),
                            ],
                          ),
                        ),
                      ],
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
