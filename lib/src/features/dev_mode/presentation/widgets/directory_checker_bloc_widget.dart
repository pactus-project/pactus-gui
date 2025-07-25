import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/common/widgets/shimmer_card_item.dart';
import 'package:pactus_gui/src/core/enums/app_environment.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/features/dev_mode/presentation/bloc/directory_check_bloc.dart';
import 'package:pactus_gui/src/features/dev_mode/presentation/widgets/environment_radio_option.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';

class DirectoryCheckerBlocWidget extends StatelessWidget {
  const DirectoryCheckerBlocWidget({
    super.key,
    required this.textStyle,
    required this.appEnvironment,
  });

  final TextStyle textStyle;
  final AppEnvironment appEnvironment;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DirectoryCheckBloc, DirectoryCheckState>(
      builder: (context, state) {
        final status = state.networkStatuses[appEnvironment]!;

        if (status.isLoading) {
          return const ShimmerCardItem(height: 36, width: 120);
        }

        if (status.error != null) {
          return Text(
            '${context.tr(LocaleKeys.error)}'
            ': ${status.error}',
          );
        }

        if (status.isReady != null) {
          return EnvironmentRadioOption(
            environment: appEnvironment,
            isEnabled: !status.isReady!,
            disabledMessage: status.isReady!
                ? '${appEnvironment.name} directory contains files'
                : null,
            textStyle: textStyle,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
